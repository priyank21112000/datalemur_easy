/*
UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) 
to call an advocate and receive support for their health care needs – whether that's claims and benefits support, 
drug coverage, pre- and post-authorisation, medical records, emergency assistance, or member portal services.
Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column.

Question link - https://datalemur.com/questions/frequent-callers

*/

-- count policy holders
WITH cte1 as (SELECT COUNT(case_id) as calls, policy_holder_id 
FROM callers
GROUP BY policy_holder_id)


SELECT COUNT (DISTINCT policy_holder_id)
FROM cte1
WHERE calls >= 3
