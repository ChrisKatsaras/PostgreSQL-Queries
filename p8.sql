create or replace function p8(trasNum char,vendorNum char,accountNum char,amount float)returns void as $$
	declare
	currentDate Date;

	vendorNumber char(10);
	vendorName char(30);
	theCity char(20);
	vendorBalance float;

	custAccount char(10);
	custName char (30);
	prov char(10);
	custBalance float;
	custLimit float;

	transactionNum char(10);
	transDate Date;
	transAmount float;

	c2 cursor for select * from vendor;
	c3 cursor for select * from customer;
	c4 cursor for select * from transaction;

	begin
		
		currentDate:= CURRENT_DATE;
			
		INSERT INTO Transaction VALUES(trasNum,vendorNum,accountNum,currentDate,amount);
			

		update customer set cbalance = cbalance + amount
                                where account = accountNum;

		update vendor set vbalance = vbalance + amount
				where vno = vendorNum;			
	
	raise notice 'TABLES AFTER UPDATES';
	open c2;
	loop
		fetch c2 into vendorNumber, vendorName, theCity, vendorBalance;
		exit when not found;
		raise notice 'Vno: % Vname: % City: % Vbalance: %',vendorNumber,vendorName,theCity,vendorBalance; 

	end loop;
	close c2;

	raise notice '';

	open c3;
	loop
		fetch c3 into custAccount, custName, prov, custBalance, custLimit;
		exit when not found;
		raise notice 'Account: % Cname: % Prov: % Cbalance: % Crlimit: %',custAccount,custName,prov,custBalance,custLimit; 
	end loop;
	close c3;

	raise notice '';

	open c4;
	loop
		fetch c4 into transactionNum,vendorNumber,custAccount,transDate,transAmount;
		exit when not found;
		raise notice 'Tno: % Vno: % Account: % T_Date: % Amount: %',transactionNum,vendorNumber,custAccount,transDate,transAmount;

	end loop;
	close c4;

	end;
$$ language plpgsql;
