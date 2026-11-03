# 📚 ChapterRadar
### Never miss the latest chapter of your favorite reads!

**A Personal Data Engineering & Analytics Project** by Esthery4

Tracking chapter updates with **Python, SQL, Databricks, and dbt**.

*Python | SQL | Databricks | dbt Core | Data Visualization*

## ✨ About the Project

As someone who enjoys reading, especially fictional novels and manga, I wanted to create something that could help me keep track of new chapter releases without having to check each title individually.

I also wanted to challenge myself to apply my data analytics and information systems knowledge to something I personally enjoy.

That's how **ChapterRadar** came about!

This project uses Python, Databricks, SQL, and dbt to track chapter changes, maintain historical records, and display updates through an interactive dashboard.

For this portfolio demonstration, I created a synthetic dataset with **8 titles and 56 chapter observations**.

Feel free to use this project as a starting point and customize it for your favorite reading platforms!

## 🎯 What I Wanted to Solve

When you're following multiple titles, it's easy to lose track of which ones have new chapters and which ones haven't been updated.

I wanted to explore how data could make this process easier.

My goals were to:

- Keep track of the latest chapter for each title.
- Identify when a new chapter is detected.
- Maintain a history of chapter observations.
- Create a dashboard that's simple and easy to navigate.

Although this is a personal project, the same approach can be applied to business problems involving data monitoring, change detection, and reporting.

## 🛠️ Tools & Technologies

| Tool | How I Used It |
|---|---|
| **Python** | Generated and organized sample chapter data |
| **Databricks** | Stored historical observations in Delta Lake |
| **SQL** | Compared chapter numbers and detected changes |
| **dbt Core** | Built data models and tested data quality |
| **Databricks AI/BI** | Created an interactive dashboard |
| **GitHub** | Documented and shared the project |

## 🔄 How It Works

**Python → CSV → Databricks Delta Lake → dbt & SQL → Dashboard**

**1. Generate the data**

I used Python to create sample chapter observations across eight titles. Some chapters increase over time, while others remain unchanged to represent days without updates.

**2. Store the data**

The observations are loaded into Databricks, where they can be stored and analyzed.

**3. Identify chapter updates**

Using SQL and dbt, I built two models:

- `novel_chapter_updates` uses `LAG()` to compare each chapter with the previous observation and identify changes.
- `latest_novel_status` uses `ROW_NUMBER()` to find the latest chapter and update status for each title.

**4. Test the data**

I implemented four dbt tests to check for missing values and duplicate titles in the latest-status model. All four tests passed during development.

**5. Visualize the results**

Finally, I created an interactive Databricks dashboard that shows chapter progression, recent updates, and the latest chapter for each title.

## 📊 Dashboard

The **Chapter Tracker** dashboard makes it easy to see which titles have new chapters and which ones haven't changed.

It includes:

- Total titles tracked
- New chapter activity
- Chapter progression over time
- Latest chapter numbers and update statuses
- Title and date filters

*Dashboard screenshot coming soon.*

## 💡 What I Learned

One of my biggest takeaways was learning that **collecting data and making sense of data are two different things**.

For example, I initially thought repeated chapter numbers might look like duplicate records. But I realized those observations were actually important because they showed when a title hadn't been updated.

Using SQL window functions helped me understand how historical data can be used to identify meaningful changes.

I also gained more hands-on experience with Databricks and dbt, especially how data models, testing, and visualization work together in a data pipeline.

As an MBA student with a background in MIS and Finance, I enjoyed being able to combine my technical skills with something creative and personally interesting.

## 🚀 What's Next?

There are a few features I'd love to explore as I continue improving this project:

- Connect to reliable sources for real chapter updates.
- Automate daily chapter checks.
- Send notifications when new chapters are detected.
- Explore more useful metrics and dashboard features.

## 📁 Project Files

| File | Description |
|---|---|
| `generate_sample_data.py` | Generates synthetic chapter observations |
| `sample_chapter_history.csv` | Sample dataset |
| `models/novel_chapter_updates.sql` | Detects chapter changes |
| `models/latest_novel_status.sql` | Identifies the latest chapter for each title |
| `models/schema.yml` | Defines dbt data quality tests |
| `dbt_project.yml` | Configures the dbt project |

## ▶️ Running the Project

1. Generate the dataset with `python generate_sample_data.py`.
2. Import the CSV into the Databricks table `workspace.novel_portfolio.chapter_history`.
3. Configure your local Databricks connection in `profiles.yml`.
4. Run `dbt run --profiles-dir .` to build the models.
5. Run `dbt test --profiles-dir .` to validate the data.
6. Use the transformed views to build or explore a Databricks dashboard.

## 📝 A Note About the Data

This project uses simulated chapter observations for educational and portfolio purposes. Some titles reference existing published works, but the chapter numbers, dates, and release events are fictional and do not represent actual publication activity.

This repository provides a starting point for building your own tracker. Connecting a reading platform and automating chapter collection would require additional development.