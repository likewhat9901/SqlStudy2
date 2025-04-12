/*
1. SYSTEM 계정으로 접속
2. 코드 실행
*/
alter session set "_ORACLE_SCRIPT" = true;

create user scott identified by TIGER;

grant connect, resource, unlimited tablespace to scott;
/*
3. C:\01DevelopKits\Oracle21c\dbhomeXE\rdbms\admin -> scott.sql 수정
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
 -> GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT;
4. scott 계정 생성
※ 테이블이 안보이면 필터링 되었을 가능성이 있음.
 */