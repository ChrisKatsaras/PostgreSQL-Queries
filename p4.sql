create or replace function p4()returns void as $$
	declare
		custname char(30);
		accountNum char(10);
		amount float;
		vendor_name char(25);
		recentDate Date;		

		c1 cursor for   select customer.cname, transaction.t_date, transaction.amount,vendor.vname,transaction.account
				from customer, transaction, vendor
				where customer.account = transaction.account and transaction.vno = vendor.vno and transaction.t_date
				in(select MAX(t2.t_date) 
				from transaction t2
				where t2.account = transaction.account);
		
	begin
		open c1;
		loop
		fetch from c1 into custName,recentDate, amount, vendor_name,accountNum; 
		exit when not found;
		raise notice 'Account Number: % Name: % Amount: % Vendor Name: % Date: %',accountNum ,custname, amount, vendor_name, recentDate;
		end loop;
		close c1;
	end;

$$ language plpgsql;
