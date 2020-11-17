-- 2020.11.11

-- JOIN

-- CROSS JOIN : 조건 없이 테이블과 테이블을 붙여준다.
select *
from emp,dept
;

-- ANSI JOIN : CROSS JOIN
select *
from emp cross join dept
;

-- Equi JOIN
select *
from emp,dept
where emp. deptno = dept.deptno
;

--SCOTT의 사원번호와 이름, 부서이름, 지역을 출력
select empno, ename, emp.deptno, dname, loc
from emp, dept
where emp.deptno=dept.deptno and ename='SCOTT'
;

select empno, ename, dept.deptno, dname, loc
from emp, dept
where emp.deptno=dept.deptno and ename='SCOTT'
;

-- 별칭사용
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno=d.deptno and e.ename='SCOTT'
;

-- ANSI -> T1 INNER JOIN T2 ON 조인의 조건
select *
from emp inner join dept
on emp.deptno=dept.deptno
;

-- ANSI -> Using을 이용해서 ANSI join 생략
select *
from emp join dept
-- on emp.deptno=dept.deptno
using(deptno) -- 공통 컬럼은 하나만 가지게 해준다. 공통컬럼을 구별할 필요가 없음.
;

-- NATURAL JOIN : 동일 컬럼 조인의 조건을 생략, 같은 이름의 컬럼으 하나씩
select ename, deptno, dname
from emp NATURAL JOIN dept
;

-- Non Equi JOIN : 동등 비교가 아닌 비교연산이 가능
-- 급여 등급을 5개로 나누어 놓은 salgrade에서 정보를 얻어 와서
-- 각 사원의 급여 등급을 지정해보도록 합시다.
-- 이를 위해서 사원 테이블(emp)과 급여 등급 테이블(salgrade)을 조인하도록 합시다.
-- 사원의 급여가 몇 등급인지 살펴보자

-- 1. CROSS JOIN -> 조건
select *
from emp e, salgrade s
where e.sal BETWEEN s.losal AND s.hisal 
;

select * from salgrade;

-- Self JOIN : 자신의 테이블을 조인
-- SMITH 매니저의 이름이 무엇인지

select e.ename, e.mgr, m.ename
from emp e, emp m
where  e.mgr = m.empno
and e.ename = 'SMITH'
;

select ename from emp where empno=7902;

-- Outer Join : 정보가 부족해도 출력하도록 하는 Join
select e.ename, e.mgr, m.ename
from emp e, emp m
where  e.mgr = m.empno(+)
;

-- ANSI outer JOIN
-- T1 [LEFT | RIGHT | FULL] OUTER JOIN T2
select *
from emp m right outer join emp e
on e.mgr=m.empno
;

select *
from emp e left outer join emp m
on e.mgr=m.empno
;


-- 회원, 구매
-- customer, orders
select * from customer;
select * from orders ORDER BY custid;

-- 회원별 구매 횟수
select c.name, count(o.orderid), sum(o.saleprice), avg(o.saleprice)
from customer c, orders o
where c.custid = o.custid(+)
group by c.name
;

--==================================================================

-- 서브쿼리

-- sal > 평균급여(그룹->select)
-- 스칼라 부속질의 - select 부속질의, 단일 행 단일열
-- 인라인 뷰      - from 부속질의, 복합 행 복합 열
-- 중첩질의       - where 부속질의, 단일 열, 단순비교 -> 단일 행, 집합 비교 -> 복합 행

-- 중첩 질의 : 단순 비교

-- 평균 급여보다 더 많은 급여를 받는 사원을 출력

select avg(sal)
from emp;
-- 2073.214285714285714285714285714285714286

select *
from emp
where sal > 2073.214285714285714285714285714285714286 -- 평균급여
;

select *
from emp
where sal > (select avg(sal) from emp) -- 평균급여
;

-- SCOTT 사원의 같은 부서에 근무하는 사원의 리스트를 출력
select deptno from emp where ename='SCOTT';

select ename from emp
where deptno = (select deptno from emp where ename='SCOTT')-- SCOTT이 소속된 부서 번호
;

-- sal 3000이상 받는 사원이 소속된 부서
select distinct deptno from emp where sal >= 3000;

select *
from emp
--where deptno=10 or deptno=20
where deptno in (select distinct deptno from emp where sal >= 3000)
;

-- 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는
-- 사람의 이름, 급여를 출력하는 쿼리문을 작성해 봅시다.

select max(sal) from emp where deptno = 30;
select sal from emp where deptno = 30;

select ename, sal
from emp
--where sal > 2850
--where sal > (select max(sal) from emp where deptno = 30)
--where sal > all (select sal from emp where deptno = 30)   -- and
where sal > any (select sal from emp where deptno = 30)     -- or
;

-- ROWNUM
select rownum, empno, ename, hiredate
from emp
where rownum < 4
order by hiredate
;

select rownum, empno, ename, hiredate from emp order by hiredate;

select rownum, empno, ename, hiredate
from(select rownum, empno, ename, hiredate from emp order by hiredate desc) -- 인라인 뷰
where rownum < 4
;

-- 가장 급여를 많이 받는 상위 사원 5명을 출력하자
select rownum, ename, sal from emp order by sal desc;

select rownum, ename, sal
from (select rownum, ename, sal from emp order by sal desc)
where rownum < 6
;

--- mysql --> top   select*from emp limit 0,3

-- 스칼라 부속질의 : select 절 프리젠테이션 영역에 쓸 수 잇는 부속질의, 단일행, 단일열, 단일값의 결과만 나와야한다.

select name from customer where customer.custid = orders.custid;

select custid, (select name from customer where customer.custid = orders.custid),
saleprice, orderdate
from orders
;

-- 마당서점의 고객별 group by
-- 판매액을 보이시오 orders
-- (결과는 고객이름과 고객별 판매액을 출력).
select c.custid, c.name, sum(o.saleprice)
from customer c, orders o
where c.custid=o.custid(+)

group by c.custid, c.name
order by sum(o.saleprice)
;

select o.custid,(
    select name from customer c where o.custid=c.custid),
    sum(o.saleprice)
from orders o
group by o.custid
;

select custid, name
from customer
where custid<=2
;

-- 인라인 뷰 : from 절 이후로 들어가는 서브쿼리, 가상테이블, rownum이 새롭게 생성
select c.name, sum(o.saleprice), avg(o.saleprice)
from orders o, (
    select custid, name
    from customer
    where custid<=2
    ) c
where o.custid=c.custid
group by c.name
;


-- 평균 주문금액 이하의 주문에 대해서 
-- 주문번호와 금액을 보이시오. (orderid, saleprice)
select avg(saleprice) from orders;

select orderid,saleprice
from orders
where saleprice <= (select avg(saleprice) from orders)-- 평균 주문 금액
;

-- 각 고객의 평균 주문금액보다 큰 금액의 주문내역에 대해서 주문번호, 고객번호, 금액을 보이시오.
select avg(saleprice) from orders where custid=2;

select orderid, o1.custid, saleprice
from orders o1
where saleprice >
(select avg(saleprice) from orders o2 where o2.custid=o1.custid)-- custid=1 이면 1번 고객의 평균과 비교해서 큰 주문 금액만 출력
;


select * from customer where address like '%대한민국%';
-- 대한미국에 거주하는 고객에게 판매한 도서의 총 판매액 구하기
select sum(saleprice)
from orders
where custid in (select custid from customer where address like '%대한민국%')
;


--3번 고객이 주문한 도서의 최고 금액보다
-- 더 비싼 도서를 구입한
-- 주문의 주문번호와 금액을 보이시오.
select max(saleprice) from orders where custid=3;

select orderid, saleprice
from orders
--where saleprice > (select max(saleprice) from orders where custid=3)
where saleprice > all(select saleprice from orders where custid=3)
;

-- EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
select*from customer where address like '%대한민국%';

select sum(saleprice)
from orders o
where EXISTS (select saleprice from customer where address like '%대한민국%' and o.custid=c.custid)
;






-- JOIN 문제 풀이 ---------------------------------------------------------------------------

-- 32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
-- 사원 이름 - emp, 부서이름 - dept
-- cross join에서 공통 컬럼의 동등 비교로 의미있는 결과로 만든 JOIN
-- cross join
select ename, emp.deptno, dept.dname
from emp, dept
where emp. deptno = dept.deptno and ename = 'SCOTT'
;
select *
from emp, dept
;
-- equi join
select ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and ename = 'SCOTT';

select *
from emp e join dept d
-- on e.deptno=d.deptno
using(deptno)
;

select *
from emp natural join dept
;


--33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
select emp.ename,dept.dname,dept.loc
from emp inner join dept
on emp.deptno=dept.deptno
;

select e.ename, d.dname, d.loc
from emp e inner join dept d
on e.deptno = d.deptno
;


--36. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select ename, dname
from emp,dept
where emp.deptno = dept.deptno and ename like '%A%'
;

select ename, dname
from emp, dept
where emp.deptno=dept.deptno
and emp.ename like '%A%'
;

--37. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select ename, job, dname, deptno
from emp join dept
using(deptno)
where loc = 'NEWYORK'
;

select ename, e.job, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and d.loc="NEW YORK"
;

--38. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
select e.ename, e.empno, m.ename
from emp e, emp m
where e.mgr=m.empno
;

--39. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select e.empno, e.ename, e.mgr, m.ename as "관리자"
from emp e, emp m
where  e.mgr = m.empno(+)
order by e.empno desc
;
-- Ansi join
select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m
on e.mgr=m.empno
order by e.empno
;

--40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
select e.ename, e.deptno, e1.ename
from emp e, emp e1
where e.deptno = e1.deptno and e.ename = 'SCOTT'
;

-------------------------------------

select s.ename, s.deptno
from emp e, emp s
where e.deptno=s.deptno
and e.ename='SCOTT'
and s.ename!='SCOTT'
;

--41. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select e1.ename as "늦게입사한이름", e1.hiredate as "입사한 일"
from emp e, emp e1
where e.hiredate < e1.hiredate and e.ename='WARD'
order by e1.hiredate asc
;
------------------------------
select e.ename, e.hiredate
from emp e, emp w
where w.ename='WARD'
and e.hiredate>w.hiredate
;


-- 42. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.ename, e.hiredate, e1.ename, e1.hiredate 
from emp e, emp e1
where e.hiredate < e1.hiredate and e.mgr = e1.empno
;
-----------------------------------------------------
select e.ename, e.hiredate, m.ename, m.hiredate
from emp e, emp m
where e.mgr=m.empno
and e.hiredate<m.hiredate
;







-- 부속질의 문제 풀이---------------------------------------------------------------------------------------------------
-- 43. 사원 번호가 7788인 사원과 담당 업무가 같은 - 조건
--     사원을 표시(사원 이름과 담당업무)하시오.
--     7788 사원의 담당업무 추출 (sub query)
--     같은 업무를 하는 사원 (main query)
select ename, job from emp
where job=(select job from emp where empno = 7788)
;
--------------------------------------------------
select job from emp where empno=7788;
select *
from emp
where job=(select job from emp where empno=7788);



-- 44. 사원번호가 7499인 사원보다 급여가 많은 
--     사원을 표시하시오. 사원이름과 감당 업무
select ename, job from emp
where sal > (select sal from emp where empno = 7499)
;
----------------------------------------------------
select sal from emp where empno=7499;
select ename, job 
from emp
where sal>(select sal from emp where empno=7499)
;



-- 45. 최소급여를
--     받는 사원의 이름, 담당업무 및 급여를 표시하시오. (그룹함수 사용)
--     min() 
select ename, job, sal from emp 
where sal=(select min(sal) from emp)
;
------------------------------------------------------
select min(sal) from emp;
select ename,job
from emp
where sal=(select min(sal) from emp)
;
--all-------------------------------------------------
select ename,job, sal
from emp
where sal<=all(select sal from emp)
;



-- 46. 평균급여가 가장 적은 직급의 직급 이름과 
--     직급의 평균을 구하시오.
select job, avg(sal) 
from emp
where sal<(select avg(sal) from emp)
group by job
;
--------------------------------------------------------------
select job, avg(sal)
from emp
group by job;

select job, avg(sal)
from emp
group by job
having avg(sal)<=all(select avg(sal)from emp group by job)
;



-- 47. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select deptno, min(sal)
from emp
group by deptno
;

select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where sal > min(sal))
group by deptno
;
-----------------------------------------------------------------------
select deptno, min(sal)
from emp e2
where deptno=30
group by deptno
;
select ename, sal, deptno
from emp e1
where sal=(select min(sal)
        from emp e2
        where e2.deptno=e1.deptno
        group by e2.deptno)
;



-- 48. 담당업무가 ANALYST 인 사원보다 급여가 적으면서 
--     업무가 ANALYST가 아닌 사원들을 표시(사원번호, 이름, 담당 업무, 급여)하시오.
select deptno, ename, job, sal from emp
where sal < any(select sal from emp where job='ANALYST')
;
-------------------------------------------------------------------------
select distinct sal from emp where job='ANALYST'
;
select deptno, ename, job, sal
from emp
where sal<= all(select distinct sal from emp where job='ANALYST')
and job!='ANALYST'
;



-- 49. 부하직원이 없는 사원의 이름을 표시하시오.
select distinct mgr from emp;

select *
from emp
where empno in (select distinct mgr from emp)
;



-- 50. 부하직원이 있는 사원의 이름을 표시하시오.
select distinct mgr from emp where mgr is not null;

select *
from emp
where empno not in (select distinct mgr from emp where mgr is not null)
;



-- 51. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오. 
--     ( 단 BLAKE는 제외 )
select ename, hiredate from emp 
where deptno = (select deptno from emp where ename ='BLAKE')
and ename != 'BLAKE';
----------------------------------------------------------------------------
select deptno, ename from emp where ename='BLAKE';

select ename, hiredate
from emp
where deptno=(select deptno from emp where ename='BLAKE')
and ename!='BLAKE'
;


-- 52. 급여가 평균 급여보다 많은 
--     사원들의 사원 번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
SELECT avg(sal) FROM emp;

SELECT empno, ename, sal
from emp
where sal>(SELECT avg(sal) FROM emp)
order by sal
;



-- 53. 이름에 K가 포함된 사원과 
--     같은 부서에서 일하는 사원의 사원 번호와 이름을 표시하시오.
select DISTINCT deptno, ename from emp where ename like '%K%';

select empno, ename, deptno
from emp
where deptno in (select distinct deptno from emp where ename like '%K%')
;


-- 54. 부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하시오.
select deptno from dept where loc='DALLAS';

select ename, deptno
from emp
where deptno=(select deptno from dept where loc='DALLAS')
;



-- 55. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
-- mgr -> king의 사원번호를 가지고 있는 사원을 찾는것
select empno from emp where ename='KING';

select ename, sal, mgr
from emp
where mgr=(select empno from emp where ename='KING')
;


-- 56. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.
select deptno from dept where dname='RESEARCH';
select deptno, ename, job
from emp
where deptno=(select deptno from dept where dname='RESEARCH')
;



-- 57. 평균 월급보다 많은 급여를 받고 
--     이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원 번호, 이름, 급여를 표시하시오.
select avg(sal) from emp;
select distinct deptno from emp where ename like '%M%';
-- sub query
select deptno, ename, sal
from emp
where sal>(select avg(sal) from emp)
and deptno in (select distinct deptno from emp where ename like '%M%')
;



-- 58. 평균급여가 가장 적은 업무를 찾으시오.
select job, avg(sal)
from emp
group by job
;

select job, avg(sal)
from emp
group by job
having avg(sal)<=all(
        select avg(sal)
        from emp
        group by job
        )
;


-- 59. 담당업무가 MANAGER 인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
select distinct deptno from emp where job='MANAGER';

select deptno, ename, job
from emp
where deptno in (select distinct deptno from emp where job='MANAGER')
;


