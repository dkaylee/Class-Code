-- 2020.11.10
-- 함수

-- 단일행, 집합함수

-- 단일행 함수 : 숫자, 문자, 날짜, 변환

desc dual;

-- 숫자함수 데이터저장을 위한 목적이 아닌 함수의 결과를 출력해보기위함
select ABS(-15.5) from dual; -- 절대값
select FLOOR(15.78) from dual; -- 절사
select ROUND(15.693,1) from dual; -- 반올림
select LOG(10,100) from dual; -- 지수구함
select POWER(3,2) from dual; -- 3의 2승

-- 문자함수
select concat('나는','손흥민 입니다.') from dual;
select concat('저는 이름은 ',ename)from emp where job='MANAGER';
select LOWER('MR. SCOTT MCMILLAN') "Lowercase" FROM DUAL;
select Lower(ename)from emp;
select LPAD('Page 1',15,'*') from dual; -- 빈공간 왼쪽으로 *이 채워지고
select RPAD('001212-3',14,'*') from dual; -- 빈공간 오른쪽으로 *이 채워짐
select SUBSTR('ABCDEFG', 3, 4) from dual; -- index 3부터 4번째까지
select SUBSTR('001212-3001247',1,8) from dual;
select RPAD(substr(juminno,1,8),14,'*') from dual; -- 빈공간 오른쪽으로 *이 채워짐

select Ltrim('     =from=', ' ') from dual;
select Rtrim('     =from======= ', ' ') from dual;
select trim('='from'====From====') as "from" from dual;
select trim(' ' from '     ====From====     ') as "from" from dual;

select REPLACE('JACK and JUE','J','BL') FROM DUAL;
select REPLACE('00000-000000','-','') FROM DUAL;


-- 날짜 함수
select sysdate from dual;
select sysdate+14 from dual;
select sysdate+21 from dual;
select sysdate-3 from dual;

select add_months(sysdate, 4) from dual;
select last_day(sysdate) from dual;

-- 변환 함수
-- TO_CHAR : 날짜 -> 문자, 숫자 -> 문자

-- 날짜 -> 문자
select sysdate, to_char(sysdate,'YYYY.MM.DD day dy') from dual;
select sysdate, to_char(sysdate,'YYYY.MM.DD day dy AM PM HH HH24:MI:SS') from dual;
-- 2020.11.09. 22:14
select to_char(sysdate,'YYYY.MM.DD. HH24:MI:SS') from dual;

-- 숫자 -> 문자
select to_char(10000.12, 'L000,000.00') from dual; -- 출력값 : ￦010,000.12
select to_char(10000.12, 'L999,999.99') from dual; -- 출력값 : ￦10,000.12

select sal, to_char(sal*1100,'L99,999,999') from emp;
select ename, job, sal, to_char(sal*1100*12+nvl(comm,0)*1100,'L99,999,999')as "연봉" from emp order by "연봉" desc ;

-- 문자 -> 날짜
-- 2020.11.01.
select TO_DATE('2009/09/05','YYYY/MM/DD') from dual;
select TO_DATE('2020.11.01.','YYYY.MM.DD.') from dual;

-- 오늘이 2020년 1월 1일에서 몇일이 지났는지 확인
select trunc(sysdate - to_date('20-01-01','YY-MM-DD')) from dual;

-- 내가 몇일을 살았는지 확인
select trunc(sysdate - to_date('93-07-11','YY-MM-DD')) from dual;



-- 문자 -> 숫자
select to_number('100,000.00','999,999.99') / to_number('10.00','999,999.99')from dual;


-- decode 함수 : switch 문과 비슷하다.
-- 사원이름, 부서번호, 부서이름 출력
select ename, deptno,
    decode(deptno,
    10, 'ACCOUNTING',-- DEPTNO = 10이면 
    20, 'RESEARCH',
    30, 'SALES',
    40, 'OPERATIONS'
    ) AS dname
from emp order by deptno
;

-- 지급에 따라 급여를 인상하도록 하자
-- 직급이 'ANALYIST' 5%
-- 직급이 'SALESMAN' 10%
-- 직급이 'MANAGER' 15%
-- 직급이 'CLERK' 20% 인상한다.

select ename, sal,
    decode(job,
        'ANALYST',sal*1.05,
        'SALESMAN',sal*1.1,
        'MANAGER',sal*1.15,
        'CLERK',sal*1.20)
        AS upsal
        from emp
        order by sal;
        
select distinct job from emp;

select ename as name, deptno as dno,
    case 
        when deptno=10 then 'ACCOUNTING'
        when deptno=20 then 'RESEARCH'
        when deptno=30 then 'SALES'
        when deptno=40 then 'OPERATION'
    end as dname
from emp
order by dname;





-- 그룹함수 : 하나의 행의 컬럼을 대상이 아닌 행의 그룹의 컬럼들을 묶어 그룹화 하고 연산하는 함수
-- 그룹함수 : SUM, AVG, COUNT, MAX, MIN

select 
    -- 그룹함수는 컬럼하나만 출력 할 수 없다.
    to_char(sum(sal)*1100, 'L999,999,999') as "월 급여 총액", 
    round(avg(sal))*1100 as "월 급여 평균",
    count(sal) as "전체 사원의 수",
    count(comm) as "커미션 수",
    max(sal) as "가장 큰 금액",
    min(sal) as "가장 적은 금액"
from emp
;

select
    sum(comm),
    avg(nvl(comm,0)),
    count(nvl(comm,0)),
    max(comm),
    min(comm)
from emp;


-- 전체 행을 구한다.
select 
    count(*)as "Manager의 수", 
    round(avg(sal)) as "매니저의 평균",
    max(sal),
    min(sal)
from emp
where job = 'MANAGER'
;


-- 직무의 개수
select count( distinct job)
from emp
order by job;

-- 특정 기준으로 그룹핑 : group by 컬럼
select deptno
from emp
group by deptno
;

select * from emp order by deptno;


-- 각 부서의 소속 인원을 구하자
select deptno, count(*) as "cnt"
from emp
group by deptno
-- order by count(*) desc
order by deptno
;

-- 각 부서별 총 급여액 출력
-- group by deptno : 부서별로 그룹핑
select deptno, sum(sal)
from emp
group by deptno
order by deptno
;


-- 부서별 급여 평균
select deptno, round(avg(sal))
from emp
group by deptno
order by deptno
;

-- 부서별 급여 최고 금액과 최소 금액을 출력
select deptno, max(sal)as "최대급여", min(sal)as "최소급여", max(sal)-min(sal) as "편차"
from emp
group by deptno
order by deptno
;


-- 부서별로 그룹지은 후(GROUP BY),
-- 그룹 지어진 부서별 평균 급여
-- 평균 급여가 2000 이상인 (HAVING)
-- 부서번호와 부서별 평균

select deptno, avg(sal)
from emp
group by deptno
-- having not (avg(sal)>=2000)
having avg(sal)>=2000
order by deptno
;

-- 부서별 최대값과 최소값을 구하되
-- 최대급여가 2900이상인 부서만 출력합니다.
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal)>=2900
order by deptno
;


-- 직무별 지표 : 사원의 수, 급여의 총합, 평균 급여, 최대 급여, 최소 급여
select job, 
    count(*) || '명' as "직원수",
    to_char(sum(sal)*1100,'L999,999,999') as "급여의 합",
    to_char(avg(sal)*1100,'L999,9999,999') as"급여 평균",
    to_char(max(sal)*1100,'L999,999,999') as"최대급여",
    to_char(min(sal)*1100,'L999,999,999') as"최소급여"
from emp
where job!='PRESIDENT' -- 그룹하기 위한 행을 선택하는 기준
group by job
order by job
;


select * from tab;
desc book;
select*from book;

desc customer;
select*from customer;

desc orders;
select*from orders
order by bookid;


--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
--(1) 도서번호가1인도서의이름
select bookid, bookname
from book
where bookid = 1
;
--(2) 가격이20,000원이상인도서의이름
select bookname, price
from book
where price >= 20000
;
--(3) 박지성의총구매액(박지성의고객번호는1번으로놓고작성)
select name 
from customer
;
--(4) 박지성이구매한도서의수(박지성의고객번호는1번으로놓고작성)




--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
--(1) 마당서점도서의총개수
--(2) 마당서점에도서를출고하는출판사의총개수
--(3) 모든고객의이름, 주소
--(4) 2014년7월4일~7월7일사이에주문받은도서의주문번호
--(5) 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호
--(6) 성이‘김’씨인고객의이름과주소
--(7) 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소







