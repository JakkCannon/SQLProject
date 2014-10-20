set heading off
set feedback off
set echo off
set verify off

prompt
prompt****** By Product By Month Sales Report ******
prompt

column pid heading 'Prod|No' format a7
column pdesc heading 'Product|Name' format a14
column orddate heading 'Order|Month' format a7
column numoford heading 'No of|Orders' format 999
column totalunits heading 'Total|Units' format 99,999
column totalamt heading 'Total|Amount' format $999,999.99

set heading on

select orders.pid, pdesc, 
	(to_char(orddate, 'mm/yyyy')) orddate, 
	count(ordnum) numoford, 
	sum(ordqty) totalunits, 
	sum(ordtotal) totalamt
	from orders, products
	where orders.pid = products.pid
	group by to_char(orddate, 'mm/yyyy'), orders.pid, pdesc
	order by orders.pid;
prompt