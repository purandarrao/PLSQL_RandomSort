declare
  cursor cursor1 is
    select id,ordernumber,item,attr
    from test_table 
    order by item asc;
    c_i number:= 0;
    c_j number:= 1;
    c_k number:= 2;
    c_group number;
    c_1 number;c_2 number;c_3 number;
    cursor1_row cursor1%rowtype;
    counter1 number:=0; item varchar2(20);
  cursor cursor0 is    
    select count(*), item into counter1,item
    from test_table 
    group by item order by item asc;
    cursor0_row cursor0%rowtype;
    type NumberArray is table of number index by binary_integer;
    counter NumberArray;
    c number := 1;
begin
    select count(*) into c_1 from test_table where item = 'i_1';
    select count(*) into c_2 from test_table where item = 'i_2';
    select count(*) into c_3 from test_table where item = 'i_3';
    
    for cursor0_row in cursor0 loop
        counter(c) := cursor0_row.counter1;
        c:=c+1;
    end loop;
    c:=1;
    select count(distinct(item)) into c_group from test_table;
  --DBMS_OUTPUT.PUT_LINE('ID:'||c_1||', Ordenumber: '|| c_2||', Item: '|| c_3);
    for cursor1_row in cursor1 loop
        if(cursor1_row.item = 'i_1' AND counter(c) >= 1) then
            counter(c):= counter(c) - 1; c_i:=c_i+c_group;
            cursor1_row.attr := c_i;
            DBMS_OUTPUT.PUT_LINE(cursor1_row.attr);
            update test_table set attr=c_i where id=cursor1_row.id;
        else
            c:=c+1;
        end if;
        if(cursor1_row.item = 'i_2' AND counter(c) >= 1) then
            counter(c):= counter(c) - 1; c_j:=c_j+c_group;
            cursor1_row.attr := c_j;
            DBMS_OUTPUT.PUT_LINE(cursor1_row.attr);
            update test_table set attr=c_j where id=cursor1_row.id;
        else
            c:=c+1;
        end if;
        if(cursor1_row.item = 'i_3' AND counter(c) >= 1) then
            counter(c):= counter(c) - 1; c_k:=c_k+c_group;
            cursor1_row.attr := c_k;
            DBMS_OUTPUT.PUT_LINE(cursor1_row.attr);
            update test_table set attr=c_k where id=cursor1_row.id;
        else
            c:=c+1;
        end if;
    end loop;
    commit;
end;
/