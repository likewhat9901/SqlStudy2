alter session set "_ORACLE_SCRIPT"=true;

create user scott identified by TIGER;

grant connect, resource, unlimited tablespace to scott;