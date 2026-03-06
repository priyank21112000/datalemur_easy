/*IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during 
the third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any 
queries during this period.
Display the number of unique queries as histogram categories, 
along with the count of employees who executed that number of unique queries. 

Link to question - https://datalemur.com/questions/sql-ibm-db2-product-analytics
*/


WITH queries_per_employee AS (
  SELECT DISTINCT employee_id, COUNT(*) AS no_queries
  FROM queries
  WHERE DATE_TRUNC('month',query_starttime) BETWEEN '2023-07-01' AND '2023-09-01'
  GROUP BY employee_id
  )
  ,
zero_queries AS (
  SELECT DISTINCT employee_id, 0 AS no_queries
  FROM employees
  WHERE employee_id NOT IN (SELECT DISTINCT employee_id FROM queries_per_employee)
  )

SELECT no_queries, COUNT(employee_id) AS no_employees
FROM zero_queries
GROUP BY 1
UNION
SELECT DISTINCT no_queries, COUNT(DISTINCT employee_id)
FROM queries_per_employee
GROUP BY 1
ORDER BY 1;
