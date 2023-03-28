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
