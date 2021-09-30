alter table board_tbl add constraint pk_board primary key(bno);

/* ����Ŭ �������� ��Ʈ�� ��ȸ�Ҷ� index��� �Ҹ���
    Ư���� �ּҰ��� ��ȸ�ϵ��� �ɼ��� �ٲٴ� ���Դϴ�. 
    ��Ʈ������ �Ʒ�ó�� �ּ�ó�� ����, ���� �κп� +�� �߰��� ���Դϴ�.
    ��Ʈ�� FULL, INDEX_DESC, INDEX_ASC���� �ֽ��ϴ�. */

SELECT /*+ INDEX_DESC (board_tbl pk_board) */ * from board_tbl;

-- ��ü �� ���� ��ȸ�ϴ� ������
SELECT COUNT(*) FROM board_tbl;    
    
SELECT * FROM board_tbl ORDER BY bno DESC;

SELECT rownum, rowid, bno from board_tbl;

SELECT /*+ INDEX_DESC(board_tbl pk_board) */ 
    ROWNUM rn, board_tbl.* 
        FROM board_tbl WHERE ROWNUM <= 20;

SELECT bno, title, content, writer, regdate, updatedate  
    FROM (SELECT /* + INDEX_DESC(board_tbl pk_board) */ 
        rownum, bno, title, content, writer, regdate, updatedate 
            FROM board_tbl WHERE ROWNUM <= 20) WHERE ROWNUM > 10;
-- 15������
SELECT ROWNUM, bt.* FROM
    (SELECT /*+ INDEX_DESC(board_tbl pk_board) */ 
        ROWNUM rn, board_tbl.* 
            FROM board_tbl WHERE ROWNUM <= 15*10) bt 
                WHERE rn > (15-1)*10;
-- 30������                
SELECT ROWNUM, bt.* FROM
    (SELECT /*+ INDEX_DESC(board_tbl pk_board) */ 
        ROWNUM rn, board_tbl.* 
            FROM board_tbl WHERE ROWNUM <= (30*10)) bt 
                WHERE rn > (30-1)*10;
-- 426������                
SELECT ROWNUM, bt.* FROM
    (SELECT /*+ INDEX_DESC(board_tbl pk_board) */ 
        ROWNUM rn, board_tbl.* 
            FROM board_tbl WHERE ROWNUM <= (426*10)) bt 
                WHERE rn > (426-1)*10;

SELECT * FROM board_tbl ORDER BY bno DESC;

-- ������ ���ִ� �����͸� 2�辿 �÷��ִ� ������
INSERT INTO board_tbl(bno, title, content, writer)
(SELECT board_num.nextval, title, content, writer from board_tbl);

CREATE table reply_tbl(
    rno number(10, 0),
    bno number(10, 0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
    );
    
CREATE sequence reply_num;

alter table reply_tbl add constraint pk_reply primary key(rno);

alter table reply_tbl add constraint fk_reply
foreign key (bno) references board_tbl(bno);

COMMIT;
    