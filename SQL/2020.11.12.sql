-- 2020.11.12

-- DDL

-- 테이블 생성 : create table table_name
-- (
--      column domain constraint),
--      column domain constraint),
--      column domain constraint)
--      ...
-- )

create table test_tbl (
    no number(4),
    user_name varchar2(10),
    user_id varchar2(16),
    user_password varchar2(12),
    reg_date Timestamp default sysdate 
);

desc test_tbl;

-- 사원 테이블과 유사한 구조의 사원번호, 사원이름, 급여 3개의 칼럼으로 구성된 emp01 테이블을 생성하기
desc emp;

create table emp01 (
    empno number(4),
    ename varchar2(10),
    sal number(7,2)
);
desc emp01;

-- create table ~ as ~ : 테이블 복사
-- AS절을 추가해서 emp 테이블과 동일한 내용구조를 갖는 
-- emp02 테이블을 생성해 보자
-- emp02 테이블 
create table emp02
as
select *from emp;

desc emp02;
desc emp;
select * from emp02;

-- create원하는 컬럼만 선택적으로 복사
-- d
create table emp03
as
select empno, ename, sal from emp
;
select * from emp03;

-- 서브 쿼리문의 select 문을 구성할 때
-- where 절을 추가하여 원하는 조건을 제시하면
-- 기존 테이블에서 일부의 행만 복사
create table emp04
as
select * from emp where deptno=10;
select * from emp04;

-- where 조건 절에 항상 거짓이 되는 조건을 지정하게 되면
-- 테이블에서 얻어질 수 있는 로우가 없게 되므로 빈 테이블이 생성되게 된다.
create table emp05
as
select * from emp where 1=2;

select * from emp05;

select * from tab;

-- 테이블의 삭제; 저장공간을 삭제 -> 저장되어 있는 데이터도 모두 삭제
-- drop table table_name
drop table test_tbl;

-- truncate : 테이블의 모든 행을 바로 삭제 물리적인 적용도 바로 진행 delete
create table emp06
as
select * from emp;
select * from emp06;
truncate table emp06;

-- rename 현재 테이블 이름 to 새로운 이름
rename emp06 to new_emp;
select * from tab;
rename new_emp to hot_emp;
select * from tab;

-- 테이블 구조의 변경
-- alter table table_name {add(컬럼의 추가) | modify(컬럼의 수정) | drop(컬럼의 삭제)}

-- 기존 테이블에 속성을 추가 : 각 행의 컬럼 데이터는 null 값으로 채워진다.
-- emp01 job 컬럼을 추가 job varchar2(10)
desc emp01;

alter table emp01
add (deptno number(2))
;

-- 기존 테이블의 컬럼 변경 : 새로 정의된 컬럼으로 교체하는 것
alter table emp01
MODIFY (deptno number(10))
;

-- 기존 테이블의 컬럼 삭제 : 데이터 모두 삭제
alter table emp01
drop (deptno)
;

-- 제약 조건 정의
insert into dept values(10,'test','seoul');

desc emp01;
insert into emp01 values(null,null,1000, 'tester');
select * from emp01;

-- emp01 테이블 삭제
drop table emp01;

-- emp01 테이블 생성 : empno, ename에 null 값이 들어가지 않도록 제약
create table emp01(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar(9),
    deptno number(2)
);

insert into emp01 values(null,null,'tester',10);
insert into emp01 values(1,test1,'tester',10);

-- 데이터의 중복을 금지 : unique
drop table emp02;
create table emp02(
    empno number(4) unique,
    ename varchar2(10) not null
    );
desc emp02;

insert into emp02 values(1,'test1');
insert into emp02 values(1,'test2');
select * from emp02;

-- empno not null, unique 제약을 동시에 적용
drop table emp03;

create table emp03(
    empno number(4) not null unique, -- 두개의 제약 조건할때 공백 하나
    ename varchar2(10) not null
);

insert into emp03 values(null, 'test1');
insert into emp03 values(1, null);
insert into emp03 values(1, 'test1');
insert into emp03 values(1, 'test2');
insert into emp03 values(2, 'test2');
select * from emp03;

-- 기본키 제약 : 기본키(primary key) 설정 -> not null, unique
drop table emp04;
create table emp04(
    empno number(4) primary key,
    ename varchar2(10) not null
);
insert into emp04 values(null,'test');
insert into emp04 values(1,'test');
select*from emp04;

-- 왜래키 제약 : 참조하는 테이블과 컬럼을 정의
drop table emp05;
create table emp05(
    empno number(4) primary key,
    ename varchar2(10) not null,
    deptno number(2) references dept(deptno) -- dept 테이블에 있는 수만 허용 10,20,30,40 까지 가능
);

insert into emp05 values(1,'test',10);
insert into emp05 values(2,'test',60);
insert into emp05 values(3,'test',null);

select * from emp05;

-- check : 특정 범위 제한
create table emp06(
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7,2) check (sal>=800) -- in 연산 or 연산 
);
insert into emp06 values(1,'test', 1000);
insert into emp06 values(1,'test', 799);

-- default : insert 시에 데이터가 입력되지 않을 때 자동으로 등록되는 데이터 정의
create table emp07(
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7,2) check (sal>=500),
    comm number(7,2) default 0,
    hiredate date default sysdate
);

drop table emp07;

create table emp07(
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7,2) check (sal>=500),
    comm number(7,2),
    hiredate date default sysdate
);

insert into emp07(empno, ename, sal) 
values (1, 'test', 3000);

select*from emp07;




-- 제약 조건의 이름 부여
drop table emp08;
create table emp08 (
    empno number(4) constraint emp08_empno_PK primary key,
    ename varchar2(10) constraint emp08_ename_NN not null,
    sal number(7,2) constraint emp08_sal_CK check (sal>=500),
    comm number(7,2) default 0,
    hiredate date default sysdate
);

insert into emp08(empno, ename, sal) values (1, 'test', 3000);

select*from emp08;


-- 테이블 레벨에서 제약조건 정의
drop table emp09;
create table emp09(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(10),  -- 컬럼 정의 끝
    constraint emp09_empno_pk primary key (empno),
    constraint emp09_job_uk unique (job),
    constraint emp09_deptno_fk foreign key (deptno) references dept(deptno) -- 제약조건의 정의 끝
);


insert into emp09 values (null,null,'job1', 50);
insert into emp09 values (1, 'tester', 'job1', 40);
insert into emp09 values (1, 'tester', 'job1', 40);
select * from emp09;


-----------------------------------------------------------------------------------------------

-- DML 테이블의 내용추가,수정,삭제
-- DML 의 대상은 행이다. 행단위 입력, 행단위 수정, 행단위 삭제

-- 데이터 삽입
-- insert into table_name (데이터 저장할 컬럼들) values( 저장)

-- dept01 테이블 생성
create table dept01
as
select * from dept where 1=2
;
insert into dept01 (deptno, dname, loc)
        values (10, '마케팅', '서울')
;
select * from dept01;

desc dept01;
insert into dept01 values (20, '디자인', '부산');

-- null 값의 입력
insert into dept01 (deptno, dname) values (30,'QC');
insert into dept01 values (40, 'DEV', null);

-- 서브쿼리를 이용해서 데이터 입력
drop table dept02;
create table dept02
as
select * from dept where 1=2
;
select * from dept02;

insert into dept02
select * from dept
;

-- 데이터의 수정
-- update table_name set column_name = value, ... , where 행을 찾기위한 조건
drop table emp10;

select * from emp10;

create table emp10
as
select * from emp;

-- 모든 사원의 부서번호를 30번으로 수정합시다.
update emp10 set deptno=30;

-- 모든 사원의 급여를 10% 인상시키는 update 문을 써보자
update emp10
set sal = sal*1.1;

-- 모든 사원의 입사일을 오늘로 수정
update emp10
set hiredate = sysdate
;

-- 급여가 3000이상인 사람들만 10% 인상
update emp10
set sal = sal*1.1
where sal >= 3000
;

-- 1987년에 입사한 사원의
-- 입사일을 오늘로 수정하는 테이블
update emp10
set hiredate = sysdate
--where hiredate between '1987/01/01'and'1987/12/31'
where substr(hiredate 1,2)='87';

select * from emp10 where substr(hiredate,1,2)='87';

-- 전체 데이터를 삭제 DDL
truncate table emp10;
insert into emp10
select *from emp
;

-- SCOTT 사원의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정하도록 한다.
UPDATE EMP10
SET DEPTNO=20, JOB='MANAGER'
WHERE ENAME='SCOTT';

select * from emp10;

-- SCOTT 사원의 입사일자는 오늘로, 급여를 50으로 커미션을 4000으로 수정
update emp10
set sal=50, comm=4
where ename='SCOTT'
;

-- 20번 부서의 지역명을
-- 40번 부서의 지역명으로
-- 변경하기 위해서 서브 쿼리문을 사용하기
select loc from dept01 where deptno=40;

update dept01
set loc=(select loc from dept01 where deptno=40)
where deptno=20;

select * from dept01;

-- 부서번호가 20번인 부서의 이름과 지역은 RESERCH and DALLAS
-- 부서번호가 20인 부서의 부서명과 지역명을
-- 부서번호가 40번인 부서와 동일하게 변경하기위한 UPDATE문

update dept01
set dname = (select dname from dept01 where deptno=10),
loc=(select loc from dept01 where deptno=40)
where deptno=20
;
update dept01
set (loc,dname) = (select loc, dname from dept01 where deptno=40)
where deptno=20
;

select*from dept01;


-- 테이블의 행단위 삭제 where절 주의
-- delete from table_name : 행단위 삭제, where가 없으면 전체 행이 대상

-- dept01 테이블의 모든 데이터를 삭제
select*from dept01;
delete from dept01;

-- emp10
select*from emp10;

-- emp10 테이블의 데이터중 부서번호가 20번 부서의 사원들을 삭제
delete from emp10 where deptno=20;

-- 사원 테이블에서 부서명이 SALES인 사원을 모두 삭제해보자
delete from emp10
where deptno=(
         select deptno from dept where dname='SALES'
)
;

rollback;

select * from emp10;

-- join & sub query -------------------------------------------------------------------------------------
select * from book;
select * from customer;
select * from orders;

-- 1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
-- (5) 박지성이구매한도서의출판사수 -- book table

select distinct o.bookid
from customer c, orders o
where c.custid=o.custid
and c.name='박지성'
;

-- join을 이용한 해결
select count(distinct b.publisher)
from customer c, book b, orders o
where o.custid=c.custid and o.bookid=b.bookid
and c.name='박지성'
;

select bookid, bookname, publisher --count(distinct)
from book
where bookid in (
select distinct o.bookid
from customer c, orders o
where c.custid=o.custid
and c.name='박지성'
)
;



-- (6) 박지성이구매한도서의이름, 가격, 정가와 판매 가격의 차이

select b.bookname, b.price, b.price-o.saleprice
from customer c, book b, orders o
where c.custid=o.custid and b.bookid=o.bookid
and c.name='박지성'
;

select custid from customer where name='박지성';

select *
from book b, orders o
where b.bookid=o.bookid
and o.custid=(select custid from customer where name='박지성')
;

-- (7) 박지성이 구매하지 않은 도서의 이름

-- 도서의 이름 출력
-- 박지성이 구매한 도서의 id
select bookid
from orders
where custid=(select custid from customer where name='박지성')
;

-- 도서의 이름 출력
-- 박지성이 구매하지 않은 도서의 이름(sub query)
select bookname
from book
where bookid not in (
            select bookid
            from orders
            where custid=(
                select custid from customer where name='박지성'
            )
)
;

-- 박지성이 구매하지 않은 도서의 이름(join)
select distinct b.bookname
from customer c, book b, orders o
where c.custid=o.custid and b.bookid=o.bookid
and c.name !='박지성'
;



-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

-- (8) 주문하지않은고객의이름(부속질의사용)
select distinct custid from orders;
-- 구매 고객 리스트
select *
from customer
where custid not in (select distinct custid from orders)
;

-- join을 이용한 문제해결
select c.name
from orders o, customer c
where o.custid(+)=c.custid
and o.orderid is null
;

-- (9) 주문금액의총액과주문의평균금액
select sum(saleprice), avg(saleprice)
from orders
;

-- (10) 고객의이름과고객별구매액
select c.name, sum(saleprice)
from customer c, orders o
where c.custid=o.custid
group by c.name
;

-- (11) 고객의이름과 고객이 구매한 도서목록
select c.name, b.bookname
from customer c, orders o, book b
where c.custid=o.custid and b.bookid=o.bookid
;

-- (12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
-- orders orderid

select o.orderid
from orders o, book b
where o.bookid=b.bookid
and b.price-o.saleprice >= all (
                                select b.price-o.saleprice
                                from orders o, book b
                                where o.bookid=b.bookid
)
;

select max(b.price-o.saleprice)
from orders o, book b
where o.bookid=b.bookid
;


-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름

-- 판매액 평균
select avg(saleprice) from orders;
-- 자신의 구매액 평균
select c.name, avg(saleprice)
from customer c, orders o
where c.custid=o.custid
group by c.name
having avg(saleprice)>(select avg(saleprice) from orders)
;

-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

-- 박지성이 구매한 도서의 출판사
select distinct b.publisher
from customer c, orders o, book b
where c.custid=o.custid and b.bookid=o.bookid
and c.name='박지성'
;
-- 같은 출판사에서 도서를 구매한 고객의 이름
select c.name
from customer c, orders o, book b
where c.custid=o.custid and b.bookid=o.bookid
and b.publisher in (
                select distinct b.publisher
                from customer c, orders o, book b
                where c.custid=o.custid and b.bookid=o.bookid
                and c.name='박지성'
)
and c.name!='박지성'
;



-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

select c.name, count(distinct publisher)
from customer c, book b, orders o
where c.custid=o.custid and b.bookid=o.bookid
group by c.name
having  count(distinct publisher)>1
;


select c.name, b.bookname, b.publisher
from customer c, orders o, book b
where c.custid=o.custid and b.bookid=o.bookid
order by c.name
;

-- sub query 는 세개 이상은 자제하기


