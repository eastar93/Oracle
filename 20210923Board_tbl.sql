alter table board_tbl add constraint pk_board primary key(bno);

/* ����Ŭ �������� ��Ʈ�� ��ȸ�Ҷ� index��� �Ҹ���
    Ư���� �ּҰ��� ��ȸ�ϵ��� �ɼ��� �ٲٴ� ���Դϴ�. 
    ��Ʈ������ �Ʒ�ó�� �ּ�ó�� ����, ���� �κп� +�� �߰��� ���Դϴ�.
    ��Ʈ�� FULL, INDEX_DESC, INDEX_ASC���� �ֽ��ϴ�. */

SELECT /* + INDEX_DESC (board_tbl pk_board) */ * from board_tbl;
    
SELECT * FROM board_tbl ORDER BY bno DESC;

SELECT rownum, rowid, bno from board_tbl;

SELECT /* + INDEX_DESC(board_tbl pk_board) */ 
    ROWNUM rn, board_tbl.* 
        FROM board_tbl WHERE ROWNUM <= 20;

SELECT bno, title, content, writer, regdate, updatedate  
    FROM (SELECT /* + INDEX_DESC(board_tbl pk_board) */ 
        rownum, bno, title, content, writer, regdate, updatedate 
            FROM board_tbl WHERE ROWNUM <= 20) WHERE ROWNUM > 10;

SELECT ROWNUM, bt.* FROM
    (SELECT /*+ INDEX_DESC(board_tbl pk_board) */ 
        ROWNUM rn, board_tbl.* 
            FROM board_tbl WHERE ROWNUM <= 20) bt 
                WHERE rn > 10;

SELECT * FROM board_tbl ORDER BY bno DESC;

-- ������ ���ִ� �����͸� 2�辿 �÷��ִ� ������
INSERT INTO board_tbl(bno, title, content, writer)
(SELECT board_num.nextval, title, content, writer from board_tbl);

COMMIT;
    