select * from circuit
select * from gp 
alter table driver
drop COLUMN engine_name;
alter table driver
drop COLUMN tyre_name;
alter table driver
drop COLUMN chassis_name


insert into circuit (title, gp_id)
select "total "."Circuit",  gp.gp_id
from "total "
Join gp
On gp."name" = "total "."Grand Prix"

delete from circuit


select "total "."Circuit", count(*)
from "total "
group by 1



 select "total "."Grand Prix", count(*)
 from "total "
 group by 1
 
 /* MANT TO MANY for circuit and GP AND GP and driver*/