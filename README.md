# Healthcare Research & Data Analysis – Medinova Health Analytics

[View Project](https://github.com/akash-mailapalli/Healthcare-Research-Data-Analysis)

## Project Overview

This project analyzes hospital data to understand **patient trends, treatment outcomes, and hospital operational performance**. The goal is to transform raw healthcare data into meaningful insights that can help hospital management improve decision-making, patient care, and operational efficiency.

The project demonstrates an **end-to-end data analytics workflow** including data exploration, SQL analysis, Python EDA, and interactive Power BI dashboards.

---

## Business Problem

Hospitals generate large volumes of patient and operational data, but extracting insights from this data can be challenging.

This project aims to answer key questions such as:

* How is patient volume changing over time?
* Which hospital departments handle the most patients?
* What treatment types are most common?
* What is the patient outcome distribution?
* Which cities contribute the most patients?
* How are hospital operations performing (wait time, length of stay, satisfaction)?

---

## Tools & Technologies

* **SQL Server** – Data analysis and querying
* **Python (Pandas, Seaborn, Matplotlib)** – Exploratory Data Analysis (EDA)
* **Power BI** – Interactive dashboard development
* **Excel / CSV** – Data storage and preprocessing

---

## Dataset Description

The dataset simulates real hospital operations and includes information about:

* Patient demographics
* Hospital visits
* Treatment types
* Departments
* Patient outcomes
* Operational metrics

### Main Tables

* **Patients** – Patient demographic information
* **Visits** – Patient visit records and treatment details
* **Doctors** – Department and doctor information
* **Operations** – Hospital operational metrics

---

## Dashboard Overview

### 1. Executive Overview

This page provides a high-level summary of hospital performance.

Key insights include:

* Total visits and patient trends
* Top performing departments
* Treatment distribution
* Patient outcomes
* Geographic distribution of patients

---

### 2. Patient Analytics

Focuses on understanding **patient demographics and behavior**.

Insights include:

* Patient growth trend over time
* Age group distribution
* Patient distribution across cities
* Gender distribution analysis

---

### 3. Hospital Operations

Analyzes hospital efficiency and operational performance.

Metrics include:

* Average wait time
* Average length of stay
* Patient satisfaction
* Operational trends across years

---

### 4. Department Analysis (Drillthrough)

Allows deeper investigation of each department.

Provides insights into:

* Department performance
* Treatment distribution
* Patient outcomes
* Patient geographic distribution

---

### 5. Treatment Analysis (Drillthrough)

Analyzes treatment types and their performance.

Insights include:

* Treatment trends
* Department usage by treatment
* Patient outcomes by treatment
* Patient distribution across cities

---

## Key Insights

Some example insights derived from the dashboard:

* Neurology handles the **highest number of patients**, indicating a major service demand.
* **Senior patients represent the largest patient group**, highlighting the importance of geriatric care.
* The **patient distribution across cities is balanced**, with Visakhapatnam and Mumbai contributing significant volumes.
* Hospital visits remained stable from **2023–2025**, with a noticeable decline in 2026.
* Patient outcomes show a balanced distribution across **recovered, improving, stable, and critical cases**.

---

## Project Workflow

1. Data collection and preparation
2. SQL data exploration and analysis
3. Python EDA for trend and pattern discovery
4. Power BI dashboard development
5. Business insights generation

---

## Project Structure

```
Healthcare-Research-Data-Analysis
│
├── data
│   ├── patients.csv
│   ├── visits.csv
│   ├── doctors.csv
│   └── operations.csv
│
├── sql
│   └── healthcare_analysis.sql
│
├── python
│   └── eda_analysis.ipynb
│
├── powerbi
│   └── healthcare_dashboard.pbix
│
└── README.md
```

---

## Dashboard Preview

(Add screenshots of your Power BI dashboards here)

* Executive Overview
<img width="1017" height="615" alt="Screenshot 2026-03-17 120803" src="https://github.com/user-attachments/assets/3660dc32-bd38-47c7-8ddc-0d73e60a7e53" />

* Patient Analytics
<img width="1014" height="624" alt="Screenshot 2026-03-17 120835" src="https://github.com/user-attachments/assets/14bcc93b-6ff0-4fa0-bea6-ee2b15783d7f" />

* Hospital Operations
<img width="1020" height="574" alt="Screenshot 2026-03-17 121357" src="https://github.com/user-attachments/assets/815732f3-e008-4212-aaa9-5a262f70fdb6" />

* Department Analysis (Drillthrough)
<img width="1019" height="603" alt="Screenshot 2026-03-17 120817" src="https://github.com/user-attachments/assets/b3359e51-44c4-414a-8aeb-7be0289a6e72" />

* Treatment Analysis (Drillthrough)
<img width="1012" height="642" alt="Screenshot 2026-03-17 120826" src="https://github.com/user-attachments/assets/e663d375-f442-4ab6-a8e9-867c6f3b59ff" />

---

## Conclusion

This project demonstrates how healthcare data can be transformed into actionable insights using modern data analytics tools. The dashboards enable stakeholders to monitor hospital performance, understand patient behavior, and identify opportunities for operational improvements.

---

## Author

**Akash**

Data Analyst | SQL | Python | Power BI | Excel
