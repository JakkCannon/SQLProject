set heading off
set feedback off
set echo off
set verify off

prompt 
prompt *           -- C R E A T E   O R D E R --           *

select 'Today''s Date: '|| sysdate 
	from dual;
prompt	
	accept vcid prompt 'Enter the Customer Number: ';
select '   Customer Name: '||ltrim(lname)||', '||ltrim(fname)
	from customer
	where cid = '&vcid';
select '   Shipping Address: '||ltrim(caddress) 
	from customer
	where cid = '&vcid';
select '   City, State Zip: '||ltrim(ccity)||', '||ltrim(cstate)||' '||ltrim(czip)
	from customer
	where cid = '&vcid';
select '   Phone: ('||substr(cphone,1,3)||') '||substr(cphone,4,3)||'-'||substr(cphone,7)
	from customer
	where cid = '&vcid';
prompt
prompt
	accept vpid prompt 'Enter the Item Number: ';
select '   Item Number: '||pid
	from products
	where pid ='&vpid';
select '   Item Description: '||pdesc
	from products
	where pid ='&vpid';
select '   Unit Price: $'||unitprice||'.00' 
	from products
	where pid ='&vpid';	
prompt
prompt
	accept vqty prompt 'Enter the quantity ordered: ';
select '   Amount Ordered: $'||unitprice*&vqty||'.00' 
	from products
	where pid ='&vpid';
prompt
prompt	
set heading on
prompt Please choose from the following warehouses:
column wcode heading 'Warehouse' format a9
column wcity heading 'City' format a12
column wstate heading 'State' format a5
column unitsinstock heading 'InventoryQty' format 99,999 
select warehouse.wcode, wcity, wstate, unitsinstock
	from warehouse, storage
	where storage.pid='&vpid'
	and storage.wcode=warehouse.wcode;
set heading off
prompt

accept vwcode prompt 'Enter the warehouse code: '
insert into orders (ordnum, orddate, cid, pid, wcode, ordqty, unitprice, ordtotal, status) 
values ((select maxnum from counter),(select sysdate from dual),'&vcid','&vpid','&vwcode',&vqty,
(select unitprice from products where pid='&vpid'),&vqty*(select unitprice from products where pid='&vpid'),'Open');
prompt
select '***** Order Status: '||status
	from orders, counter
	where maxnum = ordnum;
	
select '***** Order number is -----> '||ordnum
	from orders, counter
	where maxnum = ordnum;
prompt
	
update counter set maxnum=maxnum+1;

commit;

