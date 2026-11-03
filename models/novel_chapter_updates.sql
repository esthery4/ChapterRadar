-- Model: Novel Chapter Updates
-- Purpose: Compare historical chapter observations to detect updates.
-- Source: Synthetic chapter data stored in Databricks Delta Lake.
-- Technique: LAG() window function.

{{ config(materialized='view') }}

WITH chapter_history AS (
    SELECT
        title,
        chapter_number,
        check_date,
        upload_date,
        checked_at,

        -- Get the previous chapter number for each novel
        LAG(chapter_number) OVER (
            PARTITION BY title
            ORDER BY checked_at
        ) AS previous_chapter

    FROM workspace.novel_portfolio.chapter_history
)

SELECT
    *,

    -- Classify each observation based on chapter changes
    CASE
        WHEN previous_chapter IS NULL THEN 'First Check'
        WHEN chapter_number > previous_chapter THEN 'New Chapter!'
        WHEN chapter_number < previous_chapter THEN 'Chapter Decreased'
        ELSE 'No Update'
    END AS update_status

FROM chapter_history