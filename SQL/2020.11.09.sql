--2020.11.09
-- select �⺻

-- scott �������� �α���
-- scott ������ ������ ���̺� ��ü�� Ȯ�� : Tab -> ����ڰ� ������ ���̺��� ������ �����ϴ� ������ ��ųʸ�
select*from tab;

-- ���̺��� ������ Ȯ�� : DESC
-- ���̺��� ���������͸� �˻��ϱ��� ������ Ȯ�� �� ��
Desc emp;
desc dept;

-- select hiredate from emp;

-- �������� ��ȸ ��� : select
-- SELECT �÷���, ... FROM ���̺� �̸�(��ȸ�� ���) --> �⺻����
-- SELECT 

SELECT
    *       -- �÷� �̸����� ������ش�. ����ϴ� ������ ���� ����� ������ �°� ���
FROM emp    -- ��ȸ�ϰ����ϴ� ���̺� �̸��� ���
;           -- sql�� ����

-- �μ� ���̺��� ��� �����͸� ��ȸ����
SELECT *
FROM dept
;

-- �μ����̺��� --> FROM
-- �μ��� �̸��� ��ġ�� ��� --> SELECT
select dname,loc
from dept
;

select loc, deptno, dname, dname
from dept
;


-- ��� ����� ������ �������
select *
from emp
;

-- ����� �̸�, ���, ������ �����ϴ� ����Ʈ ���
select ename,empno, job
from emp
;

-- select���� ��Ģ���갡��
-- �ӽ����̺� dual : �÷��� ������ ������ �ִ�.
select 100+200, 200-100, 100*1, 100/10
from dual;

select ename, sal, sal*12
from emp
;

select * from emp;
-- ������ ����� sal*12+comm�� �������
select ename, sal, sal*12, comm, sal*12+comm
from emp
;

-- null : ���� �����ϴµ� �������� ���� ��
-- ������ �Ұ� : ��Ģ����, �񱳿���

-- nvl �Լ� : null ���� ġȯ ���ִ� �Լ�
-- nvl (�÷�, ��ü��) : �÷��� ���� null �� �� ��ü������ ġȯ, �� �� ��ü���� �÷��� Ÿ�Կ� �´� ������ �̾�� �Ѵ�.

select ename, sal, sal*12 sal12, nvl(comm,0)as comm, sal*12+ nvl(comm,0) alsal
from emp
;

-- �����ͺ��̽��� sql ������ ���ڿ� ó���� ���� ����ǥ�� '' / ��Ī�� "" -> �ѱ۷� �� ������� ����
select ename, sal, sal*12 sal12, nvl(comm,0)as comm, sal*12+ nvl(comm,0) as "12���� ����"
from emp
;

-- ���ڿ��� ����
select ename || ' is a ' || job || ' �Դϴ�.'
from emp;

-- Distinct �������� �ߺ����� ���� �ϰ� ���
select deptno
from emp;

select distinct deptno
from emp;

-- Ư�� �����͸� �����ϴ� where ��
-- select �÷���... from ���̺� �̸� where ���ǽ�

-- �޿��� 3000�̻��� ����� ����Ʈ�� �������

select ename, job, sal0
from emp
where sal>=3000
;

select ename
from emp
where sal > 4000
;

-- 10�� �μ��� �Ҽӵ� ������� ����Ʈ�� ���
select ename
from emp 
where deptno = 10
;


-- ����̸��� FORD�� ����� ������ ���
select *
from emp
where ename ='FORD'
;



-- 81/11/17�� �Ի��� ����� ������ ���
select *
from emp
where hiredate='81/11/17'   -- ��¥ �񱳿����� ��¥�� ���� ����ǥ�� ��� ���
;

-- 10���μ� �Ҽ��� ��� : DEPTNO = 10
-- ������ MANAGER�� ��� : JOB = 'MANAGER'

select ename, deptno, job
from emp
where deptno = 10 AND job = 'MANAGER'
;









