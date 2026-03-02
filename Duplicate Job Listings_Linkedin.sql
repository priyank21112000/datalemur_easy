/*This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.

Definition:

Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

-- COUNT OF COMPANIES
-- DUPLICATE COMPANY ID EQUAL, TITLE AND DESCRIPTION EQUAL
-- Input grain - one row - one job listing
-- duplicate - same title, job description, appears more than once
-- output - count of ALL the companies that have duplicate listings

Link to question - https://datalemur.com/questions/duplicate-job-listings
*/

WITH cte1 as
(SELECT title, description, company_id, count(job_id) as job_count
FROM job_listings
GROUP BY company_id, title, description)

SELECT COUNT (DISTINCT company_id) from cte1 
WHERE job_count > 1;

/*
Interview Trap #1 — Counting Duplicate Groups Instead of Companies
Company 345 has:

2 duplicate Data Analyst jobs
3 duplicate Data Engineer jobs

Your grouped query would produce 2 rows with job_count > 1.
If you just count those rows → you get 2.
But correct answer is 1 company.
A classic overcounting trap.

Rule: When question asks for companies, your final aggregation must be at company grain.

Mental Model: Aggregation Ladder
Level 1 → job listings (raw rows)
Level 2 → duplicate groups (company + title + description)
Level 3 → companies that have at least one duplicate
Level 4 → count those companies  */
