# India Data Analyst Job Market Analysis

An end-to-end data analytics project analysing **1,561 Data Analyst job listings** across India using **Python, SQL Server, and Power BI**. The project uncovers hiring trends by location, company, experience level, and company ratings, and presents actionable insights through an interactive dashboard.

## Tech Stack
* **Python:** Pandas, NumPy, Matplotlib, Seaborn, SciPy (Data Cleaning, EDA, Hypothesis Testing, Correlation Analysis)
* **SQL Server:** Complex Queries, CTEs, Stored Procedures, Views
* **Power BI:** Data Transformation, DAX Measures, Interactive Multi-Page Dashboard

## Key Insights
* **Top Hiring Hubs:** Bengaluru leads with **336 listings**, followed by Mumbai (**165**), Hyderabad (**129**), Gurugram (**115**), and Pune (**90**).
* **Top Hiring Companies:** Diverse Lynx (**24 listings**), Right Step Consulting (**14**), HuQuo Consulting (**13**), and Coders Brain (**13**).
* **Experience Demand:** Entry-level and Mid-level roles make up the majority of openings; Senior and Very Senior roles are comparatively fewer.
* **Ratings & Reviews:** Average company rating is **3.80 / 5.0**. Review counts are heavily right-skewed (mean **~960**, median **30**), with virtually no linear correlation between rating and review count ($r = 0.0188, p = 0.529$).
* **Portal Comparison:** Independent two-sample t-test showed no statistically significant difference in company ratings between **Naukri** and **iimjobs** ($p = 0.796$).

## Power BI Dashboard

### 1. Job Market Overview
![Job Market Overview](Job%20Market%20Overview.png)

### 2. Advanced Analysis & Filters
![Advanced Analysis and Filters](Advanced%20Analysis%20%26%20Filters.png)

### 3. Insights & Summary
![Insights and Summary](Insights%20%26%20Summary.png)

## Project Structure
* `data/` — Raw dataset (`data_analyst_jobs_india.csv`)
* `notebooks/` — Python notebook for data cleaning, EDA, and statistical analysis
* `sql/` — SQL Server script with CTEs, stored procedures, and views
* `powerbi/` — Interactive Power BI dashboard file (`.pbix`)
* `images/` — Dashboard screenshots
* `docs/` — Project problem statement

## How to Use
1. Clone this repository:
   ```bash
   git clone [https://github.com/](https://github.com/)<your-username>/india-data-analyst-job-market-analysis.git

   ## Author
**Rumul Hussain Mazumdar**
