alter session set "_ORACLE_SCRIPT"=true;

create user education identified by 1234;

grant connect, resource, unlimited tablespace to education;