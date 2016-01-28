create or replace function p5()returns void as $$
	declare
		vendorNum char(10);
		vendorNumComp char(10);
		vendorName char(30);
		newBalance float;
		answer float;
		c1 cursor for select sum(transaction.amount),transaction.vno from transaction group by transaction.vno;
		c2 cursor for select vendor.vname,vendor.vno,vendor.vbalance from vendor;
	begin
		open c1;
		loop
			fetch c1 into newBalance,vendorNum;

				update vendor set vbalance = vbalance + newBalance
					where vendor.vno = vendorNum;
			
			
			exit when not found;
		end loop;
		close c1;

		open c2;
		loop
		
			fetch c2 into vendorName, vendorNum,answer;
			exit when not found;
			raise notice 'Vendor name: % Vendor Num: % New Balance : %', vendorName, vendorNum,answer;
		
		end loop;
		close c2;	
	end;
$$ language plpgsql;
