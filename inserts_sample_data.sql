drop table test_table

create table test_table (id varchar2(20), ordernumber varchar2(20), item varchar2(20), attr number(10));

INSERT ALL
 INTO test_table (id, ordernumber, item) VALUES ('1', 'o_32qq32', 'i_1')
 INTO test_table (id, ordernumber, item) VALUES ('2', 'o_2a2324', 'i_1')
 INTO test_table (id, ordernumber, item) VALUES ('3', 'o_3424', 'i_1')
 INTO test_table (id, ordernumber, item) VALUES ('4', 'o_32w32', 'i_2')
 INTO test_table (id, ordernumber, item) VALUES ('5', 'o_32ds4', 'i_2')
 INTO test_table (id, ordernumber, item) VALUES ('6', 'o_34qq24', 'i_2')
 INTO test_table (id, ordernumber, item) VALUES ('7', 'o_32sd32', 'i_3')
 INTO test_table (id, ordernumber, item) VALUES ('8', 'o_098324', 'i_3')
 INTO test_table (id, ordernumber, item) VALUES ('9', 'o_346524', 'i_3')
 INTO test_table (id, ordernumber, item) VALUES ('10', 'o_323232', 'i_1')
 INTO test_table (id, ordernumber, item) VALUES ('11', 'o_22s324', 'i_2')
 INTO test_table (id, ordernumber, item) VALUES ('12', 'o_34868724', 'i_3')
 INTO test_table (id, ordernumber, item) VALUES ('13', 'o_3ww32', 'i_3')
 INTO test_table (id, ordernumber, item) VALUES ('14', 'o_22324', 'i_2')
 INTO test_table (id, ordernumber, item) VALUES ('15', 'o_34ls24', 'i_2')
select * from dual;

select * from test_table
order by attr;

update test_table set attr = '' 