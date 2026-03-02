/*
Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.

Link to question - https://datalemur.com/questions/sql-avg-review-ratings */

-- average star rating for each product grouped by MONTH
-- Output Grain - One row represents one product in one month.Grain = (month, product_id)

SELECT EXTRACT(MONTH FROM submit_Date) AS mth,product_id, ROUND(AVG(stars), 2) as avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product_id

/*Hidden Interview Trap #1 — Year Ignored

You grouped only by MONTH.
What happens if data spans multiple years?
January 2022 and January 2023 would merge.
That’s usually wrong unless question explicitly ignores year.*/
