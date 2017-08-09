declare
   table_exists pls_integer;
begin
   select count(*) into table_exists
   from "USER_TABLES"
   where table_name = 'SYSTEM_PARAMETER';

   if table_exists = 1 then
      execute immediate 'drop table "SYSTEM_PARAMETER" cascade constraints';
   end if;

end;

/

create table "SYSTEM_PARAMETER"
(
    primary key (id),
    id varchar2(255) not null,
    version number(19,0) not null,
    creator_id varchar2(50),
    created_date timestamp not null,
    modified_date timestamp not null,
    modifier_id varchar2(50) not null,
    code varchar2(255) not null,
    value varchar2(500) not null,
    description varchar2(500),
    category varchar2(100),
    is_encrypted number(1,0),
    can_cache number(1,0),
    volatile number(1,0)
)
/

