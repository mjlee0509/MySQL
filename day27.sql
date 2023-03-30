use db_dbclass;

create table student (
	id bigint,
	student_name varchar(5),
    student_mobile varchar(20),
    student_major varchar(30)
);		-- 실행은 세미콜론이 기준
select * from student;
insert into student(id, student_Name, student_Mobile, student_Major)
	values(1, '하소이', '010-1111-1111', '공연예술');
insert into student(id, student_Name, student_Mobile, student_Major)
	values(2, '김유진', '010-2121-1212', '산업디자인');
select * from student;
-- 테이블 삭제
drop table student;
select * from student;

-- 예제 --
create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

create table emp (
    empno int,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate DATE,
    sal int,
    comm int,
    deptno int
);

create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);


create table salgrade (
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- emp 테이블 전체 조회
select * from emp;
-- emp 테이블의 empno, empname 조회
select empno, ename from emp;
-- emp 테이블의 job 조회
select job from emp;
-- 중복값 제외
select distinct job from emp;
-- 사원 이름 오름차순 조회
select * from emp order by ename asc;
-- 사원 이름 내림차순 조회
select * from emp order by ename desc;
	-- 예제1) 급여 기준
	select * from emp order by sal asc;
	select * from emp order by sal desc;
		-- 예제 1-1) 첫번째 기준이 같은 값일 때 그 다음 기준 적용
		select * from emp order by sal, ename asc;	-- 생각보다 간단
	-- 예제 2) 입사일 기준
	select * from emp order by hiredate asc;
	select * from emp order by hiredate desc;


-- where절 : 조건
select * from emp where job='SALESMAN';
	-- 예제1) 부서번호=10
    select * from emp where deptno=10;
    -- 예제2) 이름=james
    select * from emp where ename='james';
    -- 예제3) 사번=7654
    select * from emp where empno=7654;
		-- 예제4-1) 직급이 manager이고 부서번호가 20
		select * from emp where job='manager' and deptno=20;
		-- 예제4-2) 직급이 salesman이거나 부서번호가 10
		select * from emp where job='salesman' or deptno=10;
        -- 예제5) 급여가 3000 이상
        select * from emp where sal>=3000;
	-- 급여가 3000 이상인 사원을 내림차순 정렬
	select * from emp where sal>=3000 order by sal desc;
	-- 직급이 salesman이 '아닌' 사원
	select * from emp where job!='salesman';
	select * from emp where not job ='salesman';
	-- 범위 지정: 급여가 2000 이상 3000 미만
	select * from emp where sal >= 2000 and sal <= 3000;
	select * from emp where sal between 2000 and 3000;
    
-- like 연산자 : '검색기능'
select * from emp where ename like 'm%';  -- m으로 시작하는
select * from emp where ename like '%m';  -- m으로 끝나는
select * from emp where ename like '%m%';  -- m이 들어간?
select * from emp where ename like '_m%';  -- 2번째 글자에 m이 들어간
select * from emp where ename like '__m%';  -- 3번째 글자에 m이 들어간
	-- %와 _의 차이
    select * from emp where ename like '이__';  -- 성이 이씨고, 이름이 3글자인
    select * from emp where ename like '이%'; -- 성은 이씨고, 글자수는 상관없다
		-- 예제1) 입사일자가 1981-04-01 이후
		select * from emp where hiredate > '1981-04-01';
		select * from emp where hiredate < '1981-04-01';
		select * from emp where hiredate > str_to_date('1981-04-01', '%Y-%m-%d');

        
-- 테이블 구조 확인
desc emp;

-- 집계함수
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp;
select sum(sal) as 'salesman 급여 총합' from emp where job='salesman';
select sum(sal) as 'manager 급여 총합' from emp where job='manager';

select avg(sal) from emp;
select round(avg(sal), 2) as '급여평균' from emp;
	-- ~from dual 
	select sysdate() from dual;  -- from dual : 형식 맞추려고 만든 가상의 테이블
	select round(12.345, 2) from dual;

select max(sal) from emp;
select min(sal) from emp;

select count(*) from emp;
select count(*) from emp where deptno=20;

-- 그룹화
select * from emp group by job;  -- 오류가 난다. 왜?
select job from emp group by job; 
	-- 직급별 평균 급여
    select job, avg(sal) from emp group by job;
    -- 부서별 평군 급여
    select deptno, avg(sal) from emp group by deptno;

-- 1. 직급별 사원수
select job, count(*) from emp group by job;
-- 2. 직급별 평균 급여와 사원수
select job, avg(sal), count(*) from emp group by job;
-- 3. 2의 결과를 오름차순으로
select job, avg(sal), count(*) from emp group by job order by job asc;
-- 4. 2의 결과에서 평균급여를 소수점 첫째자리까지
select job, round(avg(sal),1), count(*) from emp group by job;
-- 5. job as 직급, 급여 평균값 as 평균급여, 사원수 as 사원수
select job as '직급', round(avg(sal),1) as '평균급여', count(*) as '사원수' from emp group by job;

-- 부서별
select deptno from emp group by deptno;
select deptno, avg(sal) from emp group by deptno;

-- 부서별 직급별
select deptno, job, avg(sal) from emp group by deptno, job;
select deptno, job, avg(sal) from emp group by job, deptno;
select deptno, job, avg(sal) from emp group by job, deptno order by job asc;
select deptno, job, avg(sal) from emp group by job, deptno order by deptno asc;

-- having : 그룹핑한 결과에서 조건 적용
select deptno, job, avg(sal) from emp 
						group by job, deptno
							having avg(sal) >= 2000
								order by job asc;

-- 급여가 3000 이하인 사원을 대상으로 위의 그룹핑 적용
select deptno, job, avg(sal) from emp
						where sal <= 3000
							group by job, deptno
								having avg(sal) >= 2000
									order by job asc;

-- date 타입을 문자로 표현하기 date_format()
select date_format(hiredate, '%Y') from emp;


/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
-- 1.
select deptno as '부서번호', round(avg(sal),1) as '평균급여', max(sal) as '최고급여', min(sal) as '최저급여', count(empno) as '사원수' from emp group by deptno;
-- 2.
select job, count(empno) from emp group by job having count(empno) >=3;
-- 3.
select date_format(hiredate, '%Y') as '입사년도', count(empno) as '사원수' from emp group by date_format(hiredate, '%Y') order by date_format(hiredate, '%Y') asc;
-- 3.1
select date_format(hiredate, '%Y') as '입사년도', deptno as '부서번호', count(empno) as '사원수' from emp group by date_format(hiredate, '%Y'), deptno order by date_format(hiredate, '%Y') asc;


 -- 이 두 테이블은 'deptno(부서번호)' 라는 공통된 정보를 가지고 있다
select * from emp;
select * from dept;

-- 단순히 이렇게만 가져오면 서로 아무런 관계없이 갖다붙는다.
select * from emp, dept;

-- 조인
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno;  -- 이렇게 줄여쓸수도 있다
select empno, ename, dname, loc from emp e, dept d where e.deptno = d.deptno; 
select empno, ename, deptno dname, loc from emp e, dept d where e.deptno = d.deptno;  -- 이렇게하면 에러남 : 칼럼 deptno가 ambiguous하다.
select e.empno, e.ename, e.deptno dname, d.loc from emp e, dept d where e.deptno = d.deptno;  -- 따라서, 이렇게 쓰고 싶을때는 어느 테이블의 칼럼을 가져올지 정해주는게 좋다
	-- 예제) emp, dept를 조인하여 empno, ename, deptno, dname, loc 조회 (급여 2500 이상, 오름차순 정렬)
	select e.empno, e.ename, e.deptno dname, d.loc 
			from emp e, dept d 
				where e.deptno = d.deptno and e.sal >= 2500   -- and가 있었구나...!!
					order by sal asc;

-- 최저급여를 받는 사람은?
select * from emp order by sal asc;
-- 1. 최저급여 값이 얼마인지
select min(sal) from emp;
-- 2. 최저급여 값을 받는 사람이 누구인지; (sal = 최저급여값)인 사람
select * from emp where sal = 800;
-- 2.1. 서브쿼리를 사용하여 위의 과정을 돌려보자
select * from emp where sal = (select min(sal) from emp);
	-- 예제1) 최고급여를 받는 사람
    select max(sal) from emp;
	select * from emp where sal = (select max(sal) from emp);
    -- 예제2) allen보다 높은 급여를 받는 사람
    select sal from emp where ename = 'allen';
	select * from emp where sal > (select sal from emp where ename = 'allen');

/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/
-- 1.
select hiredate from emp where ename = 'clark';
select * from emp 
	where hiredate > (select hiredate from emp where ename = 'clark');

-- 2.
select avg(sal) from emp;
select * from emp 
	where sal > (select avg(sal) from emp) 
    and deptno = 20;

-- 3.
select * from emp e, dept d where e.deptno = d.deptno;
select avg(e.sal) from emp e;
select * from emp e, dept d 
	where e.deptno = d.deptno 
    and e.sal > (select avg(e.sal) from emp e) 
    and e.deptno = 20;

create table member1 (
	id bigint,
    member_email varchar(20),
    member_password varchar(10)
);
insert into member1 (id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- 모든 칼럼에 데이터가 들어간다면 컬럼 이름 생략 가능 
insert into member1 values(2, 'member1@email.com', '1111');
insert into member1 values(3, 'member1@email.com'); -- 이렇게 쓰면 에러남; column count doesn't match ~~ 
-- 따라서, 특정 컬럼에만 값을 넣고싶다면 ... 
insert into member1 (id, member_email) values(3, 'member1@email.com');  -- 값을 넣고싶은 칼럼 이름만 써주면 된다
-- 지정된 크기보다 큰 값을 저장할때?
insert into member1 values(4, 'member1@email.com', '111111111111111111'); -- data too long for column ~~
insert into member1 values(5, null, '1111');
insert into member1 values(null, null, '1111');
select * from member1;
drop table member1;


-- id 칼럼에 not null 제약조건을 걸어보자
create table member2 (
	id bigint not null,
    member_email varchar(20),
    member_password varchar(10)
);
desc member2;
insert into member2 (id, member_email, member_password) values(1, 'member2@email.com', '1111');
insert into member2 (id, member_email, member_password) values(null, 'member2@email.com', '1111');  -- column 'id' cannot be null
insert into member2 (id, member_email, member_password) values(2, null, '1111');  -- column 'id' cannot be null
select * from member2;

-- id 칼럼에 not null과 unique
-- email, password에 not null
create table member3 (
	id bigint not null unique,
    member_email varchar(20) not null,
    member_password varchar(10) not null
);
desc member3;
insert into member3(id, member_email, member_password) values(1, 'member3@email.com', '1111');
insert into member3(id, member_email, member_password) values(1, 'member3@email.com', '1111');	-- 에러

create table member4 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null
);
insert into member4 (id, member_email, member_password) values(1, 'member2@email.com', '1111');
insert into member4 (id, member_email, member_password) values(2, 'member2@email.com', '1111');  -- 에러

create table member5 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime
);
insert into member5 (id, member_email, member_password, member_created_date) values(1, 'member2@email.com', '1111', sysdate());

create table member6 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now()
);
insert into member6 (id, member_email, member_password) values(1, 'member2@email.com', '1111');
select * from member6;

create table member7 (
	id bigint primary key,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now()
);
insert into member7 (id, member_email, member_password) values(1, 'member2@email.com', '1111');
insert into member7 (id, member_email, member_password) values(1, 'member2222@email.com', '1111');

create table member8 (
	id bigint,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now(),
    constraint pk_member8 primary key(id)
);

-- 제약조건 확인
select * from information_schema.table_constraints;

-- 참조관계

	-- 이 앞에서 저 board1 테이블을 지우고싶다면?
	drop table if exists board1; 
    -- 새로 테이블을 만들 때에는 혹시 모르니까 먼저 지우고 시작하기도 함

-- 게시글 테이블
create table board1(
	id bigint,
	board_writer varchar(20) not null,	-- 여기 unique를 주면??? 한 작성자는 하나의 글밖에 쓸 수 없다
    board_contents varchar(500),
    constraint pk_board1 primary key(id)
);
-- 댓글 테이블
/* 1. 존재하는 게시글에만 작성 가능
   2. 게시글의 글번호를 참조 */
drop table if exists comment1;
create table comment1(
	id bigint,
    comment_writer varchar(20) not null,
	comment_contents varchar(200),
    board1_id bigint,
    /* 댓글 테이블의 id를 pk로 지정 */
    constraint pk_comment1 primary key(id),
    /* 참조관계 지정을 위해 comment1 테이블의 board1_id 칼럼을 
    board1 테이블의 id를 참조하는 관계로 정의 */
    constraint fk_comment1 foreign key(board1_id) references board1(id)
);
-- 게시글 데이터
insert into board1 (id, board_writer, board_contents)
	values (1, 'writer1', 'contents1');
insert into board1 (id, board_writer, board_contents)
	values (2, 'writer2', 'contents2');
insert into board1 (id, board_writer, board_contents)
	values (3, 'writer3', 'contents3');
insert into board1 (id, board_writer, board_contents)
	values (4, 'writer4', 'contents4');
select * from board1;

-- 댓글 데이터
/* 여기서 중요한 건 맨 앞의 id가 아니라
   맨 뒤의 board1_id이다 */
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(1, 'c_writer1', 'c_comments1', 1);
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(2, 'c_writer2', 'c_comments2', 1);
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(3, 'c_writer3', 'c_comments3', 2);
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(4, 'c_writer4', 'c_comments4', 5);
select * from comment1;

/* 1, 2번 게시글에는 댓글이 있고 3, 4번 게시글에는 댓글이 없음;
   3번 게시글을 삭제해보자 */
delete from board1 where id=3;	-- where id=? 이거 앞으로 CRUD할 때 많이 쓰게 될거임. 어지간한 상황에서는 CRUD에서의 조건은 pk로 거는 게 좋다
select * from board1;
-- 2번 게시글을 삭제해보자
delete from board1 where id=2;	-- 단순히 이렇게만 해서는 삭제할 수 없다. 2번 게시글에는 댓글이 달려있다(즉, 자식이 딸려있다)
	-- 2번 게시글에 달린 댓글을 먼저 삭제해보자
    delete from comment1 where id=3;
    -- 그리고 2번 게시글을 지우면 된다
	delete from board1 where id=2;
    
-- 부모 테이블과 자식 테이블을 한꺼번에 지워보자
drop table if exists board2;
drop table if exists comment2;
create table board2(
	id bigint,
	board_writer varchar(20) not null,	-- 여기 unique를 주면??? 한 작성자는 하나의 글밖에 쓸 수 없다
    board_contents varchar(500),
    constraint pk_board2 primary key(id)
);
create table comment2(
	id bigint,
    comment_writer varchar(20) not null,
	comment_contents varchar(200),
    board2_id bigint,
    constraint pk_comment2 primary key(id),
    constraint fk_comment2 foreign key(board2_id) references board2(id) on delete cascade
);

/*  1. 게시글 4개 작성
	2. 1, 2번 게시글에 댓글 작성
	3. 3번 게시글 삭제
    4. 2번 게시글 삭제 */
-- 1.
insert into board2 (id, board_writer, board_contents)
	values (1, 'writer1', 'contents1');
insert into board2 (id, board_writer, board_contents)
	values (2, 'writer2', 'contents2');
insert into board2 (id, board_writer, board_contents)
	values (3, 'writer3', 'contents3');
insert into board2 (id, board_writer, board_contents)
	values (4, 'writer4', 'contents4');
select * from board2;
-- 2.
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(1, 'c_writer1', 'c_comments1', 1);
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(2, 'c_writer2', 'c_comments2', 1);
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(3, 'c_writer3', 'c_comments3', 2);
select * from comment2;
-- 3.
delete from board2 where id=3;
select * from board2;
-- 4.
delete from board2 where id=2;
select * from board2;

-- on delete set null
drop table if exists board3;
drop table if exists comment3;
create table board3(
	id bigint,
	board_writer varchar(20) not null,	
    board_contents varchar(500),
    constraint pk_board3 primary key(id)
);
create table comment3(
	id bigint,
    comment_writer varchar(20) not null,
	comment_contents varchar(200),
    board3_id bigint,
    constraint pk_comment3 primary key(id),
    -- 자식 데이터는 유지되고, 부모 데이터는 null로 바꿈
    constraint fk_comment3 foreign key(board3_id) references board3(id) on delete set null
);

insert into board3 (id, board_writer, board_contents)
	values (1, 'writer1', 'contents1');
insert into board3 (id, board_writer, board_contents)
	values (2, 'writer2', 'contents2');
insert into board3 (id, board_writer, board_contents)
	values (3, 'writer3', 'contents3');
insert into board3 (id, board_writer, board_contents)
	values (4, 'writer4', 'contents4');
select * from board3;
-- 2.
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(1, 'c_writer1', 'c_comments1', 1);
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(2, 'c_writer2', 'c_comments2', 1);
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(3, 'c_writer3', 'c_comments3', 2);
select * from comment3;
-- 3.
delete from board3 where id=3;
select * from board3;
-- 4.
delete from board3 where id=2;
select * from comment3;

-- 수정 쿼리
/* 1번 게시글의 내용을 바꿔보자 */
select * from board3;
update board3 set board_contents='안녕하세요' where id=1;

/* 4번 게시글의 작성자를 '작성자4'로, 내용을 '곧 점심시간ㅋㅋ'로 바꿔보자 */
update board3 set board_writer='작성자4', board_contents='곧 점심시간ㅋ' where id=4;
select * from board3;

-- id 칼럼에 번호 자동배정
drop table if exists board4;
drop table if exists comment4;
create table board4(
	id bigint auto_increment,	-- auto_increment는 pk 지정을 해줘야만 가능
	board_writer varchar(20) not null,	
    board_contents varchar(500),
    constraint pk_board4 primary key(id)
);
insert into board4(board_writer, board_contents)
	values ('writer1', 'contents1');
insert into board4(board_writer, board_contents)
	values ('writer2', 'contents2');
insert into board4(board_writer, board_contents)
	values ('writer3', 'contents3');
select * from board4;

-- 연습문제
drop table if exists book;
drop table if exists customer;
drop table if exists orders;

create table book(
	id bigint auto_increment,	
    b_bookname varchar(20) not null,
    b_publisher varchar(20) not null,
    b_price bigint,
    constraint pk_book primary key(id)
);
insert into book(b_bookname, b_publisher, b_price)
	values ('축구의 역사', '굿스포츠', '7000');
insert into book(b_bookname, b_publisher, b_price)
	values ('축구스카우팅 리포트', '나무수', '13000');
insert into book(b_bookname, b_publisher, b_price)
	values ('축구의 이해', '대한미디어', '22000');
insert into book(b_bookname, b_publisher, b_price)
	values ('배구 바이블', '대한미디어', '35000');
insert into book(b_bookname, b_publisher, b_price)
	values ('피겨 교본', '굿스포츠', '8000');
insert into book(b_bookname, b_publisher, b_price)
	values ('피칭 단계별기술', '굿스포츠', '6000');
insert into book(b_bookname, b_publisher, b_price)
	values ('야구의 추억', '이상미디어', '20000');
insert into book(b_bookname, b_publisher, b_price)
	values ('야구를 부탁해', '이상미디어', '13000');
insert into book(b_bookname, b_publisher, b_price)
	values ('올림픽 이야기', '삼성당', '7500');
insert into book(b_bookname, b_publisher, b_price)
	values ('Olympic Champions', 'Pearson', '13000');
select * from book;

create table customer(
	id bigint auto_increment,	
    c_name varchar(10) not null,
    c_address varchar(20) not null,
    c_phone varchar(20),
    constraint pk_customer primary key(id)
);
insert into customer(c_name, c_address, c_phone)
	values ('손흥민', '영국 런던', '010-5000-0001');
insert into customer(c_name, c_address, c_phone)
	values ('김연아', '대한민국 서울', '010-6000-0001');
insert into customer(c_name, c_address, c_phone)
	values ('김연경', '중국 상하이', '010-7000-0001');
insert into customer(c_name, c_address, c_phone)
	values ('류현진', '캐나다 토론토', '010-8000-0001');
insert into customer(c_name, c_address)
	values ('이강인', '스페인 마요르카');
select * from customer;

create table orders(
	id bigint auto_increment,
    customer_id bigint,
    book_id bigint,
	o_saleprice bigint,
    o_orderdate date,
	constraint pk_orders primary key(id),
    /*  constraint 뒤에는 **제약조건의 이름** 
		즉, "제약조건을 걸 건데, 그 이름을 ~~로 할 것이다." 라는 것
        !! 이 이름을 똑같이 했더니 에러가 나길래 이것저것 고쳐보면서 깨우친 사실ㅎㅎ !!
    */
	constraint fk_customer_id foreign key(customer_id) references customer(id) on delete cascade,
    constraint fk_book_id foreign key(book_id) references book(id) on delete cascade
);
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (1, 1, 6000, str_to_date('2021-07-01','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (1, 3, 21000, str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (2, 5, 8000, str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (3, 6, 6000, str_to_date('2021-07-04','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (4, 7, 20000, str_to_date('2021-07-05','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (1, 2, 12000, str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (4, 8, 13000, str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (3, 10, 12000, str_to_date('2021-07-08','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (2, 10, 7000, str_to_date('2021-07-09','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values (3, 8, 13000, str_to_date('2021-07-10','%Y-%m-%d'));
select * from orders;

-- 1. 모든 도서의 가격과 도서명 조회 
select id, b_bookname, b_price from book; 
-- 2. 모든 출판사 이름 조회 
select b_publisher from book; 
	-- 2.1 중복값을 제외한 출판사 이름 조회 
	select distinct b_publisher from book; 
    select b_publisher from book group by b_publisher;
-- 3. BOOK테이블의 모든 내용 조회 
select * from book;
-- 4. 20000원 미만의 도서만 조회
select * from book where b_price < 20000; 
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where b_price <= 20000 and b_price >= 10000; 
select * from book where b_price between 10000 and 20000; 
-- 6. 출판사가 굿스포츠 또는 대한미디어인 도서 조회 
select * from book where b_publisher='굿스포츠' or b_publisher='대한미디어';
select * from book where b_publisher in ('굿스포츠', '대한미디어');
-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' and b_price >= 20000;
-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price, b_bookname asc;

-- 중간중간 확인차ㅎㅎㅎ
select * from orders;
-- 12. 주문 도서의 총 판매액 조회 
select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 
select sum(o_saleprice) from orders where customer_id=1;
-- 14. ORDERS 테이블로 부터 평균판매가, 최고판매가, 최저판매가 조회 
select round(avg(o_saleprice),0) as '평균판매가', max(o_saleprice) as '최고판매가', min(o_saleprice) as '최저판매가' from orders;
-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회
select customer_id, count(*), sum(o_saleprice) from orders group by customer_id;
-- 16. 가격이 8,000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상 구매한 고객만) 
select customer_id, count(book_id) from orders group by customer_id having avg(o_saleprice) >= 8000;
-- 17. 김연아고객(고객번호 : 2) 총 구매액
select customer_id, sum(o_saleprice) from orders where customer_id=2 group by customer_id;
-- 18. 김연아 고객이 구매한 도서의 수
select customer_id, count(*) from orders where customer_id=2 group by customer_id;
-- 19. 서점에 있는 도서의 총 권수
select count(*) from book;
-- 20. 출판사의 총 수 
select count(distinct b_publisher) from book;
-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 
select id, o_orderdate from orders where o_orderdate >= str_to_date('2021-07-04','%Y-%m-%d') and o_orderdate <= str_to_date('2021-07-07','%Y-%m-%d');
-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회
select id, o_orderdate from orders where not o_orderdate >= str_to_date('2021-07-04','%Y-%m-%d') or not o_orderdate <= str_to_date('2021-07-07','%Y-%m-%d');


    


