CREATE TABLE Vendor(Vno char(5) PRIMARY KEY, Vname char(20), City char(20), Vbalance float);
CREATE TABLE Customer(Account char(5) PRIMARY KEY, Cname char(50), Province char(10), Cbalance float, Crlimit float);
CREATE TABLE Transaction(Tno char(5) PRIMARY KEY, Vno char(5) REFERENCES Vendor(Vno),Account char(5) REFERENCES Customer(Account), T_Date Date, Amount float);

INSERT INTO Vendor VALUES('V1','Sears','Toronto', 200.00);
INSERT INTO Vendor VALUES('V2','WalMart','Waterloo',671.05);
INSERT INTO Vendor VALUES('V3','Esso','Windsor',0.00);
INSERT INTO Vendor VALUES('V4','Esso','Waterloo',225.00);

INSERT INTO Customer VALUES('A1','Smith','ONT',2515.00,2000);
INSERT INTO Customer VALUES('A2','Jones','BC',2014.00,2500);
INSERT INTO Customer VALUES('A3','Doc','ONT',150.00,1000);

INSERT INTO Transaction VALUES('T1','V2','A1','2015-07-15',1325.00);
INSERT INTO Transaction VALUES('T2','V2','A3','2014-12-16',1900.00);
INSERT INTO Transaction VALUES('T3','V3','A1','2015-09-01',2500.00);
INSERT INTO Transaction VALUES('T4','V4','A2','2015-03-20',1613.00);
INSERT INTO Transaction VALUES('T5','V4','A3','2015-07-31',3312.00); 
