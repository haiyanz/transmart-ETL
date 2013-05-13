                                                                                
  CREATE INDEX "TM_LZ"."DBSNP_135_TO_PERLEGEN_600K_1" ON "TM_LZ"."DBSNP_135_TO_P
ERLEGEN_600K" ("SUBSNP_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."LZ_SRC_MRNA_SUBJ_SAMP_IDX1" ON "TM_LZ"."LZ_SRC_MRNA_SUBJ
_SAMP_MAP" ("TRIAL_NAME", "SOURCE_CD")                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_VCF19_GENE" ON "TM_LZ"."VCF19_GENE" ("RS_ID")       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_VCF19" ON "TM_LZ"."VCF19" ("RS_ID")                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_VCF18_GENE" ON "TM_LZ"."VCF18_GENE" ("RS_ID")       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_VCF18" ON "TM_LZ"."VCF18" ("RS_ID")                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_SNPSUBSNPLINK_135_2" ON "TM_LZ"."SNPSUBSNPLINK_135" 
("SNP_ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_SNPSUBSNPLINK_135_1" ON "TM_LZ"."SNPSUBSNPLINK_135" 
("SUBSNP_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_SNPCHRPOSONREF_135" ON "TM_LZ"."SNPCHRPOSONREF_135" 
("SNP_ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_RSMERGEARCH_135_2" ON "TM_LZ"."RSMERGEARCH_135" ("NE
W_RSID")                                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_RSMERGEARCH_135_1" ON "TM_LZ"."RSMERGEARCH_135" ("OL
D_RSID")                                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_PFIZER_SNP1_SNP" ON "TM_LZ"."PFIZER_SNP1" ("SNP_ID")
                                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_PFIZER_SNP1_RSID" ON "TM_LZ"."PFIZER_SNP1" ("DBSNP_R
SID")                                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_MERGED_SNP2" ON "TM_LZ"."MERGED_SNP" ("NEW_RSID")   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_MERGED_SNP1" ON "TM_LZ"."MERGED_SNP" ("OLD_RSID")   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_CPERLEGEN_600K_2" ON "TM_LZ"."PERLEGEN_600K" ("DBSNP
_RSID")                                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_CPERLEGEN_600K_1" ON "TM_LZ"."PERLEGEN_600K" ("SNP_I
D")                                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."IDX_CARDS_GENOTYPE" ON "TM_LZ"."CARDS_GENOTYPE" ("SNP_ID
")                                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."DBSNP_135_TO_PERLEGEN_600K_4" ON "TM_LZ"."DBSNP_135_TO_P
ERLEGEN_600K" ("P_RSID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."DBSNP_135_TO_PERLEGEN_600K_3" ON "TM_LZ"."DBSNP_135_TO_P
ERLEGEN_600K" ("P_SNP_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "TM_LZ"."DBSNP_135_TO_PERLEGEN_600K_2" ON "TM_LZ"."DBSNP_135_TO_P
ERLEGEN_600K" ("SNP_ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "TM_LZ"."UTIL_GRANT_ALL"                          
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "TM_LZ"."SEQ_ETL_ID"  MINVALUE 1 MAXVALUE 999999999999999999
999999999 INCREMENT BY 1 START WITH 785 NOCACHE  NOORDER  NOCYCLE               
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."CARDS_ANP_INFO"                                         
   (	"SNP_ID" NUMBER(10,0),                                                     
	"DBSNP_RSID" NUMBER(10,0),                                                     
	"DBSNP_SSID" NUMBER(10,0),                                                     
	"SNP_INFO_ID" NUMBER(22,0),                                                    
	"NAME" VARCHAR2(255),                                                          
	"CHROM" VARCHAR2(16),                                                          
	"CHROM_POS" NUMBER                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."WT_SNP_NODE_VALUES"                                     
   (	"CATEGORY_CD" VARCHAR2(500),                                               
	"SAMPLE_TYPE" VARCHAR2(200),                                                   
	"TIMEPOINT" VARCHAR2(200),                                                     
	"TITLE" VARCHAR2(500)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."WT_SNP_NODES"                                           
   (	"LEAF_NODE" VARCHAR2(2000),                                                
	"CATEGORY_CD" VARCHAR2(500),                                                   
	"PLATFORM" VARCHAR2(500),                                                      
	"SAMPLE_TYPE" VARCHAR2(200),                                                   
	"TIMEPOINT" VARCHAR2(200),                                                     
	"NODE_TYPE" VARCHAR2(100)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."VCF19_GENE"                                             
   (	"CHR" VARCHAR2(10),                                                        
	"POS" NUMBER(10,0),                                                            
	"RS_ID" VARCHAR2(200),                                                         
	"GENE_SYMBOL" VARCHAR2(100),                                                   
	"GENE_ID" NUMBER(10,0)                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."VCF19"                                                  
   (	"CHROM" VARCHAR2(2),                                                       
	"POS" NUMBER(10,0),                                                            
	"RS_ID" VARCHAR2(200),                                                         
	"REF" VARCHAR2(4000),                                                          
	"ALT" VARCHAR2(4000),                                                          
	"VARIATION_CLASS" VARCHAR2(10),                                                
	"AF" VARCHAR2(1000),                                                           
	"GMAF" VARCHAR2(1000),                                                         
	"GENE_INFO" VARCHAR2(1000)                                                     
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "TRANSMART"                                                        
  PARTITION BY LIST ("CHROM")                                                   
 (PARTITION "PART_CHR1"  VALUES ('1')                                           
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR2"  VALUES ('2')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR3"  VALUES ('3')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR4"  VALUES ('4')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR5"  VALUES ('5')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR6"  VALUES ('6')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR7"  VALUES ('7')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR8"  VALUES ('8')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR9"  VALUES ('9')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR10"  VALUES ('10')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR11"  VALUES ('11')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR12"  VALUES ('12')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR13"  VALUES ('13')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR14"  VALUES ('14')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR15"  VALUES ('15')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR16"  VALUES ('16')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR17"  VALUES ('17')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR18"  VALUES ('18')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR19"  VALUES ('19')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR20"  VALUES ('20')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR21"  VALUES ('21')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR22"  VALUES ('22')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHRX"  VALUES ('X')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHRY"  VALUES ('Y')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHRM"  VALUES ('M')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_OTHER"  VALUES (default)                                       
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS )                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."VCF18_GENE"                                             
   (	"CHR" VARCHAR2(10),                                                        
	"POS" NUMBER(10,0),                                                            
	"RS_ID" VARCHAR2(200),                                                         
	"GENE_SYMBOL" VARCHAR2(100),                                                   
	"GENE_ID" NUMBER(10,0)                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."VCF18"                                                  
   (	"CHROM" VARCHAR2(2),                                                       
	"POS" NUMBER(10,0),                                                            
	"RS_ID" VARCHAR2(200),                                                         
	"REF" VARCHAR2(4000),                                                          
	"ALT" VARCHAR2(4000),                                                          
	"VARIATION_CLASS" VARCHAR2(10),                                                
	"AF" VARCHAR2(1000),                                                           
	"GMAF" VARCHAR2(1000),                                                         
	"GENE_INFO" VARCHAR2(1000)                                                     
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "TRANSMART"                                                        
  PARTITION BY LIST ("CHROM")                                                   
 (PARTITION "PART_CHR1"  VALUES ('1')                                           
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR2"  VALUES ('2')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR3"  VALUES ('3')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR4"  VALUES ('4')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR5"  VALUES ('5')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR6"  VALUES ('6')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR7"  VALUES ('7')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR8"  VALUES ('8')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR9"  VALUES ('9')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR10"  VALUES ('10')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR11"  VALUES ('11')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR12"  VALUES ('12')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR13"  VALUES ('13')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR14"  VALUES ('14')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR15"  VALUES ('15')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR16"  VALUES ('16')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR17"  VALUES ('17')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR18"  VALUES ('18')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR19"  VALUES ('19')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR20"  VALUES ('20')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR21"  VALUES ('21')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHR22"  VALUES ('22')                                          
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHRX"  VALUES ('X')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHRY"  VALUES ('Y')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_CHRM"  VALUES ('M')                                            
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS ,                                           
 PARTITION "PART_OTHER"  VALUES (default)                                       
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART" NOCOMPRESS )                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."CARDS_GENOTYPE"                                         
   (	"SNP_ID" NUMBER(10,0),                                                     
	"GENOTYPE" CLOB                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("GENOTYPE") STORE AS BASICFILE (                                          
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."CARDS_MAP"                                              
   (	"CHROM" VARCHAR2(16),                                                      
	"NAME" VARCHAR2(255),                                                          
	"CHROM_POS" NUMBER,                                                            
	"SNP_ID" NUMBER(10,0)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."CARDS_SNP"                                              
   (	"SNP_ID" NUMBER(10,0)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."DBSNP_135_TO_PERLEGEN_600K"                             
   (	"SUBSNP_ID" NUMBER(10,0),                                                  
	"SNP_ID" NUMBER(10,0),                                                         
	"CHR" VARCHAR2(10),                                                            
	"POS" NUMBER(10,0),                                                            
	"P_SNP_ID" NUMBER(10,0),                                                       
	"P_RSID" NUMBER(10,0)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."DUP_RSID"                                               
   (	"SNP_PROBE_ID" NUMBER(22,0),                                               
	"PROBE_NAME" VARCHAR2(255),                                                    
	"SNP_ID" NUMBER(22,0),                                                         
	"SNP_NAME" VARCHAR2(255),                                                      
	"VENDOR_NAME" VARCHAR2(255)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_CLINICAL_DATA"                                   
   (	"STUDY_ID" VARCHAR2(25),                                                   
	"SITE_ID" VARCHAR2(50),                                                        
	"SUBJECT_ID" VARCHAR2(20),                                                     
	"VISIT_NAME" VARCHAR2(100),                                                    
	"DATA_LABEL" VARCHAR2(500),                                                    
	"DATA_VALUE" VARCHAR2(500),                                                    
	"CATEGORY_CD" VARCHAR2(250),                                                   
	"CTRL_VOCAB_CODE" VARCHAR2(200)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_DEAPP_ANNOT"                                     
   (	"GPL_ID" VARCHAR2(100),                                                    
	"PROBE_ID" VARCHAR2(100),                                                      
	"GENE_SYMBOL" VARCHAR2(100),                                                   
	"GENE_ID" VARCHAR2(250),                                                       
	"ORGANISM" VARCHAR2(200)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_MRNA_DATA"                                       
   (	"TRIAL_NAME" VARCHAR2(25),                                                 
	"PROBESET" VARCHAR2(100),                                                      
	"EXPR_ID" VARCHAR2(100),                                                       
	"INTENSITY_VALUE" VARCHAR2(50)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 243269632 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_MRNA_SUBJ_SAMP_MAP"                              
   (	"TRIAL_NAME" VARCHAR2(100),                                                
	"SITE_ID" VARCHAR2(100),                                                       
	"SUBJECT_ID" VARCHAR2(100),                                                    
	"SAMPLE_CD" VARCHAR2(100),                                                     
	"PLATFORM" VARCHAR2(100),                                                      
	"TISSUE_TYPE" VARCHAR2(100),                                                   
	"ATTRIBUTE_1" VARCHAR2(256),                                                   
	"ATTRIBUTE_2" VARCHAR2(200),                                                   
	"CATEGORY_CD" VARCHAR2(200),                                                   
	"SOURCE_CD" VARCHAR2(200)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_SAMPLE_CATEGORIES"                               
   (	"TRIAL_CD" VARCHAR2(200),                                                  
	"SITE_CD" VARCHAR2(200),                                                       
	"SUBJECT_CD" VARCHAR2(200),                                                    
	"SAMPLE_CD" VARCHAR2(200),                                                     
	"CATEGORY_CD" VARCHAR2(200),                                                   
	"CATEGORY_VALUE" VARCHAR2(200)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_STUDY_METADATA"                                  
   (	"STUDY_ID" VARCHAR2(100),                                                  
	"TITLE" VARCHAR2(1000),                                                        
	"DESCRIPTION" VARCHAR2(2000),                                                  
	"DESIGN" VARCHAR2(2000),                                                       
	"START_DATE" VARCHAR2(50),                                                     
	"COMPLETION_DATE" VARCHAR2(50),                                                
	"PRIMARY_INVESTIGATOR" VARCHAR2(400),                                          
	"CONTACT_FIELD" VARCHAR2(400),                                                 
	"STATUS" VARCHAR2(100),                                                        
	"OVERALL_DESIGN" VARCHAR2(2000),                                               
	"INSTITUTION" VARCHAR2(100),                                                   
	"COUNTRY" VARCHAR2(50),                                                        
	"BIOMARKER_TYPE" VARCHAR2(255),                                                
	"TARGET" VARCHAR2(255),                                                        
	"ACCESS_TYPE" VARCHAR2(100),                                                   
	"STUDY_OWNER" VARCHAR2(510),                                                   
	"STUDY_PHASE" VARCHAR2(100),                                                   
	"BLINDING_PROCEDURE" VARCHAR2(1000),                                           
	"STUDYTYPE" VARCHAR2(510),                                                     
	"DURATION_OF_STUDY_WEEKS" VARCHAR2(200),                                       
	"NUMBER_OF_PATIENTS" VARCHAR2(200),                                            
	"NUMBER_OF_SITES" VARCHAR2(200),                                               
	"ROUTE_OF_ADMINISTRATION" VARCHAR2(510),                                       
	"DOSING_REGIMEN" VARCHAR2(3500),                                               
	"GROUP_ASSIGNMENT" VARCHAR2(510),                                              
	"TYPE_OF_CONTROL" VARCHAR2(510),                                               
	"PRIMARY_END_POINTS" VARCHAR2(2000),                                           
	"SECONDARY_END_POINTS" VARCHAR2(3500),                                         
	"INCLUSION_CRITERIA" VARCHAR2(4000),                                           
	"EXCLUSION_CRITERIA" VARCHAR2(4000),                                           
	"SUBJECTS" VARCHAR2(2000),                                                     
	"GENDER_RESTRICTION_MFB" VARCHAR2(510),                                        
	"MIN_AGE" VARCHAR2(100),                                                       
	"MAX_AGE" VARCHAR2(100),                                                       
	"SECONDARY_IDS" VARCHAR2(510),                                                 
	"DEVELOPMENT_PARTNER" VARCHAR2(100),                                           
	"GEO_PLATFORM" VARCHAR2(100),                                                  
	"MAIN_FINDINGS" VARCHAR2(2000),                                                
	"SEARCH_AREA" VARCHAR2(100),                                                   
	"COMPOUND" VARCHAR2(1000),                                                     
	"DISEASE" VARCHAR2(1000),                                                      
	"PUBMED_IDS" VARCHAR2(1000),                                                   
	"ORGANISM" VARCHAR2(200)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LT_SRC_STUDY_METADATA_AD_HOC"                           
   (	"STUDY_ID" VARCHAR2(100),                                                  
	"AD_HOC_PROPERTY_KEY" VARCHAR2(500),                                           
	"AD_HOC_PROPERTY_VALUE" VARCHAR2(4000)                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_ANALYSIS_METADATA"                               
   (	"STUDY_ID" VARCHAR2(50),                                                   
	"DATA_TYPE" VARCHAR2(50),                                                      
	"ANALYSIS_NAME" VARCHAR2(500),                                                 
	"DESCRIPTION" VARCHAR2(1000),                                                  
	"PHENOTYPE_IDS" VARCHAR2(250),                                                 
	"POPULATION" VARCHAR2(500),                                                    
	"TISSUE" VARCHAR2(500),                                                        
	"GENOME_VERSION" VARCHAR2(50),                                                 
	"GENOTYPE_PLATFORM_IDS" VARCHAR2(500),                                         
	"EXPRESSION_PLATFORM_IDS" VARCHAR2(500),                                       
	"STATISTICAL_TEST" VARCHAR2(500),                                              
	"RESEARCH_UNIT" VARCHAR2(500),                                                 
	"SAMPLE_SIZE" VARCHAR2(500),                                                   
	"CELL_TYPE" VARCHAR2(500),                                                     
	"PVALUE_CUTOFF" VARCHAR2(50),                                                  
	"ETL_DATE" TIMESTAMP (6),                                                      
	"FILENAME" VARCHAR2(500),                                                      
	"STATUS" VARCHAR2(50),                                                         
	"PROCESS_DATE" TIMESTAMP (6),                                                  
	"ETL_ID" NUMBER(38,0),                                                         
	"ANALYSIS_NAME_ARCHIVED" VARCHAR2(500),                                        
	"MODEL_NAME" VARCHAR2(500),                                                    
	"MODEL_DESC" VARCHAR2(4000)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_CLINICAL_DATA"                                   
   (	"STUDY_ID" VARCHAR2(25),                                                   
	"SITE_ID" VARCHAR2(50),                                                        
	"SUBJECT_ID" VARCHAR2(20),                                                     
	"VISIT_NAME" VARCHAR2(100),                                                    
	"DATA_LABEL" VARCHAR2(500),                                                    
	"DATA_VALUE" VARCHAR2(500),                                                    
	"CATEGORY_CD" VARCHAR2(250),                                                   
	"ETL_JOB_ID" NUMBER(22,0),                                                     
	"ETL_DATE" DATE,                                                               
	"CTRL_VOCAB_CODE" VARCHAR2(200)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 83886080 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_MRNA_DATA"                                       
   (	"TRIAL_NAME" VARCHAR2(25),                                                 
	"PROBESET" VARCHAR2(100),                                                      
	"EXPR_ID" VARCHAR2(100),                                                       
	"INTENSITY_VALUE" VARCHAR2(50),                                                
	"SOURCE_CD" VARCHAR2(200)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_MRNA_SUBJ_SAMP_MAP"                              
   (	"TRIAL_NAME" VARCHAR2(100),                                                
	"SITE_ID" VARCHAR2(100),                                                       
	"SUBJECT_ID" VARCHAR2(100),                                                    
	"SAMPLE_CD" VARCHAR2(100),                                                     
	"PLATFORM" VARCHAR2(100),                                                      
	"TISSUE_TYPE" VARCHAR2(100),                                                   
	"ATTRIBUTE_1" VARCHAR2(256),                                                   
	"ATTRIBUTE_2" VARCHAR2(200),                                                   
	"CATEGORY_CD" VARCHAR2(200),                                                   
	"SOURCE_CD" VARCHAR2(50)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_SAMPLE_CATEGORIES"                               
   (	"TRIAL_CD" VARCHAR2(200),                                                  
	"SITE_CD" VARCHAR2(200),                                                       
	"SUBJECT_CD" VARCHAR2(200),                                                    
	"SAMPLE_CD" VARCHAR2(200),                                                     
	"CATEGORY_CD" VARCHAR2(200),                                                   
	"CATEGORY_VALUE" VARCHAR2(200)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_SAMPLE_CATEGORIES_BKUP"                          
   (	"TRIAL_CD" VARCHAR2(200),                                                  
	"SITE_CD" VARCHAR2(200),                                                       
	"SUBJECT_CD" VARCHAR2(200),                                                    
	"SAMPLE_CD" VARCHAR2(200),                                                     
	"CATEGORY_CD" VARCHAR2(200),                                                   
	"CATEGORY_VALUE" VARCHAR2(200)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_STUDY_METADATA"                                  
   (	"STUDY_ID" VARCHAR2(100),                                                  
	"TITLE" VARCHAR2(1000),                                                        
	"DESCRIPTION" VARCHAR2(2000),                                                  
	"DESIGN" VARCHAR2(2000),                                                       
	"START_DATE" VARCHAR2(50),                                                     
	"COMPLETION_DATE" VARCHAR2(50),                                                
	"PRIMARY_INVESTIGATOR" VARCHAR2(400),                                          
	"CONTACT_FIELD" VARCHAR2(400),                                                 
	"STATUS" VARCHAR2(100),                                                        
	"OVERALL_DESIGN" VARCHAR2(2000),                                               
	"INSTITUTION" VARCHAR2(100),                                                   
	"COUNTRY" VARCHAR2(50),                                                        
	"BIOMARKER_TYPE" VARCHAR2(255),                                                
	"TARGET" VARCHAR2(255),                                                        
	"ACCESS_TYPE" VARCHAR2(100),                                                   
	"STUDY_OWNER" VARCHAR2(510),                                                   
	"STUDY_PHASE" VARCHAR2(100),                                                   
	"BLINDING_PROCEDURE" VARCHAR2(1000),                                           
	"STUDYTYPE" VARCHAR2(510),                                                     
	"DURATION_OF_STUDY_WEEKS" VARCHAR2(200),                                       
	"NUMBER_OF_PATIENTS" VARCHAR2(200),                                            
	"NUMBER_OF_SITES" VARCHAR2(200),                                               
	"ROUTE_OF_ADMINISTRATION" VARCHAR2(510),                                       
	"DOSING_REGIMEN" VARCHAR2(3500),                                               
	"GROUP_ASSIGNMENT" VARCHAR2(510),                                              
	"TYPE_OF_CONTROL" VARCHAR2(510),                                               
	"PRIMARY_END_POINTS" VARCHAR2(2000),                                           
	"SECONDARY_END_POINTS" VARCHAR2(3500),                                         
	"INCLUSION_CRITERIA" VARCHAR2(4000),                                           
	"EXCLUSION_CRITERIA" VARCHAR2(4000),                                           
	"SUBJECTS" VARCHAR2(2000),                                                     
	"GENDER_RESTRICTION_MFB" VARCHAR2(510),                                        
	"MIN_AGE" VARCHAR2(100),                                                       
	"MAX_AGE" VARCHAR2(100),                                                       
	"SECONDARY_IDS" VARCHAR2(510),                                                 
	"DEVELOPMENT_PARTNER" VARCHAR2(100),                                           
	"GEO_PLATFORM" VARCHAR2(100),                                                  
	"MAIN_FINDINGS" VARCHAR2(2000),                                                
	"SEARCH_AREA" VARCHAR2(100),                                                   
	"COMPOUND" VARCHAR2(1000),                                                     
	"DISEASE" VARCHAR2(1000),                                                      
	"PUBMED_IDS" VARCHAR2(1000),                                                   
	"ORGANISM" VARCHAR2(200),                                                      
	"UPLOAD_DATE" TIMESTAMP (6)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."LZ_SRC_STUDY_METADATA_AD_HOC"                           
   (	"STUDY_ID" VARCHAR2(100),                                                  
	"AD_HOC_PROPERTY_KEY" VARCHAR2(500),                                           
	"AD_HOC_PROPERTY_VALUE" VARCHAR2(4000),                                        
	"UPLOAD_DATE" TIMESTAMP (6)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."MERGED_SNP"                                             
   (	"OLD_RSID" NUMBER(10,0),                                                   
	"NEW_RSID" NUMBER(10,0),                                                       
	"BUILD" NUMBER(4,0)                                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."NEW_DBSNP_INFO"                                         
   (	"SNP_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	"CHR" VARCHAR2(32) NOT NULL ENABLE,                                            
	"POS" NUMBER(10,0),                                                            
	"ORIEN" NUMBER(10,0),                                                          
	"NEIGHBOR_SNP_LIST" NUMBER(10,0),                                              
	"ISPAR" VARCHAR2(1) NOT NULL ENABLE                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."NOT_IN_VCF"                                             
   (	"RSID" VARCHAR2(20),                                                       
	"RS" NUMBER(10,0)                                                              
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."PERLEGEN_600K"                                          
   (	"SNP_ID" NUMBER(10,0),                                                     
	"DBSNP_RSID" NUMBER(10,0),                                                     
	"DBSNP_SSID" NUMBER(10,0),                                                     
	"ALLELE_1" VARCHAR2(1),                                                        
	"ALLELE_2" VARCHAR2(1),                                                        
	"CHR" VARCHAR2(4),                                                             
	"SEX_LINKED" VARCHAR2(4),                                                      
	"ACCESSION_ID" VARCHAR2(20),                                                   
	"CONTIG_POSITION" NUMBER(10,0),                                                
	"ISTRAND" VARCHAR2(1),                                                         
	"ASSAYED_SEQUENCE" VARCHAR2(100),                                              
	"NEARBY_GENES" VARCHAR2(2000)                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."PFIZER_SNP"                                             
   (	"SNP_ID" NUMBER(10,0),                                                     
	"DBSNP_RSID" NUMBER(10,0),                                                     
	"DBSNP_SSID" NUMBER(10,0)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."PFIZER_SNP1"                                            
   (	"SNP_ID" NUMBER(10,0),                                                     
	"DBSNP_RSID" VARCHAR2(15)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."RENAMED_SNP"                                            
   (	"DBSNP_RSID" VARCHAR2(255)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."RENAMED_SNP1"                                           
   (	"RSID" NUMBER(10,0)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."RENAMED_SNP_INFO"                                       
   (	"OLD_RSID" NUMBER(10,0),                                                   
	"NEW_RSID" NUMBER(10,0),                                                       
	"CHR" VARCHAR2(32) NOT NULL ENABLE,                                            
	"POS" NUMBER(10,0)                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."RSMERGEARCH_135"                                        
   (	"OLD_RSID" NUMBER(10,0),                                                   
	"NEW_RSID" NUMBER(10,0),                                                       
	"BUILD" NUMBER(4,0)                                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."SNP1"                                                   
   (	"RSID" NUMBER(10,0)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."SNP2"                                                   
   (	"RSID" NUMBER(10,0)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."SNPCHRPOSONREF_135"                                     
   (	"SNP_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	"CHR" VARCHAR2(32) NOT NULL ENABLE,                                            
	"POS" NUMBER(10,0),                                                            
	"ORIEN" NUMBER(10,0),                                                          
	"NEIGHBOR_SNP_LIST" NUMBER(10,0),                                              
	"ISPAR" VARCHAR2(1) NOT NULL ENABLE                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."SNPSUBSNPLINK_135"                                      
   (	"SUBSNP_ID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"SNP_ID" NUMBER(10,0) NOT NULL ENABLE                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."T"                                                      
   (	"P_SNP_ID" NUMBER(10,0),                                                   
	"SNP_INFO_ID" NUMBER(22,0),                                                    
	"NAME" VARCHAR2(255)                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "TM_LZ"."T1"                                                     
   (	"SNP_ID" NUMBER(10,0),                                                     
	"GENOTYPE" CLOB                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("GENOTYPE") STORE AS BASICFILE (                                          
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "TM_LZ"."TRG_ETL_ID"                                
  before INSERT ON LZ_SRC_ANALYSIS_METADATA FOR EACH row                        
  BEGIN IF inserting THEN IF :NEW.ETL_ID IS NULL THEN                           
  SELECT SEQ_ETL_ID.nextval INTO :NEW.ETL_ID FROM dual;                         
END IF;                                                                         
END IF;                                                                         
END;                                                                            
                                                                                
ALTER TRIGGER "TM_LZ"."TRG_ETL_ID" ENABLE                                       
                                                                                
                                                                                
