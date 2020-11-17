-- 2020.11.16

-- Phone Book DDL :  테이블 정의서를 참고 해서 DDL 작성한다.

create table phoneInfo_basic (
    idx number(6) constraint pi_basic_idx_PK primary key, --not null과 unique 속성을 가져감
    fr_name varchar2(20) not null,
    fr_phonenumber varchar2(20) not null,
    fr_email varchar2(20) ,
    fr_address varchar2(20),
    fr_regdate date default sysdate
)
;
desc phoneInfo_basic;

-- 제약 조건 확인 user_constraints
desc user_constraints;

select constraint_name, constraint_type
from user_constraints
where table_name='PHONEINFO_BASIC'
;

INSERT INTO PHONEINFO_BASIC 
VALUES (1, 'SCOTT', '010-0000-0000', 'SCOTT@GMAIL.COM', '서울', SYSDATE);

-- 데이터 질의 : READ
SELECT * FROM PHONEINFO_BASIC;

-- 시퀀스 : index auto 숫자 재생기 
CREATE SEQUENCE SEQ_PIBASIC_IDX
MINVALUE 0
START WITH 0
INCREMENT BY 1
;

-- INSERT
INSERT INTO PHONEINFO_BASIC 
VALUES (1, 'SCOTT', '010-0000-0000', 'SCOTT@GMAIL.COM', '서울', SYSDATE);
-- INSERT (SEQ)
INSERT INTO PHONEINFO_BASIC
VALUES (SEQ_PIBASIC_IDX.nextval, 'SCOTT', '010-0000-0000', 'SCOTT@GMAIL.COM', '서울', SYSDATE);
-- 기본정보
INSERT INTO PHONEINFO_BASIC (IDX, fr_name, fr_phonenumber)
VALUES (SEQ_PIBASIC_IDX.nextval, 'KING', '010-0000-0000');

-- 데이터 삭제 : DELETE
DELETE FROM phoneinfo_basic;

-- 데이터 업데이트 : UPDATE
UPDATE phoneinfo_basic
SET FR_EMAIL='KING@NAVER.COM', FR_ADDRESS='부산'
WHERE IDX=22
;

-- C(CREATE), R(READ), U(UPDATE), D(DELETE)
-- INSERT, SELECT, UPDATE, DELETE

-- PhoneInfo_univ
DROP TABLE PHONEINFO_BASIC;
DROP TABLE PHONEINFO_UNIV;
DROP TABLE PHONEINFO_COM;

create table PHONEINFO_UNIV (
    idx number(6),
    fr_u_major varchar2(20) default 'N',
    fr_u_year number(1) default 1 check (fr_u_year between 1 and 4),
    fr_ref number(6) NOT NULL,
    constraint pi_univ_idx_PK primary key (idx),
    constraint pi_univ_ref_FK foreign key(fr_ref) references phoneinfo_basic (idx)
);

desc phoneInfo_univ;
select * from user_constraints where table_name='PHONEINFO_UNIV';

-- CRUD
-- create : 대학친구 입력
INSERT INTO PHONEINFO_BASIC (IDX, fr_name, fr_phonenumber)
VALUES (SEQ_PIBASIC_IDX.nextval, 'KING', '010-0000-0000');
-- 대학정보
insert into phoneinfo_univ values (3, 'computer', 2, SEQ_PIBASIC_IDX.currval);


-- read
select * from phoneinfo_univ;

select *
from phoneinfo_basic pb, phoneinfo_univ pu
where pb.idx=pu.fr_ref
;

-- update : phoneinfo_univ  where idx=3;
update phoneinfo_univ
set fr_u_major='체육', fr_u_year =4
where idx=3;


-- delete : idx = 10 행을 삭제
delete phoneinfo_univ where fr_ref=10;
delete phoneinfo_basic where idx=10;


-- phoneinfo_com
CREATE table phoneinfo_com (
    idx number(6) constraint pi_com_idx_PK primary key,
    fr_c_company varchar2(20) default 'N',
    fr_ref number(6) not null constraint pi_com_ref_FK REFERENCES phoneinfo_basic (idx)
);

desc phoneinfo_com;

-- 회사 친구 정보 입력
INSERT INTO PHONEINFO_BASIC (IDX, fr_name, fr_phonenumber)
VALUES (SEQ_PIBASIC_IDX.nextval, '손흥민', '010-1111-0000');

-- 회사 정보 입력
insert into phoneinfo_com values(1,'토트넘',SEQ_PIBASIC_IDX.currval);

-- Read
-- 회사 친구
select *
from phoneinfo_basic pb, phoneinfo_com pc
where pb.idx=pc.fr_ref
and pb.fr_name='손흥민'
;

-- update
update phoneinfo_com
set fr_c_company='레알'
where idx=1;


-- delete
-- 자식 테이블의 행부터 삭제하고 부모 테이블 삭제해야 지워짐
delete from phoneinfo_com where fr_ref=6;
delete from phoneinfo_basic where idx=6;



select *
from phoneinfo_basic pb, phoneinfo_univ pu, phoneinfo_com pc
where pb.idx=pu.fr_ref(+) and pb.idx=pc.fr_ref(+)
;






















