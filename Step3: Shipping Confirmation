set heading off
set feedback off
set echo off
set verify off

prompt 
prompt *           -- S H I P P I N G   C O N F I R M A T I O N --           *
prompt
accept vordnum prompt 'Please enter the Order Number: '

select 'Order Number: '||ordnum
	from orders
	where ordnum = '&vordnum';
select 'Order Date: '||orddate
	from orders
	where ordnum = '&vordnum';
prompt	
select 'Customer Number: '||orders.cid
	from orders
	where ordnum = '&vordnum';
select '   '||ltrim(lname)||', '||ltrim(fname)
	from customer, orders
	where orders.cid = customer.cid
	and ordnum = '&vordnum';
select '   '||ltrim(caddress) 
	from customer, orders
	where orders.cid = customer.cid
	and ordnum = '&vordnum';
select '   '||ltrim(ccity)||', '||ltrim(cstate)||' '||ltrim(czip)
	from customer, orders
	where orders.cid = customer.cid
	and ordnum = '&vordnum';
select '   ('||substr(cphone,1,3)||') '||substr(cphone,4,3)||'-'||substr(cphone,7)
	from customer, orders
	where orders.cid = customer.cid
	and ordnum = '&vordnum';
prompt
select 'Item Number: '||orders.pid
	from orders, products
	where orders.pid = products.pid
	and ordnum = '&vordnum';
select '   Item Description: '||pdesc
	from products, orders
	where orders.pid = products.pid
	and ordnum = '&vordnum';
select '   Unit Price: $'||orders.unitprice||'.00'
	from products, orders
	where orders.unitprice = products.unitprice
	and ordnum = '&vordnum';
select 'Quantitiy Ordered: '||ordqty
	from orders
	where ordnum = '&vordnum';
select 'Amount Ordered: $'||ordtotal||'.00'
	from orders
	where ordnum = '&vordnum';
prompt	
select 'Shipping Warehouse: '||orders.wcode
	from warehouse, orders
	where warehouse.wcode=orders.wcode
	and ordnum='&vordnum';
select '   '||ltrim(waddress) 
	from warehouse, orders
	where orders.wcode = warehouse.wcode
	and ordnum='&vordnum';
select '   '||wcity||', '||ltrim(wstate)||' '||ltrim(wzip)
	from warehouse, orders
	where orders.wcode = warehouse.wcode
	and ordnum='&vordnum';
select '   ('||substr(wphone,1,3)||') '||substr(wphone,4,3)||'-'||substr(wphone,7)
	from warehouse, orders
	where orders.wcode = warehouse.wcode
	and ordnum='&vordnum';
prompt
accept vshipdate prompt 'Please enter the shipping date (mm/dd/yyyy): '
prompt
accept vshipqty prompt 'Please enter the shipping quantity: '

prompt
prompt *********************************

update storage
	set unitsinstock = (unitsinstock - &vshipqty)
	where storage.pid in (select orders.pid
		from orders, storage
		where orders.pid=storage.pid
		and ordnum='&vordnum')
	and storage.wcode in (select orders.wcode
		from orders, storage
		where orders.wcode=storage.wcode
		and ordnum='&vordnum');
update orders
	set status = 'Shipped'
	where ordnum = '&vordnum';
update orders
	set shipdate = to_date('&vshipdate','mm/dd/yyyy')
	where ordnum = '&vordnum';
update orders
	set shipqty = &vshipqty
	where ordnum = '&vordnum';
update orders
	set shiptotal = &vshipqty*(select unitprice 
	from orders 
	where ordnum = '&vordnum')
	where ordnum = '&vordnum';
select 'Order is now ---> '||status
	from orders
	where ordnum = '&vordnum';
select 'Date Shipped: '||shipdate
	from orders
	where ordnum = '&vordnum';
select 'Quantitiy Shipped: '||shipqty
	from orders
	where ordnum = '&vordnum';
select 'Amount Shipped: $'||shiptotal||'.00'
	from orders
	where ordnum = '&vordnum';
prompt

commit;