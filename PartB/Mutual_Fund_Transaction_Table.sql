create table Mutual_Fund_Transaction_Table(
Transaction_Id int auto_increment primary key, Customer_id int, Transaction_Type enum('purchase','sale'), NAV Value int, No_of_Units int,
Transaction_Time date, Transaction_Status enum('success','failed','pending'), foreign key(customer_id) references customer_details(customer_id)
);
