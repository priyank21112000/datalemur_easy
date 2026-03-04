/*Given a table containing information about bank deposits and withdrawals made using Paypal, 
write a query to retrieve the final account balance for each account, 
taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.

Link to question - https://datalemur.com/questions/final-account-balance

*/
-- Input grain - transactions - includes both deposit and withdrawal
-- Output grain - group by account id
-- Based on transaction type

SELECT account_id,
SUM(CASE WHEN transaction_type = 'Deposit' THEN amount
         WHEN transaction_type = 'Withdrawal' THEN -amount
         ELSE 0
    END) AS final_balance

FROM transactions
GROUP BY account_id

/*Mental Model You Must Lock In
When calculating net balance:
You do NOT aggregate inside CASE.
You transform rows first.
Then aggregate.

Interview Trap #1 — GROUP BY transaction_type
Many candidates accidentally do:
GROUP BY account_id, transaction_type
That gives two rows per account.
Wrong grain.

*/
