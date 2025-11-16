--liquibase formatted sql

--changeset GZ:1
create table gztmptestliquibase2
(
   aa varchar2(40)
);

--changeset GZ:2
alter table gztmptestliquibase add bb varchar2(60);

-- changeset GZ:1a
create table gztmptestliquibase3
(
   aa varchar2(40)
);

--changeset GZ:1b 
--preconditions onFail:MARK_RAN onError:MARK_RAN
--precondition-sql-check expectedResult:1 select 1 from gztmptestliquibase3 where rownum <=1
create table gztmptestliquibase3
(
   aa varchar2(40)
);
--changeset GZ:1c 
--preconditions onFail:MARK_RAN 
--precondition-sql-check expectedResult:0 select 1 from all_tab_cols where owner='BBSALESSTD' and table_name='GZTMPTESTLIQUIBASE3' and column_name='AA'
alter table gztmptestliquibase add aa varchar2(60);

--changeset GZ:1d labels:odps1.0 context:UAT
--preconditions onError:MARK_RAN
--precondition-sql-check expectedResult:0 select 1 from all_tab_cols where owner='BBSALESSTD' and table_name='GZTMPTESTLIQUIBASE3' and column_name='BB'
alter table gztmptestliquibase add bb varchar2(60);

--changeset ODPS:v1 context:UAT labels:JIRA-BI-1234 context:PROD
--preconditions onError:CONTINUE 
--precondition-sql-check expectedResult:0 select 1 from all_tab_cols where owner='BBSALESSTD' and table_name='GZTMPTESTLIQUIBASE' and column_name='BB'
alter table gztmptestliquibase add bb varchar2(60);