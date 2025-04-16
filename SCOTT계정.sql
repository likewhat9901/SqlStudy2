alter session set "_ORACLE_SCRIPT"=true;

create user banking identified by 1234;

grant connect, resource, unlimited tablespace to banking;