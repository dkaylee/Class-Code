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
select custid, sum(saleprice)
from orders
where custid ='1'
group by custid
;
--(4) 박지성이구매한도서의수(박지성의고객번호는1번으로놓고작성)
select custid, count(custid) as "구매한 도서의 수"
from orders
where custid ='1'
group by custid
;

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
--(1) 마당서점도서의총개수
select count(bookid) as "총 도서 수"
from book
;
--(2) 마당서점에도서를출고하는출판사의총개수
select count(distinct publisher) as "총 출판사 수" 
from book
;
--(3) 모든고객의이름, 주소
select name, address
from customer
;
--(4) 2014년7월4일~7월7일사이에주문받은도서의주문번호
select orderid, orderdate
from orders
where orderdate >= '14/07/04' and orderdate <= '14/07/07' 
;
--(5) 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호
select orderid, orderdate
from orders
where not orderdate >= '14/07/04' and orderdate <= '14/07/07' 
;
--(6) 성이‘김’씨인고객의이름과주소
select *
from customer
where name like '김%'
;
--(7) 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소
select *
from customer
where name like '%김_아%'
;


select*
from emp;

-- 16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select ename, substr(hiredate,1,5)
from emp
;

-- 17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
--select ename, hiredate
--from emp
--where substr(hiredate,1,5) = '4'
--;

-- 18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select ename , empno
    from emp
where mod(empno,2) = 0
;

-- 19. 입사일을 년도는 2자리(YY), 월은 숫자(MM)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select to_char(hiredate,'YY/MM/DY') as 입사일
from emp
;

-- 20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고
-- TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
select trunc(sysdate - to_date('20-01-01','YY-MM-DD'))
from dual
;

-- 21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select nvl(mgr,0)
from emp;

-- 22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오.
--직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180,
--‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.​
select ename, sal,
    decode(job,
    'ANALIST',sal+200,
    'SALESMAN',sal+180,
    'MANAGER',sal+150,
    'CLERK', sal+100) AS upsal
    from emp
    order by sal;
    

-- 23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오.
-- 평균에 대해서는 정수로 반올림하시오.
select 
    max(sal)as"최고액",
    min(sal)as"최저액",
    sum(sal)as"총액",
    round(avg(sal))as"평균"
    from emp
    ;

-- 24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오.
-- 평균에 대해서는 정수로 반올림 하시오.
select job,
    max(sal)as"최고액",
    min(sal)as"최저액",
    sum(sal)as"총액",
    round(avg(sal))as"평균"
    from emp
    group by job
    ;

-- 25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.​
select job, count(job) as "담당자 수"
    from emp
    group by job
    ;


-- 26. 관리자 수를 출력하시오.
select mgr,count(mgr)
from emp
where mgr!=0
group by mgr
;


-- 27. 급여 최고액, 급여 최저액의 차액을 출력하시오.​
select
    max(sal)as"최고액",
    min(sal)as"최저액",
    max(sal)-min(sal)as"급여 차"
    from emp
    ;


-- 28. 직급별 사원의 최저 급여를 출력하시오.
-- 관리자를 알 수 없는 사원과 최저 급여가 2000 미만인 그룹은 제외시키고
-- 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job,
min(sal)as"최저액"
from emp
where not sal < 2000
group by job
;

-- 29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오.
-- 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno,
count(*)as "부서별 사원 수",
round(AVG(sal),2)as "부서별 평균 급여"
from emp
group by deptno
order by deptno
;

-- 30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오.
-- 평균 급여는 정수로 반올림 하시오. DECODE 사용.​
select deptno,
    decode(deptno,
        10, 'ACCOUNTING', 
        20, 'RESEARCH',
        30, 'SALES',
        40, 'OPERATION'
    ) AS DNAME,
   decode( deptno,
        10, 'NEW YORK',
        20, 'DALLAS',
        30, 'CHICAGO',
        40, 'BOSTON'
    ) AS LOC,
COUNT(*) as "사원수", 
round(avg(sal||)) as "평균급여"
from emp
group by deptno
order by deptno
;

select *
from dept;
-- 10	ACCOUNTING	NEW YORK
-- 20	RESEARCH	DALLAS
-- 30	SALES	CHICAGO
-- 40	OPERATIONS	BOSTON

-- 31. 업무를 표시한 다음 해당 업무에 대해 부서 번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오.
-- 별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오.

select deptno,
    COUNT(*) as "사원수", 
    sum(sal) as "평균급여",
    decode(deptno,
        10, 'ACCOUNTING', 
        20, 'RESEARCH',
        30, 'SALES',
        40, 'OPERATION'
    ) AS DNAME
from emp
group by deptno
order by deptno
;


