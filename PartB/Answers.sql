
/* A1. Find the customer with the highest transaction value as of today.
Consider :
• Transaction_Status = ‘Success’
• Transaction_Type = ‘Purchase’
• Transaction_Value = NAV_Value * No_of_Units
select Customer_id, sum(NAV Value * No_of_Units) as highest from Mutual_Fund_Transaction_Table 
where Transaction_Status = 'Success' and transaction_type = 'Purchase' group by Customer_id order by highest desc limit 1; */
select Customer_id, sum(NAV_Value * No_of_Units) as highest from Mutual_Fund_Transaction_Table 
where Transaction_Status = 'success' and Transaction_Type = 'Purchase' group by Customer_id order by highest desc limit 1;

/* A2. Count of successful transactions in the month of April - 2019*/
Select count(*) from Mutual_Fund_Transaction_Table where Transaction_Status = ‘Success’ And month(Transaction_Time) = 4 and year(Transaction_Time) = 2019;

/* A3. Number of new customers in the month of Jan – 2019, who are not banned as of now and have made more than 4 purchases*/
Select count(Mutual_Fund_Transaction_Table.Customer_id) 
from Customer_Details join Mutual_Fund_Transaction_Table On Customer_Details.Customer_id = Mutual_Fund_Transaction_Table.Customer_id
Where month(Customer_Join_Time) = 1 AND year(Customer_Join_Time) = 2019 AND Banned = 0 group by Mutual_Fund_Transaction_Table.Customer_id, Transaction_Id
HAVING count(Mutual_Fund_Transaction_Table.Transaction_Id)>4;

/* A4. First 5 Rows of top paying Male & Female customers*/
select Customer_id, Customer_Name,sum(NAV_Value * No_of_Units) as m
from Customer_Details join Mutual_Fund_Transaction_Table on Mutual_Fund_Transaction_Table.Customer_id = Customer_Details.Customer_id where Transaction_Type = ‘Purchase’
group by Customer_Details.Customer_id order by m desc limit 5;

/* A5. Given the Mutal_Fund_Transaction_Table a SQL Query to create a GMV Retention plot. Month Start is the 1st Month of 2019 in which the Customer_id placed a successful order,
GMV-Month 0 is the Sum of order Total of User ids who placed their 1st Order in Month 0. Out of those User ids, GMV-Month 1 is the Sum of order Total of users who placed an order
in 1st Month + 1, Then GMV-Month 2 is 1st Month + 2 and so on till GMV-Month_6 (June-2019).*/
first_month AS (select distinct Customer_id from Mutual_Fund_Transaction_Table where month(Transaction_Time)=1 and year(Transaction_Time)=2019);
select Year(Transaction_Time), Month(Transaction_Time), count (distinct Customer_id) from Mutual_Fund_Transaction_Table 
where year(Transaction_Time)=2019 AND cust_id IN first_month GROUP BY 1, 2;
