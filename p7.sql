create or replace function p7()returns void as $$
	declare
		customerName char(25);
		creditLimit float;
		accountNum char(10);
		creditBalance float;
		serviceFee float;
		c1 cursor for select cname, cbalance, crlimit,account from customer where cbalance > crlimit;
		c2 cursor for select cname, cbalance, crlimit from customer where cbalance > crlimit;
	begin
		open c1;
		raise notice 'CUSTOMERS OVER LIMIT:';	
		loop
			fetch c1 into customerName, creditBalance, creditLimit,accountNum;
			exit when not found;
			raise notice 'Name: % Balance: % Limit: %', customerName, creditBalance,creditLimit;
			serviceFee:= (creditBalance - creditLimit) * 0.1;
			raise notice 'Service Fee: %',serviceFee;
			update customer set cbalance = cbalance + serviceFee
				where account = accountNum;
		end loop;
		close c1;

		open c2;
		raise notice 'CUSTOMERS OVER LIMIT NEW BALANCE:';	
		loop
			fetch c2 into customerName,creditBalance,creditLimit;
			exit when not found;
			raise notice 'Name: % Balance: % Limit: %', customerName, creditBalance, creditLimit;
		end loop;		
		close c2;


	end;
$$ language plpgsql;
