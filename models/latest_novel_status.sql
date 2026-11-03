
-- Model: Latest Novel Status
-- Purpose: Show the most recent chapter observation for each novel.
-- Technique: ROW_NUMBER() ranks observations from newest to oldest.

{{ config(materialized='view') }}

WITH ranked_novels AS (
    SELECT
        title,
        chapter_number,
        previous_chapter,
        check_date,
        upload_date,
        checked_at,
        update_status,

        -- Assign a rank to each observation within each novel
        ROW_NUMBER() OVER (
            PARTITION BY title
            ORDER BY checked_at DESC
        ) AS row_num

    FROM {{ ref('novel_chapter_updates') }}
)

-- Keep only the most recent observation per novel
SELECT
    title,
    chapter_number,
    previous_chapter,
    check_date,
    upload_date,
    checked_at,
    update_status
FROM ranked_novels
WHERE row_num = 1
