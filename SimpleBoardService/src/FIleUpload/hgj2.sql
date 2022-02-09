select ROWNUM as num from boards  where ROWNUM BETWEEN 11 and 20  ;


select * from boards where ROWNUM BETWEEN 11 and 20 order by no; 

select ROWNUM from boards where ROWNUM BETWEEN 1 and 5; 


select ROWNUM as num , title from (select * from boards order by no ) where ROWNUM BETWEEN 11 and 20; 


select ROWNUM as num , no,title from boards order by title 

select * from (select * from  order by time) where rnum between 10 and 14;


select *
from (SELECT *
        FROM (
            SELECT rownum rnum,  title, content
            FROM boards
            ) 
        where rnum between 10 and 15
    ) order by boards.no



select * from (select ROWNUM as rnum , b.* from (select * from boards order by title ) b )where  rnum between 1 and 10; 


commit;


insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);
insert into boards (no) VALUES (BOARD_SEQ.nextval);

alter table boards add colum(varchar2(1000) filename) ;
commit;