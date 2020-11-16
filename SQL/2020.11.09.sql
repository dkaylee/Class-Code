--2020.11.09
-- select 기본

-- scott 계정으로 로그인
-- scott 계정이 소유한 테이블 객체를 확인 : Tab -> 사용자가 가지는 테이블의 정보를 저장하는 데이터 딕셔너리
select*from tab;

-- 테이블의 구조를 확인 : DESC
-- 테이블의 구조데이터를 검색하기전 구조를 확인 할 때
Desc emp;
desc dept;

-- select hiredate from emp;

-- 데이터의 조회 명령 : select
-- SELECT 컬럼명, ... FROM 테이블 이름(조회의 대상) --> 기본문법
-- SELECT 

SELECT
    *       -- 컬럼 이름들을 기술해준다. 기술하는 순서에 따라 결과도 순서에 맞게 출력
FROM emp    -- 조회하고자하는 테이블 이름을 기술
;           -- sql의 종료

-- 부서 테이블의 모든 데이터를 조회하자
SELECT *
FROM dept
;

-- 부서테이블에서 --> FROM
-- 부서의 이름과 위치를 출력 --> SELECT
select dname,loc
from dept
;

select loc, deptno, dname, dname
from dept
;


-- 모든 사원의 정보를 출력하자
select *
from emp
;

-- 사원의 이름, 사번, 직무를 포함하는 리스트 출력
select ename,empno, job
from emp
;

-- select절의 사칙연산가능
-- 임시테이블 dual : 컬럼은 엑셀을 가지고 있다.
select 100+200, 200-100, 100*1, 100/10
from dual;

select ename, sal, sal*12
from emp
;

select * from emp;
-- 연봉의 계산을 sal*12+comm을 계산하자
select ename, sal, sal*12, comm, sal*12+comm
from emp
;

-- null : 값은 존재하는데 정해지지 않은 값
-- 연산이 불가 : 사칙연산, 비교연산

-- nvl 함수 : null 값을 치환 해주는 함수
-- nvl (컬럼, 대체값) : 컬럼의 값이 null 일 때 대체값으로 치환, 이 때 대체값은 컬럼의 타입에 맞는 데이터 이어야 한다.

select ename, sal, sal*12 sal12, nvl(comm,0)as comm, sal*12+ nvl(comm,0) alsal
from emp
;

-- 데이터베이스의 sql 내부의 문자열 처리는 작은 따옴표로 '' / 별칭은 "" -> 한글로 잘 사용하진 않음
select ename, sal, sal*12 sal12, nvl(comm,0)as comm, sal*12+ nvl(comm,0) as "12개월 연봉"
from emp
;

-- 문자열의 조합
select ename || ' is a ' || job || ' 입니다.'
from emp;

-- Distinct 데이터의 중복값을 제거 하고 출력
select deptno
from emp;

select distinct deptno
from emp;

-- 특정 데이터를 추출하는 where 절
-- select 컬럼명... from 테이블 이름 where 조건식

-- 급여가 3000이상인 사원의 리스트를 출력하자

select ename, job, sal0
from emp
where sal>=3000
;

select ename
from emp
where sal > 4000
;

-- 10번 부서에 소속된 사원들의 리스트를 출력
select ename
from emp 
where deptno = 10
;


-- 사원이름이 FORD인 사원의 정보를 출력
select *
from emp
where ename ='FORD'
;



-- 81/11/17에 입사한 사원의 정보를 출력
select *
from emp
where hiredate='81/11/17'   -- 날짜 비교에서도 날짜도 작은 따옴표로 묶어서 사용
;

-- 10번부서 소속인 사원 : DEPTNO = 10
-- 직급이 MANAGER인 사원 : JOB = 'MANAGER'
select ename, deptno, job
from emp
where deptno = 10 AND job = 'MANAGER'
;


-- 10번 부서 소속인 사원 : DEPTNO=10
-- 직급이 MANAGER인 사원 : JOB='MANAGER'
select ename, deptno, job
from emp
where deptno=10 or job='MANAGER'
;


-- 10번이 아닌 사원의 이름, 부서번호, 직급을 출력
select *
from emp
-- where deptno != 10
-- where deptno <> 10
where NOT deptno = 10
;

-- 2000에서 3000사이의 급여를 받는 사원을 조회하기
select ename, sal
from emp
-- where sal >= 2000 and sal <= 3000
where sal between 2000 and 3000  -- a 이상 b 이하의 범위
;

-- 1987년에 입사한 사원을 출력해 봅시다.
-- 1987/01/01 ~ 1987/12/31
select *
from emp
-- where hiredate between '1987/01/01' and '1987/12/31'
where hiredate >= '87/01/01' and hiredate <= '87/12/31'
;

-- 이번에는 커미션이 300 이거나 500이거나 1400인 사원을 검색
select *
from emp
-- where comm=300 or comm=500 or comm=1400 or comm=3000
where comm in(300,500,1400,100,3000)
;

--찾으려는 이름이 f로 시작하는 것은 알지만 그 뒤의 문자는 모를 경우
select *
from emp
-- where ename like 'F%'-> f로 시작하고 뒤는 어떤 문자가 와도 상관 없음
-- where ename like '%S' -> 이름이 s로 끝난는 이름을 검색
-- where ename like '%AD%' -- 이름에 ad문자를 포함하는
-- where ename like '_A%' -- 첫번째 문자는 어떤 문자든 상관 없고 두 번째 문자는 반드시 A문자를 포함하는
-- where ename like '__R%' --  첫번째, 두번째 문자에는 어떤 문자이든 상관 없고, 세번째에는 R문자를 포함하는 이름을 검색
where ename NOT like '%A%'
;

-- 커미션을 받지 않는 사원을 검색
select *
from emp
-- where comm == 0
-- where comm is null or comm=0
;

-- 커미션을 받는 사원을 검색
select*
from emp
where comm is not null and comm>0
;

-- 사원의 리스트를
-- 급여의 오름차순으로 정령해보자
select*
from emp
-- order by sal asc  - 오름차순
-- order by sal desc - 내림차순
-- order by sal -- 생략 -> asc오름차순
-- order by ename desc
-- order by comm desc
-- order by hiredate  -- 날짜의 작다 표현은 오래된 날짜 : 오름 차순은 오래된 날짜부터 출력
order by hiredate desc, sal asc -- 같은 정렬의 조건
;


-- select 문제
-- 테이블에서 원하는 행의 컬럼의 값을 추출하는 것
-- select {컬럼명,...} from 테이블 이름 where 조건 -> 원하는 행, 열을 표현 -> 결과 : 테이블 

-- 1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename, sal, sal+300 as addsal
from emp
;

-- 2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오, 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ename, sal, sal*12+100 as income
from emp
order by income desc
;

-- 3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
select ename, sal
from emp
where sal > 2000
order by sal desc
;

-- 4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ename, deptno
from emp
where empno=7788
;

-- 5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오. -> 범위 between 또는 논리연산 
select ename, sal
from emp
where sal not between 2000 and 3000
;

select ename, sal
from emp
where not (sal>=2000 and sal<=3000)
;

-- 6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
select ename, job, hiredate
from emp
where hiredate between '81/02/20' and '81/05/01'
;

-- 7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.

select ename, deptno
from emp
where deptno between 20 and 30
order by ename desc
;

select ename, deptno
from emp
--where deptno=20 or deptno=30
where deptno in (20,30)
order by ename desc;

-- 8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.

select ename, sal, deptno
from emp
where sal between 2000 and 3000 and deptno between 20 and 30
ORDER BY ename asc
;

-- 9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)

select ename, hiredate
from emp
where hiredate like '81%'
;

-- 10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
-- null : 있는것도 아니고 없는것도 아닌 데이터 연산의 결과도 null, 비교연산, 산술연산 불가
-- is null / is not null
select ename, mgr, job
from emp
where mgr is null
;

-- 11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.

select ename, sal, comm
from emp
where comm is not null and comm>0
order by sal desc, comm desc
;

-- 12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
-- 00R0000000 -> like '__R%'
select ename
from emp
where ename like '__R%'
;

-- 13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select *
from emp
where ename like '%A%' and ename like '%E%'
;

-- 14. 담당업무가 CLERK, 또는 SALESMAN이면서  -- (or) and 
-- 급여가 $1600, $950 또는 $1300이 아닌 사원의 -- not (or)
-- 이름, 담당업무, 급여를 출력하시오.
select ename, job, sal
from emp
-- where job ='CLERK''SALESMAN' or sal in(950,1300,1600)
where ( job in ('CLERK', 'SALESMAN')) and (sal not in(1600, 950, 1300))
;

-- 15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
select ename, sal, comm
from emp
where comm>=500
;

