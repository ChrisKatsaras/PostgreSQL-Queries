create or replace function p2(vendorName char)returns void as $$
	declare
		prov char(10);
		custName char(10);
		custNum char(10);
		c1 cursor for (select customer.cname,customer.account,customer.province from transaction,customer,vendor
		where customer.account = transaction.account and transaction.vno = vendor.vno and vname = vendorName);
	begin
		open c1;
		loop
			fetch c1 into custName,custNum,prov;
			exit when not found;
			raise notice 'Name: % Account: % Prov: %', custName,custNum,prov;
		end loop;
		close c1;
	end;
$$ language plpgsql;
