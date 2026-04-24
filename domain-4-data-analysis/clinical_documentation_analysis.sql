-- Project 01: Clinical Documentation Performance Analysis
-- Dataset: datasets/synthetic_clinical_documentation_data.csv
-- Note: This SQL is written using generic table and column names.
-- All data is synthetic and does not represent any real healthcare organization.

-- Assumed table name after importing CSV:
-- clinical_documentation

-- 1. Total documentation volume by note status
SELECT
    note_status,
    COUNT(*) AS total_notes
FROM clinical_documentation
GROUP BY note_status
ORDER BY total_notes DESC;

-- 2. Note type distribution
SELECT
    note_type,
    COUNT(*) AS total_notes
FROM clinical_documentation
GROUP BY note_type
ORDER BY total_notes DESC;

-- 3. Unsigned or incomplete documentation by department
SELECT
    department,
    COUNT(*) AS incomplete_notes
FROM clinical_documentation
WHERE note_status IN ('Unsigned', 'Pending Review', 'In Progress')
GROUP BY department
ORDER BY incomplete_notes DESC;

-- 4. Average days to sign by department
SELECT
    department,
    ROUND(AVG(days_to_sign), 2) AS avg_days_to_sign
FROM clinical_documentation
WHERE note_status = 'Signed'
GROUP BY department
ORDER BY avg_days_to_sign DESC;

-- 5. Overdue documentation rate by department
SELECT
    department,
    COUNT(*) AS total_notes,
    SUM(CASE WHEN is_overdue = 'Yes' THEN 1 ELSE 0 END) AS overdue_notes,
    ROUND(
        100.0 * SUM(CASE WHEN is_overdue = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS overdue_rate_percent
FROM clinical_documentation
GROUP BY department
ORDER BY overdue_rate_percent DESC;

-- 6. Provider-level documentation follow-up list
SELECT
    provider_id,
    department,
    COUNT(*) AS overdue_notes
FROM clinical_documentation
WHERE is_overdue = 'Yes'
GROUP BY provider_id, department
HAVING COUNT(*) >= 3
ORDER BY overdue_notes DESC;

-- 7. Monthly documentation volume trend
SELECT
    strftime('%Y-%m', created_date) AS documentation_month,
    COUNT(*) AS total_notes
FROM clinical_documentation
GROUP BY strftime('%Y-%m', created_date)
ORDER BY documentation_month;
