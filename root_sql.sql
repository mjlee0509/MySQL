-- 주석(-- 쓰고 한 칸 띄우기)

-- 계정을 만들어보자 (사용자이름 user1; 비밀번호 1234)
create user user1@localhost identified by '1234';	-- localhost는 이 pc 자체를 의미함; 이 부분에 접속된 pc의 아이피가 들어올 수도 있다
-- database를 만들어보자
create database database1;	-- 한줄한줄씩 실행하는 습관을 들여보도록 하자
-- 권한 부여
grant all privileges on database1.* to user1@localhost;

create user user_dbclass@localhost identified by '1234';
create database db_dbclass;
grant all privileges on db_dbclass.* to user_dbclass@localhost;
