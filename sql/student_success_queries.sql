-- Student Dropout & Academic Success SQL Analysis
-- (Data from Kaggle: Predict Students' Dropout and Academic Success)


-- Big Question: What student characteristics and academic behaviors are associated with dropout vs. graduation outcomes?


-- Query 1) Outcome Distribution
-- Main question: What is the overall breakdown of student outcomes?

SELECT
    Target                                               AS outcome,
    COUNT(*)                                            AS total_students,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students), 2) AS pct_of_total
FROM students
GROUP BY Target
ORDER BY total_students DESC;


-- Query 2) Dropout Rate by Gender
-- Main question: Are there major differences in dropout rates between male and female students?
-- (Note: Gender encoding: 0 = Female, 1 = Male)

SELECT
    CASE WHEN Gender = 0 THEN 'Female'
         WHEN Gender = 1 THEN 'Male'
    END                                                 AS gender,
    COUNT(*)                                            AS total_students,
    SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) AS dropouts,
    ROUND(SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM students
GROUP BY Gender
ORDER BY dropout_rate_pct DESC;


-- Query 3) Dropout Rate by Scholarship Status
-- Main question: Do scholarship holders drop out at lower rates than non-scholarship students?
-- (Note: Scholarship holder encoding: 0 = No, 1 = Yes)

SELECT
    CASE WHEN "Scholarship holder" = 1 THEN 'Scholarship Holder'
         ELSE 'No Scholarship'
    END                                                 AS scholarship_status,
    COUNT(*)                                            AS total_students,
    SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) AS dropouts,
    ROUND(SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM students
GROUP BY "Scholarship holder"
ORDER BY dropout_rate_pct DESC;


-- Query 4) Dropout Rate by Tuition Payment Status
-- Main question: Are students with overdue tuition fees more likely to drop out?
-- (Note: Tuition fees up to date encoding: 0 = Not up to date, 1 = Up to date)

SELECT
    CASE WHEN "Tuition fees up to date" = 1 THEN 'Fees Up to Date'
         ELSE 'Fees NOT Up to Date'
    END                                                 AS tuition_status,
    COUNT(*)                                            AS total_students,
    SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) AS dropouts,
    ROUND(SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM students
GROUP BY "Tuition fees up to date"
ORDER BY dropout_rate_pct DESC;


-- Query 5) Dropout Rate by Debtor Status
-- Main question: Do students with outstanding debt drop out at higher rates?
-- (Note: Debtor encoding: 0 = No, 1 = Yes)

SELECT
    CASE WHEN Debtor = 1 THEN 'Debtor'
         ELSE 'Non-Debtor'
    END                                                 AS debtor_status,
    COUNT(*)                                            AS total_students,
    SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) AS dropouts,
    ROUND(SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM students
GROUP BY Debtor
ORDER BY dropout_rate_pct DESC;


-- Query 6) Academic Performance by Outcome
-- Main question: How does first semester academic performance differ between students who graduate or drop out?

SELECT
    Target                                               AS outcome,
    COUNT(*)                                            AS total_students,
    ROUND(AVG("Curricular units 1st sem (enrolled)"), 2) AS avg_units_enrolled,
    ROUND(AVG("Curricular units 1st sem (approved)"), 2) AS avg_units_approved,
    ROUND(AVG("Curricular units 1st sem (grade)"), 2)    AS avg_grade
FROM students
GROUP BY Target
ORDER BY avg_units_approved DESC;


-- Query 7) High Risk Student Flags
-- Main question: Which students show multiple risk factors simultaneously (debtor, tuition not up to date, zero units approved)? 

SELECT
    COUNT(*)                                            AS high_risk_students,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students), 2) AS pct_of_total,
    SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) AS actual_dropouts,
    ROUND(SUM(CASE WHEN Target = 'Dropout' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS dropout_rate_pct
FROM students
WHERE Debtor = 1
  AND "Tuition fees up to date" = 0
  AND "Curricular units 1st sem (approved)" = 0;