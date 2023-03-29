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

