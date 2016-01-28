
#Christopher Katsaras


##FILES: a3data.sql , p1,2,3,4,5,6,7,8.sql , README

#HOW TO RUN:

1.To run properly first run a3data.sql to initialize the tables and their data.

(My three tables are called Vendor, Customer and Transaction)
PLEASE NOTE:
The primary key for Vendor is Vno
The primary key for Customer is Account
The primary key for Transaction is Tno
*This means you cannot add a new row with the same valued primary key

2.Run a specific sql script e.g p1.sql
3.To run their function type the name of the script with their specific parameters. e.g p1.sql function is p1(argument);



#FUNCTIONS:

p1.sql - p1(name char) -Takes 1 argument   
p2.sql - p2(vendorName char) - Take 1 argument   
p3.sql - p3(account char, name char, province char, lim float) - Takes 4 arguments   
p4.sql - p4() - Takes no arguments   
p5.sql - p5() - Takes no arguments   
p6.sql - p6() - Takes no arguments   
p7.sql - p7() - Takes no arguments   
p8.sql - p8(trasNum char,vendorNum char,accountNum char,amount float) - Takes 4 arguments   


#Limitations:
For p4.sql the output will be for the most recent transactions of customers that have a transaction. It will NOT display "no transaction" if the customer does not have one.
