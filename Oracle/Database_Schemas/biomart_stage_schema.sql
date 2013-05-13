                                                                                
  CREATE OR REPLACE PROCEDURE "BIOMART_STAGE"."UTIL_GRANT_ALL"                  
(username	varchar2 := 'DATATRUST'                                               
,V_WHATTYPE IN VARCHAR2 DEFAULT 'PROCEDURES,FUNCTIONS,TABLES,VIEWS,PACKAGES,SEQU
ENCE')                                                                          
AUTHID CURRENT_USER                                                             
AS                                                                              
--------------------------------------------------------------------------------
-----                                                                           
-- NAME: UTIL_GRANT_ALL                                                         
--                                                                              
-- Copyright c 2011 Recombinant Data Corp.                                      
--                                                                              
                                                                                
--------------------------------------------------------------------------------
------                                                                          
                                                                                
    --GRANTS DATATRUST POSSIBLE PERMISSIONS                                     
    --ON OBJECTS OWNED BY THE CURRENT USER                                      
	                                                                               
	--	JEA@20110901	Added parameter to allow username other than DATATRUST, look fo
r EXTRNL as external table names                                                
	--	JEA@20120223	Added grant drop any table, grant analyze any to TABLES routine
                                                                                
	--	JEA@20120226	Added additional grants to TABLES routine                      
                                                                                
    v_user      varchar2(2000) := SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');     
                                                                                
  begin                                                                         
                                                                                
	IF UPPER(V_WHATTYPE) LIKE '%TABLE%' THEN                                       
    dbms_output.put_line('Owner ' || v_user  || '   Grantee ' || username);     
    dbms_output.put_line('Tables');                                             
                                                                                
     for L_TABLE in (select table_name from user_tables where table_name not lik
e '%EXTRNL%') LOOP                                                              
                                                                                
       if L_TABLE.table_name like '%EXTRNL%' then                               
          --grant select only to External tables                                
          execute immediate 'grant select on ' || L_TABLE.table_name || ' to ' |
| username;                                                                     
                                                                                
       else                                                                     
          --Grant full permissions on regular tables                            
          execute immediate 'grant select, insert, update, delete on ' || L_TABL
E.table_name || ' to ' || username;                                             
          --DBMS_OUTPUT.put_line('grant select, insert, update, delete on ' || L
_TABLE.table_name || ' to ' || username);                                       
       end if;                                                                  
                                                                                
     END LOOP; --TABLE LOOP                                                     
	                                                                               
	 execute immediate 'grant create any table to ' || username;                   
	 execute immediate 'grant drop any table to ' || username;                     
	 execute immediate 'grant alter any table to ' || username;                    
	 execute immediate 'grant create any index to ' || username;                   
	 execute immediate 'grant drop any index to ' || username;                     
	 execute immediate 'grant analyze any to ' || username;                        
	                                                                               
     end if;                                                                    
                                                                                
	IF UPPER(V_WHATTYPE) LIKE '%VIEW%' THEN                                        
    dbms_output.put_line('Owner ' || v_user  || '   Grantee ' || username);     
    dbms_output.put_line('Views');                                              
                                                                                
     for L_VIEW in (select view_name from user_views ) LOOP                     
          execute immediate 'grant select on ' || L_VIEW.view_name || ' to ' || 
username;                                                                       
                                                                                
     END LOOP; --TABLE LOOP                                                     
 end if;                                                                        
                                                                                
 IF UPPER(V_WHATTYPE) LIKE '%PROCEDURE%' or UPPER(V_WHATTYPE) LIKE '%FUNCTION%' 
or UPPER(V_WHATTYPE) LIKE '%PACKAGE%' THEN                                      
    dbms_output.put_line(chr(10) || 'Procedures, functions and packages');      
                                                                                
    for L_PROCEDURE in (select object_name from user_objects where object_type i
n ('PROCEDURE', 'FUNCTION', 'PACKAGE') )                                        
     LOOP                                                                       
                                                                                
       execute immediate 'grant execute on ' || L_PROCEDURE.object_name || ' to 
' || username;                                                                  
      -- DBMS_OUTPUT.put_line('grant execute on ' || L_PROCEDURE.object_name || 
' to ' || username);                                                            
                                                                                
     END LOOP; --PROCEDURE LOOP                                                 
  end if;                                                                       
                                                                                
 IF UPPER(V_WHATTYPE) LIKE '%SEQUENCE%'  THEN                                   
    dbms_output.put_line(chr(10) || 'Sequence');                                
                                                                                
    for L_PROCEDURE in (select object_name from user_objects where object_type =
 'SEQUENCE' )                                                                   
     LOOP                                                                       
                                                                                
       execute immediate 'grant select on ' || L_PROCEDURE.object_name || ' to '
 || username;                                                                   
      -- DBMS_OUTPUT.put_line('grant execute on ' || L_PROCEDURE.object_name || 
' to ' || username);                                                            
                                                                                
     END LOOP; --PROCEDURE LOOP                                                 
  end if;                                                                       
                                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_STAGE"."BIO_ASSAY_ANALYSIS_EQTL"                        
   (	"BIO_ASY_ANALYSIS_EQTL_ID" NUMBER(22,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(22,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"GENE" VARCHAR2(50),                                                           
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"CIS_TRANS" VARCHAR2(10),                                                      
	"DISTANCE_FROM_GENE" VARCHAR2(10),                                             
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_STAGE"."BIO_ASSAY_ANALYSIS_GWAS"                        
   (	"BIO_ASY_ANALYSIS_GWAS_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_STAGE"."TJEA_GWAS"                                      
   (	"BIO_ASY_ANALYSIS_GWAS_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
