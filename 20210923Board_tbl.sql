alter table board_tbl add constraint pk_board primary key(bno);

/* 오라클 쿼리문의 힌트는 조회할때 index라고 불리는
    특수한 주소값을 조회하도록 옵션을 바꾸는 것입니다. 
    힌트구문은 아래처럼 주석처럼 쓰되, 여는 부분에 +를 추가로 붙입니다.
    힌트는 FULL, INDEX_DESC, INDEX_ASC등이 있습니다. */

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

-- 기존에 들어가있던 데이터를 2배씩 늘려주는 쿼리문
INSERT INTO board_tbl(bno, title, content, writer)
(SELECT board_num.nextval, title, content, writer from board_tbl);

COMMIT;
    