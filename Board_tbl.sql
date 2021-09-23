/* oracle�� auto_increment�� �����Ƿ�
board_num��� �������� ����� ó���� 0�� ����˴ϴ�.
���� primary key�� �� �ڸ���
board_num.nextval �̶�� �������ָ�
������ �� ���� 1�� ������ ���ο� ���� �� ��ġ�� �־��ݴϴ� */
CREATE SEQUENCE board_num;

CREATE TABLE board_tbl (
    bno number(10, 0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
    );
DROP TABLE board_tbl;

-- ������ ���� --
CREATE SEQUENCE board_num;

-- ������ ���� -- 
DROP SEQUENCE board_num;

-- ����� ���� -- 
commit;

alter table board_tbl add constraint pk_board primary key(bno);

insert into board_tbl (bno, title, content, writer) values (board_num.nextval, '�׽�Ʈ��', '�׽�Ʈ����', '�۾���');

select * from board_tbl;

SELECT * FROM board_tbl ORDER BY bno DESC;
SELECT * FROM board_tbl WHERE bno < 4 ORDER BY bno DESC;


