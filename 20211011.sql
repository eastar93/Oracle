CREATE TABLE users(
    username varchar2(50) not null primary key,
    password varchar2(100) not null,
    enabled char(1) default '1'
    );
    
CREATE TABLE authorities(
    username varchar2(50) not null,
    authority varchar2(50) not null,
    constraint fk_authorities_users foreign key(username)
        references users(username)
    );
        
CREATE unique index ix_auth_username on
    authorities(username, authority);
    
insert into users(username, password) values('user00', 'pw00');
insert into users(username, password) values('member00', 'pw00');
insert into users(username, password) values('admin00', 'pw00');

insert into authorities (username, authority) values('user00', 'ROLE_USER');
insert into authorities (username, authority) values('member00', 'ROLE_MANAGER');
insert into authorities (username, authority) values('admin00', 'ROLE_MANAGER');
insert into authorities (username, authority) values('admin00', 'ROLE_ADMIN');

COMMIT;

select * from users;
select * from authorities;

CREATE TABLE member_tbl (
    userid varchar2(50) not null primary key,
    userpw varchar2(100) not null,
    username varchar2(100) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1'
    );
    
    DROP TABLE member_tbl;
    
select * from member_tbl;
    
CREATE TABLE member_auth(
    userid varchar2(50) not null,
    auth varchar2(50) not null,
    constraint fk_member_auth foreign key(userid) references member_tbl(userid)
    );

select * from member_auth;

    DROP TABLE member_auth;

CREATE TABLE persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
    );
SELECT * FROM persistent_logins;

SELECT * FROM Member_tbl;
SELECT * FROM MEMBER_auth;