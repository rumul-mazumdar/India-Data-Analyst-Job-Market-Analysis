create database DataAnalystJobAnalysis;

use DataAnalystJobAnalysis;

select * from DataAnalystJobs;

--1. Complex Queries:
--○ Write a query to find the top 5 companies with the highest average
--job ratings.

SELECT TOP 5
    Company,
    AVG(rating) AS Average_rating
FROM DataAnalystJobs
WHERE rating IS NOT NULL
GROUP BY company
ORDER BY average_rating DESC;


--○ UseCommonTable Expressions (CTEs) to calculate the average
--'base salary' and 'max salary' for each location and find locations
--with an average salary above a certain threshold.

--Let's use ₹5,00,000 as our threshold.

WITH LocationSalary AS
(
    SELECT
        location,
        AVG(base_salary) AS Avg_base_salary,
        AVG(max_salary) AS Avg_max_salary
    FROM DataAnalystJobs
    WHERE [base_salary] IS NOT NULL
      AND [max_salary] IS NOT NULL
    GROUP BY location
)
SELECT
    location,
    Avg_base_salary,
    Avg_max_salary
FROM LocationSalary
WHERE avg_base_salary > 500000
ORDER BY avg_base_salary DESC;

/*
2. Stored Procedures:
○ Create a stored procedure to update the 'experience' column by
extracting the minimum and maximum years from the 'experience'
string and updating 'min exp' and 'max exp' columns.
*/

CREATE OR ALTER PROCEDURE UpdateExperience
AS
BEGIN

    UPDATE DataAnalystJobs
    SET
        min_exp = TRY_CONVERT(
                        INT,
                        LEFT(experience, CHARINDEX('-', experience) - 1)
                    ),

        max_exp = TRY_CONVERT(
                        INT,
                        SUBSTRING(
                            experience,
                            CHARINDEX('-', experience) + 1,
                            CHARINDEX(' Yrs', experience)
                                - 
                            (CHARINDEX('-', experience) + 1)
                        )
                    )
    WHERE experience IS NOT NULL
      AND CHARINDEX('-', experience) > 0
      AND CHARINDEX(' Yrs', experience) > 0;

END;


EXEC UpdateExperience;

SELECT TOP 20
    experience,
    min_exp,
    max_exp
FROM DataAnalystJobs;

/*
3. Triggers:
○ Write a trigger to automatically update the 'jobListed(days ago)'
column based on the current date and the 'postedIn' date when a
new job is inserted into the table. 
*/

sp_help DataAnalystJobs;


/*

The assignment refers to postedIn as a posting date, but in the provided dataset postedIn contains
the job portal name (Naukri/iimjobs) and no posting-date column is available. Therefore, the requested 
calculation cannot be performed directly using the provided data.

*/


/*
4. Views:
○ Create a view to display job listings with complete salary information
(base salary and max salary) and filter out jobs with missing salary
data.
*/

CREATE OR ALTER VIEW vw_CompleteSalaryJobs
AS
SELECT
    JobID,
    job_title,
    company,
    experience,
    min_exp,
    max_exp,
    base_salary,
    max_salary,
    location,
    postedIn,
    rating
FROM DataAnalystJobs
WHERE base_salary IS NOT NULL
  AND max_salary IS NOT NULL;


SELECT TOP 10
    job_title,
    company,
    base_salary,
    max_salary
FROM vw_CompleteSalaryJobs
ORDER BY max_salary DESC;
