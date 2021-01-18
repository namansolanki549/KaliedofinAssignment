create table Customer_Details(
Customer_ID int auto_increment primary key, Customer_Name varchar(100), Customer_PAN varchar(100), Banned boolean, Customer_Join_Time date, Gender enum('male','female')
);
