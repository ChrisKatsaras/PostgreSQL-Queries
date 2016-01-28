create or replace function p6()returns void as $$
	declare
		fee float;
		currentBalance float;
		vendorNum char(10);
		name char(50);
		newBal float;
		c1 cursor for select vendor.Vbalance, vendor.vno, vendor.vname from vendor;
		c2 cursor for select vendor.Vbalance, vendor.vno, vendor.vname from vendor;
	begin
		open c1;
		open c2;
		raise notice 'BEFORE CHARGE:';
		loop
			fetch c1 into currentBalance, vendorNum, name;
			exit when not found;
			fee:= currentBalance * 0.04;
			update vendor set vbalance = vbalance - fee 
				where vno = vendorNum;
			raise notice 'Vendor: % Fee: % Balance: %',name,fee,currentBalance;
			
		end loop;
		close c1;
		close c2;
		
			
		open c2;
		raise notice 'AFTER CHARGE:';
		loop
			fetch c2 into newBal, vendorNum,name;
			exit when not found;
			raise notice 'Vendor: %  New Balance: %',name,newBal;
		end loop;
		close c2;

	end;
$$ language plpgsql;
