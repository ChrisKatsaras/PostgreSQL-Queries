create or replace function p3(account char, name char, province char, lim float) returns void as $$
	declare
		custname char(50);
		accountNum char(10);
		amount float;
		limVar float;
		prov char(10);
		c1 cursor for (select * from customer);
	begin
		INSERT INTO Customer VALUES(account, name, province, 0 ,lim);
		open c1;
		loop
			fetch c1 into accountNum,custname,prov,amount,limVar;
			exit when not found;
			raise notice 'Account: % Name: % Province: % Balance: % Limit: %',accountNum,custname,prov,amount,limVar;
		end loop;
		close c1;
	end;
$$ language plpgsql;
