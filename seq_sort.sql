create table mytable (id varchar2(20), ordernumber varchar2(20), item varchar2(20), attr varchar2(10));

INSERT ALL
 INTO mytable (id, ordernumber, item) VALUES ('1', 'o_32qq32', 'i_1')
 INTO mytable (id, ordernumber, item) VALUES ('2', 'o_2a2324', 'i_1')
 INTO mytable (id, ordernumber, item) VALUES ('3', 'o_3424', 'i_1')
 INTO mytable (id, ordernumber, item) VALUES ('4', 'o_32w32', 'i_2')
 INTO mytable (id, ordernumber, item) VALUES ('5', 'o_32ds4', 'i_2')
 INTO mytable (id, ordernumber, item) VALUES ('6', 'o_34qq24', 'i_2')
 INTO mytable (id, ordernumber, item) VALUES ('7', 'o_32sd32', 'i_3')
 INTO mytable (id, ordernumber, item) VALUES ('8', 'o_098324', 'i_3')
 INTO mytable (id, ordernumber, item) VALUES ('9', 'o_346524', 'i_3')
 INTO mytable (id, ordernumber, item) VALUES ('10', 'o_323232', 'i_1')
 INTO mytable (id, ordernumber, item) VALUES ('11', 'o_22s324', 'i_2')
 INTO mytable (id, ordernumber, item) VALUES ('12', 'o_34868724', 'i_3')
 INTO mytable (id, ordernumber, item) VALUES ('13', 'o_3ww32', 'i_3')
 INTO mytable (id, ordernumber, item) VALUES ('14', 'o_22324', 'i_2')
 INTO mytable (id, ordernumber, item) VALUES ('15', 'o_34ls24', 'i_2')
select * from dual;

select * from mytable

SELECT x.* FROM mytable x 
    join mytable y
    where y.item = x.item
   AND y.id <= x.id 
GROUP 
    BY id 
ORDER 
    BY COUNT(*), item;

select * from mytable where item in(    
select item from mytable
group by item)

SELECT id,ordernumber,item, 1 as sortcol FROM mytable WHERE item = 'i_1'
UNION
SELECT id,ordernumber,item, 2  FROM mytable WHERE item = 'i_2'
UNION
SELECT id,ordernumber,item, 3  FROM mytable WHERE item = 'i_3'

SELECT id,ordernumber,item
     , CASE WHEN item = 'i_1' THEN 1 -- where item = 'i_1'
            WHEN item = 'i_2' THEN 2--'i2'
            WHEN item = 'i_3' THEN 2--'i3'
        END 
      FROM mytable
 WHERE item IN ( 'i_1','i_2','i_3' )
 order by sortcol
 
 select * from mytable