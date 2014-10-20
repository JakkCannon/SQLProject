set heading off
set feedback off
set echo off
set verify off

prompt 
prompt *           -- O R D E R   D E T A I L --           *
prompt
accept vordnum prompt 'Please enter the Order Number: '

select 'Order Number: '||ordnum
	from orders
	where ordnum = '&vordnum';
select 'Order Status: '||status
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
prompt
select 'Order Date: '||orddate
	from orders
	where ordnum = '&vordnum';
select 'Shipping Date: '||shipdate
	from orders
	where ordnum = '&vordnum';	
prompt	
select 'Quantitiy Ordered: '||ordqty
	from orders
	where ordnum = '&vordnum';
select 'Amount Ordered: $'||ordtotal||'.00'
	from orders
	where ordnum = '&vordnum';
select 'Quantitiy Shipped: '||shipqty
	from orders
	where ordnum = '&vordnum';
select 'Amount Shipped: $'||shiptotal||'.00'
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
select '   '||ltrim(wcity)||', '||ltrim(wstate)||' '||ltrim(wzip)
	from warehouse, orders
	where orders.wcode = warehouse.wcode
	and ordnum='&vordnum';
select '   ('||substr(wphone,1,3)||') '||substr(wphone,4,3)||'-'||substr(wphone,7)
	from warehouse, orders
	where orders.wcode = warehouse.wcode
	and ordnum='&vordnum';	
prompt
