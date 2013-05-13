                                                                                
  CREATE OR REPLACE FUNCTION "SEARCHAPP"."BIO_CLINICAL_TRIAL_UID" (             
  TRIAL_NUMBER VARCHAR2,                                                        
  TITLE VARCHAR2,                                                               
  CONDITION VARCHAR2                                                            
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  RETURN nvl(TRIAL_NUMBER || '|', '') || nvl(TITLE || '|', '') || nvl(CONDITION,
 '');                                                                           
END BIO_CLINICAL_TRIAL_UID;                                                     
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "SEARCHAPP"."BIO_COMPOUND_UID"                     
( CAS_REGISTRY IN VARCHAR2,                                                     
  JNJ_NUMBER IN VARCHAR2,                                                       
  CNTO_NUMBER IN VARCHAR2                                                       
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  RETURN nvl(CAS_REGISTRY || '|', '') || nvl(JNJ_NUMBER || '|', '') || nvl(CNTO_
NUMBER, '');                                                                    
END BIO_COMPOUND_UID;                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE INDEX "SEARCHAPP"."IDX_SKT_KEYWORD_ID" ON "SEARCHAPP"."SEARCH_KEYWORD_T
ERM" ("SEARCH_KEYWORD_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."U_CHILD_ID_PARENT_ID" ON "SEARCHAPP"."SEARCH_
TAXONOMY_RELS" ("CHILD_ID", "PARENT_ID")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SYS_C0056419" ON "SEARCHAPP"."SEARCH_TAXONOMY
_RELS" ("SEARCH_TAXONOMY_RELS_ID")                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SYS_C0021181" ON "SEARCHAPP"."SEARCH_ROLE" ("
ID")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SYS_C0021173" ON "SEARCHAPP"."SEARCH_AUTH_USE
R" ("ID")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_TAXONOMY_PK" ON "SEARCHAPP"."SEARCH_TA
XONOMY" ("TERM_ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_SEC_OBJ__PATH_PK" ON "SEARCHAPP"."SEAR
CH_SECURE_OBJECT_PATH" ("SEARCH_SECURE_OBJ_PATH_ID")                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_SEC_OBJ_PK" ON "SEARCHAPP"."SEARCH_SEC
URE_OBJECT" ("SEARCH_SECURE_OBJECT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_SEC_A_U_S_A_PK" ON "SEARCHAPP"."SEARCH
_AUTH_USER_SEC_ACCESS" ("SEARCH_AUTH_USER_SEC_ACCESS_ID")                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_SEC_AC_LEVEL_PK" ON "SEARCHAPP"."SEARC
H_SEC_ACCESS_LEVEL" ("SEARCH_SEC_ACCESS_LEVEL_ID")                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_KW_TERM_PK" ON "SEARCHAPP"."SEARCH_KEY
WORD_TERM" ("SEARCH_KEYWORD_TERM_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_KW_PK" ON "SEARCHAPP"."SEARCH_KEYWORD"
 ("SEARCH_KEYWORD_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_KEYWORD_UK" ON "SEARCHAPP"."SEARCH_KEY
WORD" ("UNIQUE_ID", "DATA_CATEGORY")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_GENE_SIG_FILE_SCHE_PK" ON "SEARCHAPP".
"SEARCH_GENE_SIG_FILE_SCHEMA" ("SEARCH_GENE_SIG_FILE_SCHEMA_ID")                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_GENE_SIG_DESCR_PK" ON "SEARCHAPP"."SEA
RCH_GENE_SIGNATURE" ("SEARCH_GENE_SIGNATURE_ID")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_GENE_SIGNATURE_ITE_PK" ON "SEARCHAPP".
"SEARCH_GENE_SIGNATURE_ITEM" ("ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_CUST_FIL_ITEM_PK" ON "SEARCHAPP"."SEAR
CH_CUSTOM_FILTER_ITEM" ("SEARCH_CUSTOM_FILTER_ITEM_ID")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SEARCH_CUSTOM_FILTER_PK" ON "SEARCHAPP"."SEAR
CH_CUSTOM_FILTER" ("SEARCH_CUSTOM_FILTER_ID")                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."SCH_SEC_A_A_S_A_PK" ON "SEARCHAPP"."SEARCH_AU
TH_SEC_OBJECT_ACCESS" ("AUTH_SEC_OBJ_ACCESS_ID")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "SEARCHAPP"."SCH_KWD_DT_CAT_IDX" ON "SEARCHAPP"."SEARCH_KEYWORD" 
("DATA_CATEGORY")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."RDT_SEARCH_USER_FDBK_PK" ON "SEARCHAPP"."SEAR
CH_USER_FEEDBACK" ("SEARCH_USER_FEEDBACK_ID")                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."PLUGIN_PK" ON "SEARCHAPP"."PLUGIN" ("PLUGIN_S
EQ")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."PLUGIN_MODULE_PK" ON "SEARCHAPP"."PLUGIN_MODU
LE" ("MODULE_SEQ")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."PK_SEARCH_PRINCIPAL" ON "SEARCHAPP"."SEARCH_A
UTH_PRINCIPAL" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "SEARCHAPP"."PK_AUTH_USR_GROUP" ON "SEARCHAPP"."SEARCH_AUT
H_GROUP" ("ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "SEARCHAPP"."IDX_SK_KEYWORD" ON "SEARCHAPP"."SEARCH_KEYWORD" ("KE
YWORD")                                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE BITMAP INDEX "SEARCHAPP"."IDX_SK_DISPLAY_CATEGORY1" ON "SEARCHAPP"."SEA
RCH_KEYWORD" ("DATA_CATEGORY", "DISPLAY_DATA_CATEGORY")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "SEARCHAPP"."IDX_SK_DATA_ID" ON "SEARCHAPP"."SEARCH_KEYWORD" ("BI
O_DATA_ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "SEARCHAPP"."IDX_SKT_TERM" ON "SEARCHAPP"."SEARCH_KEYWORD_TERM" (
"KEYWORD_TERM")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "SEARCHAPP"."UTIL_GRANT_ALL"                      
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "SEARCHAPP"."HIBERNATE_SEQUENCE"  MINVALUE 1 MAXVALUE 999999
999999999999999999999 INCREMENT BY 1 START WITH 104795 CACHE 20 NOORDER  NOCYCLE
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "SEARCHAPP"."SEQ_SEARCH_TAXONOMY_TERM_ID"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 2000 START WITH 40001 CACHE 20 NOOR
DER  NOCYCLE                                                                    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "SEARCHAPP"."SEQ_SEARCH_TAXONOMY_RELS_ID"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  N
OCYCLE                                                                          
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "SEARCHAPP"."SEQ_SEARCH_DATA_ID"  MINVALUE 1 MAXVALUE 999999
999999999999999999999 INCREMENT BY 1 START WITH 103734095 CACHE 20 NOORDER  NOCY
CLE                                                                             
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "SEARCHAPP"."PLUGIN_SEQ"  MINVALUE 1 MAXVALUE 99999999999999
99999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "SEARCHAPP"."PLUGIN_MODULE_SEQ"  MINVALUE 1 MAXVALUE 9999999
999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE     
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."MLOG$_SEARCH_GENE_SIGNATUR"                         
   (	"DELETED_FLAG" NUMBER(1,0),                                                
	"PUBLIC_FLAG" NUMBER(1,0),                                                     
	"M_ROW$$" VARCHAR2(255),                                                       
	"SEQUENCE$$" NUMBER,                                                           
	"SNAPTIME$$" DATE,                                                             
	"DMLTYPE$$" VARCHAR2(1),                                                       
	"OLD_NEW$$" VARCHAR2(1),                                                       
	"CHANGE_VECTOR$$" RAW(255)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 30 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_USER_FEEDBACK"                               
   (	"SEARCH_USER_FEEDBACK_ID" NUMBER(18,0),                                    
	"SEARCH_USER_ID" NUMBER(18,0),                                                 
	"CREATE_DATE" DATE,                                                            
	"FEEDBACK_TEXT" NVARCHAR2(2000),                                               
	"APP_VERSION" NVARCHAR2(100),                                                  
	 CONSTRAINT "RDT_SEARCH_USER_FDBK_PK" PRIMARY KEY ("SEARCH_USER_FEEDBACK_ID")  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_TAXONOMY_RELS"                               
   (	"SEARCH_TAXONOMY_RELS_ID" NUMBER(22,0),                                    
	"CHILD_ID" NUMBER(22,0) NOT NULL ENABLE,                                       
	"PARENT_ID" NUMBER(22,0),                                                      
	 PRIMARY KEY ("SEARCH_TAXONOMY_RELS_ID")                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "U_CHILD_ID_PARENT_ID" UNIQUE ("CHILD_ID", "PARENT_ID")            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "FK_SEARCH_TAX_RELS_PARENT" FOREIGN KEY ("PARENT_ID")              
	  REFERENCES "SEARCHAPP"."SEARCH_TAXONOMY" ("TERM_ID") ENABLE,                 
	 CONSTRAINT "FK_SEARCH_TAX_RELS_CHILD" FOREIGN KEY ("CHILD_ID")                
	  REFERENCES "SEARCHAPP"."SEARCH_TAXONOMY" ("TERM_ID") ENABLE                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_TAXONOMY"                                    
   (	"TERM_ID" NUMBER(22,0) NOT NULL ENABLE,                                    
	"TERM_NAME" VARCHAR2(900) NOT NULL ENABLE,                                     
	"SOURCE_CD" VARCHAR2(900),                                                     
	"IMPORT_DATE" TIMESTAMP (1) DEFAULT Sysdate,                                   
	"SEARCH_KEYWORD_ID" NUMBER(38,0),                                              
	 CONSTRAINT "SEARCH_TAXONOMY_PK" PRIMARY KEY ("TERM_ID")                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "FK_SEARCH_TAX_SEARCH_KEYWORD" FOREIGN KEY ("SEARCH_KEYWORD_ID")   
	  REFERENCES "SEARCHAPP"."SEARCH_KEYWORD" ("SEARCH_KEYWORD_ID") ENABLE         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_SEC_ACCESS_LEVEL"                            
   (	"SEARCH_SEC_ACCESS_LEVEL_ID" NUMBER(18,0),                                 
	"ACCESS_LEVEL_NAME" NVARCHAR2(200),                                            
	"ACCESS_LEVEL_VALUE" NUMBER(18,0),                                             
	 CONSTRAINT "SEARCH_SEC_AC_LEVEL_PK" PRIMARY KEY ("SEARCH_SEC_ACCESS_LEVEL_ID")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_SECURE_OBJECT_PATH"                          
   (	"SEARCH_SECURE_OBJECT_ID" NUMBER(18,0),                                    
	"I2B2_CONCEPT_PATH" NVARCHAR2(2000),                                           
	"SEARCH_SECURE_OBJ_PATH_ID" NUMBER(18,0) NOT NULL ENABLE,                      
	 CONSTRAINT "SEARCH_SEC_OBJ__PATH_PK" PRIMARY KEY ("SEARCH_SECURE_OBJ_PATH_ID")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_SECURE_OBJECT"                               
   (	"SEARCH_SECURE_OBJECT_ID" NUMBER(18,0),                                    
	"BIO_DATA_ID" NUMBER(18,0),                                                    
	"DISPLAY_NAME" NVARCHAR2(100),                                                 
	"DATA_TYPE" NVARCHAR2(200),                                                    
	"BIO_DATA_UNIQUE_ID" NVARCHAR2(200),                                           
	 CONSTRAINT "SEARCH_SEC_OBJ_PK" PRIMARY KEY ("SEARCH_SECURE_OBJECT_ID")        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_ROLE_AUTH_USER"                              
   (	"PEOPLE_ID" NUMBER(19,0),                                                  
	"AUTHORITIES_ID" NUMBER(19,0),                                                 
	 CONSTRAINT "FKFB14EF798F01F561" FOREIGN KEY ("PEOPLE_ID")                     
	  REFERENCES "SEARCHAPP"."SEARCH_ROLE" ("ID") ENABLE,                          
	 CONSTRAINT "FKFB14EF79287E0CAC" FOREIGN KEY ("AUTHORITIES_ID")                
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_USER" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_ROLE"                                        
   (	"ID" NUMBER(19,0),                                                         
	"VERSION" NUMBER(19,0),                                                        
	"AUTHORITY" VARCHAR2(255 CHAR),                                                
	"DESCRIPTION" VARCHAR2(255 CHAR),                                              
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_REQUEST_MAP"                                 
   (	"ID" NUMBER(19,0),                                                         
	"VERSION" NUMBER(19,0),                                                        
	"CONFIG_ATTRIBUTE" VARCHAR2(255 CHAR),                                         
	"URL" VARCHAR2(255 CHAR)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_KEYWORD_TERM1"                               
   (	"KEYWORD_TERM" VARCHAR2(200),                                              
	"SEARCH_KEYWORD_ID" NUMBER(18,0),                                              
	"RANK" NUMBER(18,0),                                                           
	"SEARCH_KEYWORD_TERM_ID" NUMBER(18,0),                                         
	"TERM_LENGTH" NUMBER(18,0),                                                    
	"OWNER_AUTH_USER_ID" NUMBER                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_KEYWORD_TERM"                                
   (	"KEYWORD_TERM" VARCHAR2(200),                                              
	"SEARCH_KEYWORD_ID" NUMBER(18,0),                                              
	"RANK" NUMBER(18,0),                                                           
	"SEARCH_KEYWORD_TERM_ID" NUMBER(18,0),                                         
	"TERM_LENGTH" NUMBER(18,0),                                                    
	"OWNER_AUTH_USER_ID" NUMBER,                                                   
	"DATA_CATEGORY" NVARCHAR2(200),                                                
	 CONSTRAINT "SEARCH_KW_TERM_PK" PRIMARY KEY ("SEARCH_KEYWORD_TERM_ID")         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "SEARCH_KW_FK" FOREIGN KEY ("SEARCH_KEYWORD_ID")                   
	  REFERENCES "SEARCHAPP"."SEARCH_KEYWORD" ("SEARCH_KEYWORD_ID") DISABLE        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS BASIC LOGGING           
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_KEYWORD1"                                    
   (	"KEYWORD" NVARCHAR2(200),                                                  
	"BIO_DATA_ID" NUMBER(18,0),                                                    
	"UNIQUE_ID" NVARCHAR2(500) NOT NULL ENABLE,                                    
	"SEARCH_KEYWORD_ID" NUMBER(18,0),                                              
	"DATA_CATEGORY" NVARCHAR2(200) NOT NULL ENABLE,                                
	"SOURCE_CODE" NVARCHAR2(100),                                                  
	"DISPLAY_DATA_CATEGORY" NVARCHAR2(200),                                        
	"OWNER_AUTH_USER_ID" NUMBER                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_KEYWORD"                                     
   (	"KEYWORD" NVARCHAR2(200),                                                  
	"BIO_DATA_ID" NUMBER(18,0),                                                    
	"UNIQUE_ID" NVARCHAR2(500) NOT NULL ENABLE,                                    
	"SEARCH_KEYWORD_ID" NUMBER(18,0),                                              
	"DATA_CATEGORY" NVARCHAR2(200) NOT NULL ENABLE,                                
	"SOURCE_CODE" NVARCHAR2(100),                                                  
	"DISPLAY_DATA_CATEGORY" NVARCHAR2(200),                                        
	"OWNER_AUTH_USER_ID" NUMBER,                                                   
	 CONSTRAINT "SEARCH_KEYWORD_UK" UNIQUE ("UNIQUE_ID", "DATA_CATEGORY") DISABLE, 
                                                                                
	 CONSTRAINT "SEARCH_KW_PK" PRIMARY KEY ("SEARCH_KEYWORD_ID")                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_GENE_SIG_FILE_SCHEMA"                        
   (	"SEARCH_GENE_SIG_FILE_SCHEMA_ID" NUMBER NOT NULL ENABLE,                   
	"NAME" VARCHAR2(100) NOT NULL ENABLE,                                          
	"DESCRIPTION" VARCHAR2(255),                                                   
	"NUMBER_COLUMNS" NUMBER DEFAULT 2 NOT NULL ENABLE,                             
	"SUPPORTED" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,                             
	 CONSTRAINT "SEARCH_GENE_SIG_FILE_SCHE_PK" PRIMARY KEY ("SEARCH_GENE_SIG_FILE_S
CHEMA_ID")                                                                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_GENE_SIGNATURE_ITEM"                         
   (	"SEARCH_GENE_SIGNATURE_ID" NUMBER NOT NULL ENABLE,                         
	"BIO_MARKER_ID" NUMBER,                                                        
	"FOLD_CHG_METRIC" NUMBER,                                                      
	"BIO_DATA_UNIQUE_ID" NVARCHAR2(200),                                           
	"ID" NUMBER NOT NULL ENABLE,                                                   
	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0),                                     
	 CONSTRAINT "SEARCH_GENE_SIGNATURE_ITE_PK" PRIMARY KEY ("ID")                  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_GENE_SIGNATURE"                              
   (	"SEARCH_GENE_SIGNATURE_ID" NUMBER NOT NULL ENABLE,                         
	"NAME" VARCHAR2(100) NOT NULL ENABLE,                                          
	"DESCRIPTION" VARCHAR2(1000),                                                  
	"UNIQUE_ID" VARCHAR2(50),                                                      
	"CREATE_DATE" TIMESTAMP (6) NOT NULL ENABLE,                                   
	"CREATED_BY_AUTH_USER_ID" NUMBER NOT NULL ENABLE,                              
	"LAST_MODIFIED_DATE" TIMESTAMP (6),                                            
	"MODIFIED_BY_AUTH_USER_ID" NUMBER,                                             
	"VERSION_NUMBER" VARCHAR2(50),                                                 
	"PUBLIC_FLAG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,                           
	"DELETED_FLAG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PARENT_GENE_SIGNATURE_ID" NUMBER,                                             
	"SOURCE_CONCEPT_ID" NUMBER,                                                    
	"SOURCE_OTHER" VARCHAR2(255),                                                  
	"OWNER_CONCEPT_ID" NUMBER,                                                     
	"STIMULUS_DESCRIPTION" VARCHAR2(1000),                                         
	"STIMULUS_DOSING" VARCHAR2(255),                                               
	"TREATMENT_DESCRIPTION" VARCHAR2(1000),                                        
	"TREATMENT_DOSING" VARCHAR2(255),                                              
	"TREATMENT_BIO_COMPOUND_ID" NUMBER,                                            
	"TREATMENT_PROTOCOL_NUMBER" VARCHAR2(50),                                      
	"PMID_LIST" VARCHAR2(255),                                                     
	"SPECIES_CONCEPT_ID" NUMBER NOT NULL ENABLE,                                   
	"SPECIES_MOUSE_SRC_CONCEPT_ID" NUMBER,                                         
	"SPECIES_MOUSE_DETAIL" VARCHAR2(255),                                          
	"TISSUE_TYPE_CONCEPT_ID" NUMBER,                                               
	"EXPERIMENT_TYPE_CONCEPT_ID" NUMBER,                                           
	"EXPERIMENT_TYPE_IN_VIVO_DESCR" VARCHAR2(255),                                 
	"EXPERIMENT_TYPE_ATCC_REF" VARCHAR2(255),                                      
	"ANALYTIC_CAT_CONCEPT_ID" NUMBER,                                              
	"ANALYTIC_CAT_OTHER" VARCHAR2(255),                                            
	"BIO_ASSAY_PLATFORM_ID" NUMBER NOT NULL ENABLE,                                
	"ANALYST_NAME" VARCHAR2(100),                                                  
	"NORM_METHOD_CONCEPT_ID" NUMBER,                                               
	"NORM_METHOD_OTHER" VARCHAR2(255),                                             
	"ANALYSIS_METHOD_CONCEPT_ID" NUMBER,                                           
	"ANALYSIS_METHOD_OTHER" VARCHAR2(255),                                         
	"MULTIPLE_TESTING_CORRECTION" NUMBER(1,0),                                     
	"P_VALUE_CUTOFF_CONCEPT_ID" NUMBER NOT NULL ENABLE,                            
	"UPLOAD_FILE" VARCHAR2(255) NOT NULL ENABLE,                                   
	"SEARCH_GENE_SIG_FILE_SCHEMA_ID" NUMBER DEFAULT 1 NOT NULL ENABLE,             
	"FOLD_CHG_METRIC_CONCEPT_ID" NUMBER DEFAULT NULL NOT NULL ENABLE,              
	"EXPERIMENT_TYPE_CELL_LINE_ID" NUMBER,                                         
	 CONSTRAINT "SEARCH_GENE_SIG_DESCR_PK" PRIMARY KEY ("SEARCH_GENE_SIGNATURE_ID")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "GENE_SIG_CREATE_AUTH_USER_FK1" FOREIGN KEY ("CREATED_BY_AUTH_USER_
ID")                                                                            
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_USER" ("ID") ENABLE,                     
	 CONSTRAINT "GENE_SIG_MOD_AUTH_USER_FK1" FOREIGN KEY ("MODIFIED_BY_AUTH_USER_ID
")                                                                              
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_USER" ("ID") ENABLE,                     
	 CONSTRAINT "GENE_SIG_PARENT_FK1" FOREIGN KEY ("PARENT_GENE_SIGNATURE_ID")     
	  REFERENCES "SEARCHAPP"."SEARCH_GENE_SIGNATURE" ("SEARCH_GENE_SIGNATURE_ID") E
NABLE,                                                                          
	 CONSTRAINT "GENE_SIG_FILE_SCHEMA_FK1" FOREIGN KEY ("SEARCH_GENE_SIG_FILE_SCHEM
A_ID")                                                                          
	  REFERENCES "SEARCHAPP"."SEARCH_GENE_SIG_FILE_SCHEMA" ("SEARCH_GENE_SIG_FILE_S
CHEMA_ID") ENABLE                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_CUSTOM_FILTER_ITEM"                          
   (	"SEARCH_CUSTOM_FILTER_ITEM_ID" NUMBER(18,0) NOT NULL ENABLE,               
	"SEARCH_CUSTOM_FILTER_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"UNIQUE_ID" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                
	"BIO_DATA_TYPE" VARCHAR2(100 CHAR) NOT NULL ENABLE,                            
	 CONSTRAINT "SEARCH_CUST_FIL_ITEM_PK" PRIMARY KEY ("SEARCH_CUSTOM_FILTER_ITEM_I
D")                                                                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_CUSTOM_FILTER"                               
   (	"SEARCH_CUSTOM_FILTER_ID" NUMBER(18,0) NOT NULL ENABLE,                    
	"SEARCH_USER_ID" NUMBER(18,0) NOT NULL ENABLE,                                 
	"NAME" NVARCHAR2(200) NOT NULL ENABLE,                                         
	"DESCRIPTION" NVARCHAR2(2000),                                                 
	"PRIVATE" CHAR(1) DEFAULT 'N' NOT NULL ENABLE,                                 
	 CONSTRAINT "SEARCH_CUSTOM_FILTER_PK" PRIMARY KEY ("SEARCH_CUSTOM_FILTER_ID")  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_BIO_MKR_CORREL_FAST_MV"                      
   (	"DOMAIN_OBJECT_ID" NUMBER NOT NULL ENABLE,                                 
	"ASSO_BIO_MARKER_ID" NUMBER,                                                   
	"CORREL_TYPE" CHAR(19),                                                        
	"VALUE_METRIC" NUMBER,                                                         
	"MV_ID" NUMBER                                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."PLUGIN"                                             
   (	"PLUGIN_SEQ" NUMBER NOT NULL ENABLE,                                       
	"NAME" VARCHAR2(200) NOT NULL ENABLE,                                          
	"PLUGIN_NAME" VARCHAR2(90) NOT NULL ENABLE,                                    
	"HAS_MODULES" CHAR(1) DEFAULT 'N' NOT NULL ENABLE,                             
	"HAS_FORM" CHAR(1) DEFAULT 'N' NOT NULL ENABLE,                                
	"DEFAULT_LINK" VARCHAR2(70) NOT NULL ENABLE,                                   
	"FORM_LINK" VARCHAR2(70),                                                      
	"FORM_PAGE" VARCHAR2(100),                                                     
	"ACTIVE" CHAR(1),                                                              
	 CONSTRAINT "PLUGIN_PK" PRIMARY KEY ("PLUGIN_SEQ")                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."PLUGIN_MODULE"                                      
   (	"MODULE_SEQ" NUMBER NOT NULL ENABLE,                                       
	"PLUGIN_SEQ" NUMBER NOT NULL ENABLE,                                           
	"NAME" VARCHAR2(70) NOT NULL ENABLE,                                           
	"PARAMS" CLOB NOT NULL ENABLE,                                                 
	"VERSION" VARCHAR2(10) DEFAULT 0.1 NOT NULL ENABLE,                            
	"ACTIVE" CHAR(1) DEFAULT 'Y' NOT NULL ENABLE,                                  
	"HAS_FORM" CHAR(1) DEFAULT 'N' NOT NULL ENABLE,                                
	"FORM_LINK" VARCHAR2(90),                                                      
	"FORM_PAGE" VARCHAR2(90),                                                      
	"MODULE_NAME" VARCHAR2(50) NOT NULL ENABLE,                                    
	"CATEGORY" VARCHAR2(50),                                                       
	 CONSTRAINT "PLUGIN_MODULE_PK" PRIMARY KEY ("MODULE_SEQ")                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "PLUGIN_MODULE_PLUGIN_FK1" FOREIGN KEY ("PLUGIN_SEQ")              
	  REFERENCES "SEARCHAPP"."PLUGIN" ("PLUGIN_SEQ") ENABLE                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("PARAMS") STORE AS BASICFILE (                                            
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_APP_ACCESS_LOG"                              
   (	"ID" NUMBER(19,0),                                                         
	"ACCESS_TIME" TIMESTAMP (6),                                                   
	"EVENT" VARCHAR2(255 CHAR),                                                    
	"REQUEST_URL" VARCHAR2(255 CHAR),                                              
	"USER_NAME" VARCHAR2(255 CHAR),                                                
	"EVENT_MESSAGE" CLOB                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("EVENT_MESSAGE") STORE AS BASICFILE "SYS_LOB0000140259C00006$$"(          
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_AUTH_GROUP"                                  
   (	"ID" NUMBER(19,0) NOT NULL ENABLE,                                         
	"GROUP_CATEGORY" VARCHAR2(255),                                                
	 CONSTRAINT "PK_AUTH_USR_GROUP" PRIMARY KEY ("ID")                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "SH_AUTH_GP_ID_FK" FOREIGN KEY ("ID")                              
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_PRINCIPAL" ("ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_AUTH_GROUP_MEMBER"                           
   (	"AUTH_USER_ID" NUMBER(19,0),                                               
	"AUTH_GROUP_ID" NUMBER(19,0),                                                  
	 CONSTRAINT "SCH_USER_GP_M_GRP_FK" FOREIGN KEY ("AUTH_GROUP_ID")               
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_GROUP" ("ID") ENABLE,                    
	 CONSTRAINT "SCH_USER_GP_M_USR_FK" FOREIGN KEY ("AUTH_USER_ID")                
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_PRINCIPAL" ("ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_AUTH_PRINCIPAL"                              
   (	"ID" NUMBER(19,0) NOT NULL ENABLE,                                         
	"PRINCIPAL_TYPE" VARCHAR2(255),                                                
	"DATE_CREATED" DATE NOT NULL ENABLE,                                           
	"DESCRIPTION" VARCHAR2(255),                                                   
	"LAST_UPDATED" DATE NOT NULL ENABLE,                                           
	"NAME" VARCHAR2(255),                                                          
	"UNIQUE_ID" VARCHAR2(255),                                                     
	"ENABLED" NUMBER(1,0),                                                         
	 CONSTRAINT "PK_SEARCH_PRINCIPAL" PRIMARY KEY ("ID")                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_AUTH_SEC_OBJECT_ACCESS"                      
   (	"AUTH_SEC_OBJ_ACCESS_ID" NUMBER(18,0),                                     
	"AUTH_PRINCIPAL_ID" NUMBER(18,0),                                              
	"SECURE_OBJECT_ID" NUMBER(18,0),                                               
	"SECURE_ACCESS_LEVEL_ID" NUMBER(18,0),                                         
	 CONSTRAINT "SCH_SEC_A_A_S_A_PK" PRIMARY KEY ("AUTH_SEC_OBJ_ACCESS_ID")        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "SCH_SEC_A_U_FK" FOREIGN KEY ("AUTH_PRINCIPAL_ID")                 
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_PRINCIPAL" ("ID") ENABLE,                
	 CONSTRAINT "SCH_SEC_S_O_FK" FOREIGN KEY ("SECURE_OBJECT_ID")                  
	  REFERENCES "SEARCHAPP"."SEARCH_SECURE_OBJECT" ("SEARCH_SECURE_OBJECT_ID") ENA
BLE,                                                                            
	 CONSTRAINT "SCH_SEC_S_A_L_FK" FOREIGN KEY ("SECURE_ACCESS_LEVEL_ID")          
	  REFERENCES "SEARCHAPP"."SEARCH_SEC_ACCESS_LEVEL" ("SEARCH_SEC_ACCESS_LEVEL_ID
") ENABLE                                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_AUTH_USER"                                   
   (	"ID" NUMBER(19,0),                                                         
	"EMAIL" VARCHAR2(255 CHAR),                                                    
	"EMAIL_SHOW" NUMBER(1,0),                                                      
	"PASSWD" VARCHAR2(255 CHAR),                                                   
	"USER_REAL_NAME" VARCHAR2(255 CHAR),                                           
	"USERNAME" VARCHAR2(255 CHAR),                                                 
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "SH_AUTH_USER_ID_FK" FOREIGN KEY ("ID")                            
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_PRINCIPAL" ("ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "SEARCHAPP"."SEARCH_AUTH_USER_SEC_ACCESS"                        
   (	"SEARCH_AUTH_USER_SEC_ACCESS_ID" NUMBER(18,0),                             
	"SEARCH_AUTH_USER_ID" NUMBER(18,0),                                            
	"SEARCH_SECURE_OBJECT_ID" NUMBER(18,0),                                        
	"SEARCH_SEC_ACCESS_LEVEL_ID" NUMBER(18,0),                                     
	 CONSTRAINT "SEARCH_SEC_A_U_S_A_PK" PRIMARY KEY ("SEARCH_AUTH_USER_SEC_ACCESS_I
D")                                                                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "SEARCH_SEC_A_U_FK" FOREIGN KEY ("SEARCH_AUTH_USER_ID")            
	  REFERENCES "SEARCHAPP"."SEARCH_AUTH_USER" ("ID") ENABLE,                     
	 CONSTRAINT "SEARCH_SEC_S_O_FK" FOREIGN KEY ("SEARCH_SECURE_OBJECT_ID")        
	  REFERENCES "SEARCHAPP"."SEARCH_SECURE_OBJECT" ("SEARCH_SECURE_OBJECT_ID") ENA
BLE,                                                                            
	 CONSTRAINT "SEARCH_SEC_S_A_L_FK" FOREIGN KEY ("SEARCH_SEC_ACCESS_LEVEL_ID")   
	  REFERENCES "SEARCHAPP"."SEARCH_SEC_ACCESS_LEVEL" ("SEARCH_SEC_ACCESS_LEVEL_ID
") ENABLE                                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TGR_SEARCH_TAXONOMY_RELS_ID"           
  before insert on searchapp.Search_Taxonomy_rels for each row                  
begin                                                                           
    If Inserting                                                                
      Then If :New.search_taxonomy_rels_Id Is Null                              
        Then Select Seq_Search_Taxonomy_rels_Id.Nextval Into :New.search_taxonom
y_rels_Id From Dual;                                                            
      End If;                                                                   
    end if;                                                                     
end;                                                                            
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TGR_SEARCH_TAXONOMY_RELS_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_SEC_OBJ_PATH_ID" before inse
rt on "SEARCH_SECURE_OBJECT_PATH"    for each row begin     if inserting then   
    if :NEW."SEARCH_SECURE_OBJ_PATH_ID" is null then          select SEQ_SEARCH_
DATA_ID.nextval into :NEW."SEARCH_SECURE_OBJ_PATH_ID" from dual;       end if;  
  end if; end;                                                                  
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_SEC_OBJ_PATH_ID" ENABLE                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_SEC_OBJ_ID" before insert on
 "SEARCH_SECURE_OBJECT"    for each row begin     if inserting then       if :NE
W."SEARCH_SECURE_OBJECT_ID" is null then          select SEQ_SEARCH_DATA_ID.next
val into :NEW."SEARCH_SECURE_OBJECT_ID" from dual;       end if;    end if; end;
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_SEC_OBJ_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_SEC_ACC_LEVEL_ID" before ins
ert on "SEARCH_SEC_ACCESS_LEVEL"    for each row begin     if inserting then    
   if :NEW."SEARCH_SEC_ACCESS_LEVEL_ID" is null then          select SEQ_SEARCH_
DATA_ID.nextval into :NEW."SEARCH_SEC_ACCESS_LEVEL_ID" from dual;       end if; 
   end if; end;                                                                 
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_SEC_ACC_LEVEL_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_KEYWORD_TERM_ID"            
before insert on "SEARCH_KEYWORD_TERM"                                          
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."SEARCH_KEYWORD_TERM_ID" is null then                            
          select SEQ_SEARCH_DATA_ID.nextval into :NEW."SEARCH_KEYWORD_TERM_ID" f
rom dual;                                                                       
       end if;                                                                  
    end if;                                                                     
end;                                                                            
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_KEYWORD_TERM_ID" ENABLE                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_KEYWORD_ID"                 
before insert on "SEARCH_KEYWORD"                                               
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."SEARCH_KEYWORD_ID" is null then                                 
          select SEQ_SEARCH_DATA_ID.nextval into :NEW."SEARCH_KEYWORD_ID" from d
ual;                                                                            
       end if;                                                                  
    end if;                                                                     
 end;                                                                           
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_KEYWORD_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_CUST_FIL_ITEM_ID"           
  before insert on "SEARCH_CUSTOM_FILTER_ITEM" for each row                     
begin                                                                           
    if inserting then if :NEW."SEARCH_CUSTOM_FILTER_ITEM_ID" is null then select
 SEQ_SEARCH_DATA_ID.nextval into :NEW."SEARCH_CUSTOM_FILTER_ITEM_ID" from dual; 
end if; end if;                                                                 
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_CUST_FIL_ITEM_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_CUSTOM_FILTER_ID"           
  before insert on "SEARCH_CUSTOM_FILTER" for each row                          
begin                                                                           
    if inserting then if :NEW."SEARCH_CUSTOM_FILTER_ID" is null then select SEQ_
SEARCH_DATA_ID.nextval into :NEW."SEARCH_CUSTOM_FILTER_ID" from dual; end if; en
d if;                                                                           
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_CUSTOM_FILTER_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_A_U_SEC_ACCESS_ID" before in
sert on "SEARCH_AUTH_USER_SEC_ACCESS"    for each row begin     if inserting the
n       if :NEW."SEARCH_AUTH_USER_SEC_ACCESS_ID" is null then          select SE
Q_SEARCH_DATA_ID.nextval into :NEW."SEARCH_AUTH_USER_SEC_ACCESS_ID" from dual;  
     end if;    end if; end;                                                    
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_A_U_SEC_ACCESS_ID" ENABLE                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_AU_PRCPL_ID"                
 before insert on SEARCH_AUTH_PRINCIPAL                                         
 for each row begin                                                             
 if inserting then                                                              
 if(:NEW.ID is null or :NEW.ID = -2000) then                                    
 select SEQ_SEARCH_DATA_ID.nextval into :NEW.ID from dual;                      
 end if;    end if; end;                                                        
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_AU_PRCPL_ID" ENABLE                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SEARCH_AU_OBJ_ACCESS_ID" before ins
ert on SEARCH_AUTH_SEC_OBJECT_ACCESS    for each row begin     if inserting then
       if :NEW.AUTH_SEC_OBJ_ACCESS_ID is null then          select SEQ_SEARCH_DA
TA_ID.nextval into :NEW.AUTH_SEC_OBJ_ACCESS_ID from dual;       end if;    end i
f; end;                                                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TRG_SEARCH_AU_OBJ_ACCESS_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TGR_SEARCH_TAXONOMY_TERM_ID"           
  before insert on "SEARCHAPP"."SEARCH_TAXONOMY" for each row                   
begin                                                                           
    If Inserting                                                                
      Then If :New.Term_Id Is Null                                              
        Then Select Seq_Search_Taxonomy_Term_Id.Nextval Into :New.Term_Id From D
ual;                                                                            
      End If;                                                                   
    end if;                                                                     
end;                                                                            
                                                                                
                                                                                
ALTER TRIGGER "SEARCHAPP"."TGR_SEARCH_TAXONOMY_TERM_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_AUTH_USER_SEC_ACCESS_V" ("SEA
RCH_AUTH_USER_SEC_ACCESS_ID", "SEARCH_AUTH_USER_ID", "SEARCH_SECURE_OBJECT_ID", 
"SEARCH_SEC_ACCESS_LEVEL_ID") AS                                                
  SELECT                                                                        
 sasoa.AUTH_SEC_OBJ_ACCESS_ID AS SEARCH_AUTH_USER_SEC_ACCESS_ID,                
 sasoa.AUTH_PRINCIPAL_ID AS SEARCH_AUTH_USER_ID,                                
 sasoa.SECURE_OBJECT_ID AS SEARCH_SECURE_OBJECT_ID,                             
 sasoa.SECURE_ACCESS_LEVEL_ID AS SEARCH_SEC_ACCESS_LEVEL_ID                     
FROM SEARCH_AUTH_USER sau,                                                      
SEARCH_AUTH_SEC_OBJECT_ACCESS sasoa                                             
WHERE                                                                           
sau.ID = sasoa.AUTH_PRINCIPAL_ID                                                
UNION                                                                           
 SELECT                                                                         
 sasoa.AUTH_SEC_OBJ_ACCESS_ID AS SEARCH_AUTH_USER_SEC_ACCESS_ID,                
 sagm.AUTH_USER_ID AS SEARCH_AUTH_USER_ID,                                      
 sasoa.SECURE_OBJECT_ID AS SEARCH_SECURE_OBJECT_ID,                             
 sasoa.SECURE_ACCESS_LEVEL_ID AS SEARCH_SEC_ACCESS_LEVEL_ID                     
FROM SEARCH_AUTH_GROUP sag,                                                     
SEARCH_AUTH_GROUP_MEMBER sagm,                                                  
SEARCH_AUTH_SEC_OBJECT_ACCESS sasoa                                             
WHERE                                                                           
sag.ID = sagm.AUTH_GROUP_ID                                                     
AND                                                                             
sag.ID = sasoa.AUTH_PRINCIPAL_ID                                                
UNION                                                                           
SELECT                                                                          
 sasoa.AUTH_SEC_OBJ_ACCESS_ID AS SEARCH_AUTH_USER_SEC_ACCESS_ID,                
 NULL AS SEARCH_AUTH_USER_ID,                                                   
 sasoa.SECURE_OBJECT_ID AS SEARCH_SECURE_OBJECT_ID,                             
 sasoa.SECURE_ACCESS_LEVEL_ID AS SEARCH_SEC_ACCESS_LEVEL_ID                     
FROM SEARCH_AUTH_GROUP sag,                                                     
SEARCH_AUTH_SEC_OBJECT_ACCESS sasoa                                             
WHERE                                                                           
sag.group_category = 'EVERYONE_GROUP'                                           
AND                                                                             
sag.ID = sasoa.AUTH_PRINCIPAL_ID                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "SEARCHAPP"."SEARCH_BIO_MKR_CORREL_VIEW" ("DOMAIN
_OBJECT_ID", "ASSO_BIO_MARKER_ID", "CORREL_TYPE", "VALUE_METRIC", "MV_ID") AS   
  SELECT   domain_object_id,                                                    
            asso_bio_marker_id,                                                 
            correl_type,                                                        
            value_metric,                                                       
            mv_id                                                               
     FROM   (SELECT   i.SEARCH_GENE_SIGNATURE_ID AS domain_object_id,           
                      i.BIO_MARKER_ID AS asso_bio_marker_id,                    
                      'GENE_SIGNATURE_ITEM' AS correl_type,                     
                      CASE                                                      
                         WHEN i.FOLD_CHG_METRIC IS NULL THEN 1                  
                         ELSE i.FOLD_CHG_METRIC                                 
                      END                                                       
                         AS value_metric,                                       
                      1 AS mv_id                                                
              FROM   SEARCH_GENE_SIGNATURE_ITEM i, SEARCH_GENE_SIGNATURE gs     
              WHERE   i.SEARCH_GENE_SIGNATURE_ID =                              
                         gs.SEARCH_GENE_SIGNATURE_ID                            
                      AND gs.DELETED_FLAG = 0                                   
                      AND i.bio_marker_id IS NOT NULL                           
             UNION ALL                                                          
             SELECT   i.SEARCH_GENE_SIGNATURE_ID AS domain_object_id,           
                      bada.BIO_MARKER_ID AS asso_bio_marker_id,                 
                      'GENE_SIGNATURE_ITEM' AS correl_type,                     
                      CASE                                                      
                         WHEN i.FOLD_CHG_METRIC IS NULL THEN 1                  
                         ELSE i.FOLD_CHG_METRIC                                 
                      END                                                       
                         AS value_metric,                                       
                      2 AS mv_id                                                
             FROM   SEARCH_GENE_SIGNATURE_ITEM i,                               
                      SEARCH_GENE_SIGNATURE gs,                                 
                      biomart.bio_assay_data_annotation bada                    
             WHERE   i.SEARCH_GENE_SIGNATURE_ID =                               
                         gs.SEARCH_GENE_SIGNATURE_ID                            
                      AND gs.DELETED_FLAG = 0                                   
                      AND bada.bio_assay_feature_group_id =                     
                            i.bio_assay_feature_group_id                        
                      AND i.bio_assay_feature_group_id IS NOT NULL)             
                                                                                
                                                                                
                                                                                
                                                                                
