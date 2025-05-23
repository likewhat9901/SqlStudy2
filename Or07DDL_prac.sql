/***
파일명 : Or07DDL.sql
DDL : Data Definition Language(데이터 정의어)
설명 : 테이블, 뷰와 같은 객체를 생성 및 변경하는 쿼리문을 말한다.
***/
--system 계정으로 접속한 후 아래 명령을 실행
--계정 생성 시 C##을 생략하고 만들 수 있도록 session을 변경
alter session set "_ORACLE_SCRIPT" = true;
--새로운 사용자 계정 생성
create user education identified by 1234;
--Role(역할)을 통해 접속 및 테이블 생성 등의 권한을 부여
grant connect, resource, unlimited tablespace to education;

------------------------------------------------------
--system계정에서 education 계정으로 접속한 후 학습을 진행합니다.

--생성된 모든 계정에 논리적으로 존재하는 테이블
select * from dual;
/* 현재 접속한 계정에 생성된 테이블의 목록을 저장한 시스템 테이블.
이와같이 관리의 목적으로 생성된 테이블을 '데이터사전'이라고 표현한다. */
select * from tab;

--테이블생성
/*
형식] creat table 테이블명 (
        컬럼명1 자료형(크기),
        컬럼명2 자료형(크기)
        ....
        primary key(컬럼명) 등의 제약조건 추가
    );
*/
create table tb_member (
    idx number(10,0) generated by default as identity (start with 100 increment by 10) primary key , /* 숫자형(정수) */
    userid varchar2(30 char) unique not null, /* 문자형 */
    passwd varchar2(50 char) not null,
    username varchar2(30 char) not null,
    mileage number(7,2) default 0 /* 숫자형(실수) */
);
select * from tab;
desc tb_member;
/*
🔹 GENERATED AS IDENTITY 옵션들
기본적으로 자동 증가 방식은 여러 옵션을 사용할 수 있어.

옵션	설명
GENERATED ALWAYS AS IDENTITY	사용자가 직접 값을 넣을 수 없음 (무조건 자동 증가)
GENERATED BY DEFAULT AS IDENTITY	사용자가 직접 값을 넣을 수도 있고, 자동 증가도 가능
INCREMENT BY N	값이 N씩 증가 (기본값 1)
START WITH N	시작값을 N으로 설정
MINVALUE N / MAXVALUE N	최소/최대값 설정
*/
alter table tb_member modify username varchar2(50 char);
desc tb_member;
alter table tb_member add email varchar2(100);
alter table tb_member drop column mileage;

create table employees (
    employee_id	number(6),
    first_name	varchar2(20),
    last_name	varchar2(25),
    email	varchar2(25),
    phone_number	varchar2(20),
    hire_date	date,
    job_id	varchar2(10),
    salary	number(8,2),
    commission_pct	number(2,2),
    manager_id	number(6),
    department_id	number(4)
);
desc employees;

drop table employees;

show recyclebin;

purge recyclebin;

insert into tb_member values(1, 'kosmo1', '1234', '코스모155기',
    'kosmo155@naver.com');
select * from tb_member;

insert into tb_member values(2, 'kosmo2', '1234', '코스모156기',
    'kosmo156@gmail.com');
insert into tb_member values(3, 'kosmo3', '1234', '코스모157기',
    'kosmo157@nate.net');

create table tb_member_copy1
as
select * from tb_member where 1=0;
select * from tb_member_copy1;

create table tb_member_copy2
as
select * from tb_member where 1=1;
--true의 조건으로 레코드까지 복사했으므로 인출된다.
select * from tb_member_copy2;