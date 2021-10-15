CREATE TABLE img_tbl(
    uuid varchar(100) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    image char(1) default 'I',
    bno number(10, 0)
    );

alter table img_tbl add constraint pk_img primary key (uuid);
alter table img_tbl add constraint fk_board_img foreign key (bno) references board_tbl (bno);
    
select * from img_tbl;