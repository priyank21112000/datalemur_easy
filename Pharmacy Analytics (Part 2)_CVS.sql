/*CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. 
Each drug is exclusively manufactured by a single manufacturer.
Write a query to identify the manufacturers associated with the drugs that resulted in losses for 
CVS Health and calculate the total amount of losses incurred.
Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. 
Display the results sorted in descending order with the highest losses displayed at the top.

Link to question - https://datalemur.com/questions/non-profitable-drugs
*/

-- Input Grain - sales per drug
-- Output Grain - Group by manufacturer, count(drug), Sum(loss)
-- We have cost of goods - buy amount
-- Total sales - sell amount
-- Number of drugs could be more than one

WITH cte1 as (

SELECT manufacturer, drug, total_sales, cogs
FROM pharmacy_sales
WHERE cogs>total_sales
)

SELECT manufacturer, COUNT(drug), SUM(cogs - total_sales) AS total_loss
FROM cte1
GROUP BY manufacturer
ORDER BY total_loss DESC
