create or replace function p1(name char)returns void as $$
	declare 
		vendor_name char(20);
		theDate Date;
		amount float;
		c1 cursor for (select vendor.vname, transaction.t_date,transaction.amount from transaction,customer,vendor
		where customer.account = transaction.account and transaction.vno = vendor.vno and cname = name);
	begin
		open c1;
		loop
			fetch c1 into vendor_name, theDate, amount;
			exit when not found;
			raise notice'Vendor: % Date: % Amount: %', vendor_name, theDate, amount;
		end loop;
		close c1;
	end;
$$ language plpgsql;
