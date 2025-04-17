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

delete from banking;


--삭제 프로시저
create or replace procedure DeleteAccount
    (
        p_id in varchar2,
        p_result out varchar2
    )
is
    v_count number;
begin
    v_count := SQL%rowcount;
    
    if v_count = 0 then
        p_result := '해당아이디는 존재하지 않습니다.';
    else
        delete from banking
        where acc_id = p_id;
        
        p_result := '삭제가 완료되었습니다.';
    end if;
EXCEPTION
    when others then
        p_result := '오류 발생: ' || SQLERRM;
end;
/

commit;
    
    
    
    
    
    
    
    
    
    
    