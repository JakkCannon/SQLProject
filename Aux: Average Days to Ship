set heading off
set feedback off
set echo off
set verify off

prompt
prompt****** Warehouse Avg Days to Ship Report ******
prompt

set heading on

column wcode heading 'Warehouse' format a9
column wcity heading 'City' format a12
column wstate heading 'State' format a5
column avgdaystoship heading 'AvgDaystoShip' format 99.99 

select warehouse.wcode, wcity, wstate,
	avg(trunc(shipdate) - trunc(orddate)) avgdaystoship
	from orders, warehouse
	where warehouse.wcode=orders.wcode
	group by warehouse.wcode, wcity, wstate
	order by wcode;
prompt	