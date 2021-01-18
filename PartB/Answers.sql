
/* A1. Find the customer with the highest transaction value as of today.
/* Consider :
/* • Transaction_Status = ‘Success’
/* • Transaction_Type = ‘Purchase’
/* • Transaction_Value = NAV_Value * No_of_Units
select Customer_id, sum(NAV Value * No_of_Units) as highest from Mutual_Fund_Transaction_Table 
where Transaction_Status = 'Success' and transaction_type = 'Purchase' group by Customer_id order by highest desc limit 1;

