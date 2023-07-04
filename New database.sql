CREATE TABLE  tyre (
  tyre_id  SERIAL,
  name VARCHAR(255),
  PRIMARY KEY(tyre_id)
); 

CREATE TABLE engine (
  engine_id  SERIAL,
  name VARCHAR(255),
  PRIMARY KEY(engine_id)
); 


CREATE TABLE chassis (
  chassis_id  SERIAL,
  name VARCHAR(255),
  PRIMARY KEY(chassis_id)
); 


CREATE TABLE driver (
  driver_id serial ,
  
  title VARCHAR(255),
  tyre_id INTEGER,
  engine_id INTEGER,
  chassis_id INTEGER,


  PRIMARY KEY(driver_id),

  FOREIGN KEY (tyre_id)
    REFERENCES tyre (tyre_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (engine_id)
    REFERENCES engine (engine_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (chassis_id)
    REFERENCES chassis (chassis_id)
    ON DELETE CASCADE ON UPDATE CASCADE	
) ;


CREATE TABLE GP (
  gp_id serial,
  name VARCHAR(255),
  PRIMARY KEY(gp_id),
  driver_id INTEGER,
  FOREIGN KEY (driver_id)
    REFERENCES driver (driver_id)
    ON DELETE CASCADE ON UPDATE CASCADE	
) ;


CREATE TABLE Circuit (
  circuit_id serial,
  title VARCHAR(255),
  

  gp_id INTEGER,

  PRIMARY KEY(circuit_id),
  

  FOREIGN KEY (gp_id) REFERENCES GP (gp_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ;



insert into tyre ("name") values ('Goodyear','Michelin','Bridgestone','Pirelli','Englebert','Dunlop','Firestone')

select "Engine" from "total "
group by 1

insert into engine ("name") select "Engine" from "total " where "Engine" is NOT NULL group by 1 
insert into tyre ("name") select "Tyre" from "total "  where "Tyre" is NOT NULL group by 1
insert into chassis ("name") select "Chassis" from "total " where "Chassis" is NOT NULL group by 1
insert into driver ("title", "driver_no") select "Driver","N°"  from "total " where "total "."N°" is NOT NULL AND "total "."Driver" is NOT NULL  group by 1,2 order by 2

insert into GP ("name") select "Grand Prix" from "total " where "Grand Prix" is NOT NULL group by 1

insert into circuit ("title") select "Circuit" from "total " where "Circuit" is NOT NULL group by 1


ALTER TABLE driver
ADD driver_no INTEGER;

	delete from "gp" 
	
/*select "Driver","N°"  from "total " where "total "."N°" is NOT NULL AND "total "."Driver" is NOT NULL  group by 1,2 order by 2	
select "Driver","N°"  from "total " where "total "."Driver" is NOT NULL   group by 1,2 order by 2	*/


ALTER TABLE gp
ADD driver_name VARCHAR
ALTER TABLE gp
ADD driver_no INTEGER

insert into gp ("name",driver_name, driver_no) select "Grand Prix","Driver","N°" from public."total " where  "Grand Prix" is NOT NULL ANd "total "."N°" is NOT NULL AND "total "."Driver" is NOT NULL  group by 1,2,3 order by 2;

ALTER TABLE gp
DROP  "driver_name"

ALTER TABLE gp
ADD FOREIGN KEY("driver_no") REFERENCES driver (driver_no);

select * from public.driver





ALTER TABLE driver ADD tyre_name char
ALTER TABLE driver ADD engine_name CHAR
ALTER TABLE driver ADD chassis_name CHAR






insert into driver (title,  driver_no,"tyre_name",engine_name, chassis_name) select "Driver",  "N°", "Tyre", "total "."Engine", "total "."Chassis" from "total " where "total "."N°" is NOT NULL AND "total "."Driver" is NOT NULL   order by 2

insert into driver (tyre_id) select tyre_id from tyre



ALTER TABLE driver
ADD  INTEGER


tyre_id, engine_id, chassis_id,
engine_id, chassis_id, tyre.tyre_id,
select * from driver

insert into driver("tyre_id")
select a from (select driver.tyre_id, tyre."tyre_id", driver.tyre_name, case when (driver.tyre_id is null) then 0  end  as new_tyre,
tyre."tyre_id" + case when (driver.tyre_id is null) then 0  end as a
from driver
Join tyre
On tyre."name" = driver."tyre_name") t1 

alter TABLE driver
add 


where  "Grand Prix" is NOT NULL ANd "total "."N°" is NOT NULL AND "total "."Driver" is NOT NULL  group by 1,2,3 order by 2;


ALTER TABLE "total "
ADD tyre_id  INTEGER

insert into "total "(tyre_id)
select tyre.tyre_id from tyre


delete from "total " where "total "."Tyre" is null



ALTER TABLE driver
add tyre_id varchar
ALTER TABLE driver
drop tyre_name1 



insert into driver (title,  driver_no, tyre_name, engine_name,chassis_name, tyre_id, engine_id,chassis_id )


with t2 as (select "total "."Driver", "total "."N°", tyre."name", "total "."Engine", "total "."Chassis", tyre.tyre_id, engine.engine_id, chassis.chassis_id 
from tyre
/*Join driver
on driver.tyre_name = tyre.name */
Join "total "
on "total "."Tyre" = tyre.name
JOin engine
On "total "."Engine" = engine.name
Join chassis
On "total "."Chassis" = chassis.name) ,
     t3 as (select *, row_number() over (partition by  "N°", "name", "Engine", t2."Chassis", tyre_id, engine_id, chassis_id order by "Driver" ) rank
from t2)
select "Driver","N°", "name", "Engine", "Chassis", tyre_id, engine_id, chassis_id  
from t3
where rank =1
order by chassis_id
 
 


from "total " where "total "."N°" is NOT NULL AND "total "."Driver" is NOT NULL   order by 2