                                                                                
  CREATE INDEX "TM_WZ"."WT_SUBJECT_MRNA_CALCS_I1" ON "TM_WZ"."WT_SUBJECT_MICROAR
RAY_CALCS" ("TRIAL_NAME", "PROBESET_ID")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_WZ"."WT_SUBJECT_MRNA_LOGS_I1" ON "TM_WZ"."WT_SUBJECT_MICROARR
AY_LOGS" ("TRIAL_NAME", "PROBESET_ID")                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "TM_WZ"."UTIL_GRANT_ALL"                          
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WRK_CLINICAL_DATA"                                      
   (	"STUDY_ID" VARCHAR2(25),                                                   
	"SITE_ID" VARCHAR2(50),                                                        
	"SUBJECT_ID" VARCHAR2(20),                                                     
	"VISIT_NAME" VARCHAR2(100),                                                    
	"DATA_LABEL" VARCHAR2(500),                                                    
	"DATA_VALUE" VARCHAR2(500),                                                    
	"CATEGORY_CD" VARCHAR2(250),                                                   
	"ETL_JOB_ID" NUMBER(22,0),                                                     
	"ETL_DATE" DATE,                                                               
	"USUBJID" VARCHAR2(200),                                                       
	"CATEGORY_PATH" VARCHAR2(1000),                                                
	"DATA_TYPE" VARCHAR2(10),                                                      
	"CTRL_VOCAB_CODE" VARCHAR2(200)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 458752 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WRK_MRNA_DATA"                                          
   (	"PROBESET" VARCHAR2(100),                                                  
	"EXPR_ID" VARCHAR2(100),                                                       
	"RAW_INTENSITY" VARCHAR2(50)                                                   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_CLINICAL_DATA_DUPS"                                  
   (	"SITE_ID" VARCHAR2(50),                                                    
	"SUBJECT_ID" VARCHAR2(20),                                                     
	"VISIT_NAME" VARCHAR2(100),                                                    
	"DATA_LABEL" VARCHAR2(500),                                                    
	"CATEGORY_CD" VARCHAR2(250)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_MRNA_DATA"                                           
   (	"PROBESET" VARCHAR2(100),                                                  
	"EXPR_ID" VARCHAR2(100),                                                       
	"INTENSITY_VALUE" VARCHAR2(50)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_MRNA_NODES"                                          
   (	"LEAF_NODE" VARCHAR2(2000),                                                
	"CATEGORY_CD" VARCHAR2(2000),                                                  
	"PLATFORM" VARCHAR2(2000),                                                     
	"TISSUE_TYPE" VARCHAR2(2000),                                                  
	"ATTRIBUTE_1" VARCHAR2(2000),                                                  
	"ATTRIBUTE_2" VARCHAR2(2000),                                                  
	"TITLE" VARCHAR2(2000),                                                        
	"NODE_NAME" VARCHAR2(2000),                                                    
	"CONCEPT_CD" VARCHAR2(100),                                                    
	"TRANSFORM_METHOD" VARCHAR2(2000),                                             
	"NODE_TYPE" VARCHAR2(50)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_MRNA_NODE_VALUES"                                    
   (	"CATEGORY_CD" VARCHAR2(2000),                                              
	"PLATFORM" VARCHAR2(2000),                                                     
	"TISSUE_TYPE" VARCHAR2(2000),                                                  
	"ATTRIBUTE_1" VARCHAR2(2000),                                                  
	"ATTRIBUTE_2" VARCHAR2(2000),                                                  
	"TITLE" VARCHAR2(2000),                                                        
	"TRANSFORM_METHOD" VARCHAR2(2000)                                              
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_MRNA_SUBJ_SAMPLE_MAP"                                
   (	"TRIAL_NAME" VARCHAR2(100),                                                
	"SITE_ID" VARCHAR2(100),                                                       
	"SUBJECT_ID" VARCHAR2(100),                                                    
	"SAMPLE_CD" VARCHAR2(100),                                                     
	"PLATFORM" VARCHAR2(100),                                                      
	"TISSUE_TYPE" VARCHAR2(100),                                                   
	"ATTRIBUTE_1" VARCHAR2(256),                                                   
	"ATTRIBUTE_2" VARCHAR2(200),                                                   
	"CATEGORY_CD" VARCHAR2(200)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_NUM_DATA_TYPES"                                      
   (	"CATEGORY_CD" VARCHAR2(200),                                               
	"DATA_LABEL" VARCHAR2(500),                                                    
	"SAMPLE_TYPE" VARCHAR2(100),                                                   
	"VISIT_NAME" VARCHAR2(100)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_SUBJECT_INFO"                                        
   (	"USUBJID" VARCHAR2(100),                                                   
	"AGE_IN_YEARS_NUM" NUMBER(3,0),                                                
	"SEX_CD" VARCHAR2(50),                                                         
	"RACE_CD" VARCHAR2(50)                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_SUBJECT_MICROARRAY_CALCS"                            
   (	"TRIAL_NAME" VARCHAR2(50),                                                 
	"PROBESET_ID" NUMBER(22,0),                                                    
	"MEAN_INTENSITY" NUMBER,                                                       
	"MEDIAN_INTENSITY" NUMBER,                                                     
	"STDDEV_INTENSITY" NUMBER                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_SUBJECT_MICROARRAY_LOGS"                             
   (	"PROBESET_ID" NUMBER(22,0),                                                
	"INTENSITY_VALUE" NUMBER,                                                      
	"PVALUE" FLOAT(126),                                                           
	"NUM_CALLS" NUMBER,                                                            
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(18,0),                                                     
	"SAMPLE_ID" NUMBER(18,0),                                                      
	"SUBJECT_ID" VARCHAR2(50),                                                     
	"TRIAL_NAME" VARCHAR2(50),                                                     
	"TIMEPOINT" VARCHAR2(100),                                                     
	"LOG_INTENSITY" NUMBER                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 226492416 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_SUBJECT_MICROARRAY_MED"                              
   (	"PROBESET_ID" NUMBER(22,0),                                                
	"INTENSITY_VALUE" NUMBER,                                                      
	"LOG_INTENSITY" NUMBER,                                                        
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(18,0),                                                     
	"SAMPLE_ID" NUMBER(18,0),                                                      
	"SUBJECT_ID" VARCHAR2(50),                                                     
	"TRIAL_NAME" VARCHAR2(50),                                                     
	"TIMEPOINT" VARCHAR2(100),                                                     
	"PVALUE" FLOAT(126),                                                           
	"NUM_CALLS" NUMBER,                                                            
	"MEAN_INTENSITY" NUMBER,                                                       
	"STDDEV_INTENSITY" NUMBER,                                                     
	"MEDIAN_INTENSITY" NUMBER,                                                     
	"ZSCORE" NUMBER                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 562036736 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_SUBJECT_MRNA_DATA"                                   
   (	"PROBESET" VARCHAR2(500),                                                  
	"EXPR_ID" VARCHAR2(500),                                                       
	"INTENSITY_VALUE" NUMBER,                                                      
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(22,0),                                                     
	"SAMPLE_ID" NUMBER(18,0),                                                      
	"SUBJECT_ID" VARCHAR2(100),                                                    
	"TRIAL_NAME" VARCHAR2(200),                                                    
	"TIMEPOINT" VARCHAR2(200),                                                     
	"SAMPLE_TYPE" VARCHAR2(200),                                                   
	"PLATFORM" VARCHAR2(200),                                                      
	"TISSUE_TYPE" VARCHAR2(200)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_SUBJECT_MRNA_PROBESET"                               
   (	"PROBESET_ID" NUMBER(38,0),                                                
	"EXPR_ID" VARCHAR2(500),                                                       
	"INTENSITY_VALUE" NUMBER,                                                      
	"NUM_CALLS" NUMBER,                                                            
	"PVALUE" NUMBER,                                                               
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(22,0),                                                     
	"SAMPLE_ID" NUMBER(18,0),                                                      
	"SUBJECT_ID" VARCHAR2(100),                                                    
	"TRIAL_NAME" VARCHAR2(200),                                                    
	"TIMEPOINT" VARCHAR2(200),                                                     
	"SAMPLE_TYPE" VARCHAR2(200),                                                   
	"PLATFORM" VARCHAR2(200),                                                      
	"TISSUE_TYPE" VARCHAR2(200)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 209715200 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_TRIAL_NODES"                                         
   (	"LEAF_NODE" VARCHAR2(4000),                                                
	"CATEGORY_CD" VARCHAR2(200),                                                   
	"VISIT_NAME" VARCHAR2(100),                                                    
	"SAMPLE_TYPE" VARCHAR2(100),                                                   
	"DATA_LABEL" VARCHAR2(500),                                                    
	"NODE_NAME" VARCHAR2(500),                                                     
	"DATA_VALUE" VARCHAR2(500),                                                    
	"DATA_TYPE" VARCHAR2(20)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_WZ"."WT_XTRIAL_NODES"                                        
   (	"XTRIAL_CD" VARCHAR2(200),                                                 
	"TRIAL_NAME" VARCHAR2(200),                                                    
	"LEAF_NAME" VARCHAR2(200),                                                     
	"DATA_TYPE" VARCHAR2(10),                                                      
	"CONCEPT_CD" VARCHAR2(200),                                                    
	"LEAF_NODE" VARCHAR2(2000)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
