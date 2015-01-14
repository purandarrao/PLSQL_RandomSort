declare
  cursor cursor1 is
    select id,ordernumber,item
    from ptable 
    where item='i_1';
  cursor1_row cursor1%rowtype;
  cursor cursor2 is
    select id,ordernumber,item
    from ptable
    where item = 'i_2';
  cursor2_row cursor2%rowtype;
begin
  for cursor1_row in cursor1 loop
    DBMS_OUTPUT.PUT_LINE('ID:'||cursor1_row.ID||', Ordenumber: '|| cursor1_row.ordernumber||', Item: '|| cursor1_row.item);
    --for cursor2_row in cursor2 loop
    open cursor2;
    fetch cursor2 into cursor2_row;
      DBMS_OUTPUT.PUT_LINE('ID:'||cursor2_row.ID||', Ordenumber: '|| cursor2_row.ordernumber||', Item: '|| cursor2_row.item); 
      --fetch cursor2.next into cursor2_row;
      close cursor2;
      Exit;
    --end loop; 
    DBMS_OUTPUT.PUT_LINE('---------------------');
  end loop;
end;
/