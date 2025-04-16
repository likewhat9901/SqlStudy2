create table banking
(
    serial_num varchar2(10) not null,
    acc_id  number primary key,
    name varchar2(100) not null,
    balance number not null,
    interest_rate number not null
);

create sequence seq_banking_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

commit;
    
select * from banking;
    
    
    
    
    
    
    
    
    
    
    
    
    
    