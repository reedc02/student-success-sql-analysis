# Student Dropout & Academic Success SQL Analysis

Data Source: [Kaggle — Predict Students' Dropout and Academic Success](https://www.kaggle.com/datasets/ankanhore545/dropout-or-academic-success)

Tools: SQL (SQLite)

Author: Courtney Reed  

GitHub: [reedc02](https://github.com/reedc02) 

---------------------------------------------

## Overview
SQL analysis of 4,424 higher education students. Examines how academic performance and
financial factors relate to dropout outcomes. This project focuses on audit-style and 
compliance-oriented queries to highlight risk indicators such as unpaid tuition,
debt status, and early academic performance.


## Big Question
What student characteristics and academic behaviors are most strongly associated 
with dropout vs. graduation outcomes?

---------------------------------------------


## Queries & Business Questions

Query 1: Outcome Distribution
Question: What is the overall breakdown of student outcomes? 

Query 2: Dropout Rate by Gender
Question: Is there a significant difference in dropout rates by gender? 

Query 3: Dropout Rate by Scholarship Status
Question: Do students with scholarships drop out at lower rates? 

Query 4: Dropout Rate by Tuition Payment Status
Question: Are students with overdue tuition more likely to drop out? 

Query 5: Dropout Rate by Debtor Status
Question: Do students with outstanding debt drop out at higher rates? 

Query 6: Academic Performance by Outcome
Question: How does first semester performance differ across outcomes? 

Query 7: High Risk Student Flags
Question: Which students show multiple risk factors simultaneously? 

---------------------------------------------


## Key Findings

- Query 1 (Overall outcomes): 49.93% of students graduate, 32.12% drop out, and 17.95% 
  remain enrolled. This shows that about 1 in 3 students does not complete their degree.

- Query 2: (Gender gap): Male students drop out at a rate of 45.05%,
  while female students drop out at a rate of 25.10%. This ~20% point gap suggests
  a significant retention disparity worth flagging for potential retention efforts.

- Query 3 (Scholarship impact): Scholarship holders are far more likely to graduate.
  Students without scholarships drop out at a rate of 38.71%, versus just 12.19% for
  non-scholarship holders. (over 3x higher dropout rate for non-scholarship holders).This
  suggests that financial aid is a major protective factor against dropping out.

- Query 4 (Tuition payment): Tuition payment status is the strongest dropout risk
  indicator. Students with unpaid tuition drop out at a rate of 86.55%, versus 24.74%
  for students up to date on their payments.

- Query 5: (Debtor status): Debtors have a drop out rate of 62.03%, while non-debtors
  drop out at a rate of 28.28%. This is more than double the risk, which further 
  highlights the impact of financial strains on student success. 

- Query 6 (Academic performance): Graduate students approved an average of 6.23 units 
  in semester 1 with an average grade of 12.64, while dropout students approved only
  2.55 units with an average grade of 7.26. This shows that early academic performance
  is a noteworthy separator between outcomes.

- Query 7 (High risk students): 89 students (2.01% of the dataset) meet all risk
  criteria (debtor status, unpaid tuition, early academic performance), and 92.13%
  of them drop out. This near-universal dropout rate among multiply at-risk students
  stresses the value of early multi-factor risk screening for proactive student
  intervention.


These findings showcase clear opportunities for early intervention, especialy regarding tuition compliance, financial aid support, and early academic performance.
---------------------------------------------


## How to Run

1. Clone or download the repo
2. Open [DB Browser for SQLite](https://sqlitebrowser.org/)
3. Create a new database and import `dataset.csv` from the `data/` folder as a table 
   named `students`
4. Open the **Execute SQL** tab and run queries from `sql/student_success_queries.sql`
