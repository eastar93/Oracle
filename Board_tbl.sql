/* oracle은 auto_increment가 없으므로
board_num라는 시퀀스를 만들면 처음에 0이 저장됩니다.
이후 primary key가 들어간 자리에
board_num.nextval 이라고 기입해주면
실행할 때 마다 1씩 증가된 새로운 값을 그 위치에 넣어줍니다 */
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

-- 시퀀스 생성 --
CREATE SEQUENCE board_num;

-- 시퀀스 삭제 -- 
DROP SEQUENCE board_num;

-- 드랍후 적용 -- 
commit;

alter table board_tbl add constraint pk_board primary key(bno);

insert into board_tbl (bno, title, content, writer) values (board_num.nextval, '테스트글', '테스트본문', '글쓴이');

select * from board_tbl;

SELECT * FROM board_tbl ORDER BY bno DESC;
SELECT * FROM board_tbl WHERE bno < 4 ORDER BY bno DESC;


