                                                                                
  CREATE INDEX "I2B2METADATA"."I2B2_IDX1" ON "I2B2METADATA"."I2B2" ("C_FULLNAME"
)                                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2METADATA"."SYS_C0021208" ON "I2B2METADATA"."ONT_PROCE
SS_STATUS" ("PROCESS_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2METADATA"."META_FULLNAME_CUSTOM_IDX" ON "I2B2METADATA"."CUST
OM_META" ("C_FULLNAME")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2METADATA"."META_APPLIED_PATH_I2B2_IDX" ON "I2B2METADATA"."I2
B2" ("M_APPLIED_PATH")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2METADATA"."META_APPLIED_PATH_CUSTOM_IDX" ON "I2B2METADATA"."
CUSTOM_META" ("M_APPLIED_PATH")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2METADATA"."ADD_ONTOLOGY_NODE"                
(parent_path_src varchar2--(255)                                                
, node_name varchar2--(255)                                                     
, is_leaf_src varchar2--(30)                                                    
, is_number VARCHAR2--(30)                                                      
, prefix varchar2                                                               
)                                                                               
as                                                                              
begin                                                                           
  declare                                                                       
    max_basecode number;                                                        
    parent_path varchar2(255);                                                  
    is_leaf varchar2(30);                                                       
    ct number;                                                                  
    hlevel number;                                                              
    concept_code varchar2(30);                                                  
    xml VARCHAR2(1000);                                                         
    data_type varchar(30);                                                      
    sourcesyscd varchar(30);                                                    
  begin                                                                         
                                                                                
------------------------------------------------------------                    
-- get parent path                                                              
------------------------------------------------------------                    
    --parent_path := '&parent_path';                                            
                                                                                
      select count(*) into ct                                                   
      from i2b2metadata.i2b2                                                    
      where c_fullname=parent_path_src;                                         
                                                                                
      if (ct=0) then                                                            
        dbms_output.put_line('Supplied path: '||parent_path_src||' does not exis
t');                                                                            
        return;                                                                 
      end if;                                                                   
                                                                                
    if (substr(parent_path, length(parent_path), 1)!='\') then                  
      parent_path := parent_path_src||'\';                                      
    else parent_path := parent_path_src;                                        
    end if;                                                                     
                                                                                
    sourcesyscd := substr(parent_path, 2, instr(parent_path, '\', 2)-2);        
    dbms_output.put_line('parent path: '||parent_path||', source system code: '|
| sourcesyscd);                                                                 
------------------------------------------------------------                    
-- get the name of the node                                                     
------------------------------------------------------------                    
  --node_name := '&node_name';                                                  
    dbms_output.put_line('node name: '||node_name);                             
------------------------------------------------------------                    
-- find out whether the node supplied is a leaf or a folder                     
------------------------------------------------------------                    
  --is_leaf := '&IsLeaf_Y_N';                                                   
  ----------------------------------------------------------                    
  -- if node is a leaf, set attribute value to LA, set                          
  -- concept code and find out what data type the leaf is                       
  ----------------------------------------------------------                    
    is_leaf := is_leaf_src;                                                     
                                                                                
    if (upper(is_leaf) = 'Y') then                                              
                                                                                
      is_leaf := 'LA';                                                          
                                                                                
      select prefix||seq_i2b2_data_id.nextval                                   
      into concept_code from dual;                                              
                                                                                
      --is_number :='&is_number';                                               
      if (upper(is_number) = 'Y') then                                          
        xml := '<?xml version="1.0"?><ValueMetadata><Version>3.02</Version><Crea
tionDateTime>08/14/2008 01:22:59</CreationDateTime><TestID></TestID><TestName></
TestName><DataType>PosFloat</DataType><CodeType></CodeType><Loinc></Loinc><Flags
touse></Flagstouse><Oktousevalues>Y</Oktousevalues><MaxStringLength></MaxStringL
ength><LowofLowValue>0</LowofLowValue><HighofLowValue>0</HighofLowValue><LowofHi
ghValue>100</LowofHighValue>100<HighofHighValue>100</HighofHighValue><LowofToxic
Value></LowofToxicValue><HighofToxicValue></HighofToxicValue><EnumValues></EnumV
alues><CommentsDeterminingExclusion><Com></Com></CommentsDeterminingExclusion><U
nitValues><NormalUnits>ratio</NormalUnits><EqualUnits></EqualUnits><ExcludingUni
ts></ExcludingUnits><ConvertingUnits><Units></Units><MultiplyingFactor></Multipl
yingFactor></ConvertingUnits></UnitValues><Analysis><Enums /><Counts /><New /></
Analysis></ValueMetadata>';                                                     
        data_type := 'N';                                                       
      elsif (upper(is_number) = 'N') then                                       
        data_type := 'T';                                                       
      else                                                                      
        dbms_output.put_line('IS_NUMBER prompt requires ''Y'' or ''N'' input'); 
        return;                                                                 
      end if;                                                                   
    elsif (upper(is_leaf) ='N') then                                            
      is_leaf := 'FA';                                                          
      data_type := 'T';                                                         
    else                                                                        
      dbms_output.put_line('IS_LEAF prompt requires ''Y'' or ''N'' input');     
      return;                                                                   
    end if;                                                                     
    dbms_output.put_line('node type: '||is_leaf||', data type: '||data_type||', 
concept code: '||concept_code);                                                 
                                                                                
------------------------------------------------------------                    
-- obtail the proper level for the node by finding the                          
-- level of its parent and adding one.                                          
------------------------------------------------------------                    
    select c_hlevel+1 into hlevel                                               
    from i2b2metadata.i2b2                                                      
    where upper(c_fullname)=upper(parent_path);                                 
    dbms_output.put_line('level: '||hlevel);                                    
------------------------------------------------------------                    
-- add the new node into the i2b2 table                                         
------------------------------------------------------------                    
    insert into i2b2demodata.i2b2(                                              
    C_HLEVEL, C_FULLNAME, C_NAME                                                
    , C_SYNONYM_CD, C_VISUALATTRIBUTES, C_TOTALNUM                              
    , C_BASECODE, C_METADATAXML, C_FACTTABLECOLUMN                              
    , C_TABLENAME, C_COLUMNNAME, C_COLUMNDATATYPE                               
    , C_OPERATOR, C_DIMCODE, C_COMMENT                                          
    , C_TOOLTIP, UPDATE_DATE, DOWNLOAD_DATE                                     
    , IMPORT_DATE, SOURCESYSTEM_CD, VALUETYPE_CD                                
    )                                                                           
    values (hlevel, parent_path||node_name||'\', node_name                      
    , 'N', is_leaf, 0                                                           
    , concept_code, xml, 'concept_cd'                                           
    , 'concept_dimension', 'concept_path', data_type                            
    , 'LIKE', parent_path||node_name||'\', null                                 
    , parent_path||node_name, sysdate, sysdate                                  
    , sysdate, sourcesyscd, null);                                              
    commit;                                                                     
  end;                                                                          
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2METADATA"."UTIL_GRANT_ALL"                   
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2METADATA"."I2B2_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999
99999999999999999 INCREMENT BY 1 START WITH 60445 CACHE 20 NOORDER  NOCYCLE     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2METADATA"."SEQ_I2B2_DATA_ID"  MINVALUE 1 MAXVALUE 99999
9999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2METADATA"."SEQ_CONCEPT_CODE"  MINVALUE 1 MAXVALUE 99999
9999999999999999999999 INCREMENT BY 1 START WITH 1020 CACHE 20 NOORDER  NOCYCLE 
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2METADATA"."ONT_SQ_PS_PRID"  MINVALUE 1 MAXVALUE 9999999
999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE     
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."CUSTOM_META"                                     
   (	"C_HLEVEL" NUMBER(22,0) NOT NULL ENABLE,                                   
	"C_FULLNAME" VARCHAR2(700) NOT NULL ENABLE,                                    
	"C_NAME" VARCHAR2(2000) NOT NULL ENABLE,                                       
	"C_SYNONYM_CD" CHAR(1) NOT NULL ENABLE,                                        
	"C_VISUALATTRIBUTES" CHAR(3) NOT NULL ENABLE,                                  
	"C_TOTALNUM" NUMBER(22,0),                                                     
	"C_BASECODE" VARCHAR2(50),                                                     
	"C_METADATAXML" CLOB,                                                          
	"C_FACTTABLECOLUMN" VARCHAR2(50) NOT NULL ENABLE,                              
	"C_TABLENAME" VARCHAR2(50) NOT NULL ENABLE,                                    
	"C_COLUMNNAME" VARCHAR2(50) NOT NULL ENABLE,                                   
	"C_COLUMNDATATYPE" VARCHAR2(50) NOT NULL ENABLE,                               
	"C_OPERATOR" VARCHAR2(10) NOT NULL ENABLE,                                     
	"C_DIMCODE" VARCHAR2(900) NOT NULL ENABLE,                                     
	"C_COMMENT" CLOB,                                                              
	"C_TOOLTIP" VARCHAR2(900),                                                     
	"UPDATE_DATE" DATE NOT NULL ENABLE,                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"VALUETYPE_CD" VARCHAR2(50),                                                   
	"M_APPLIED_PATH" VARCHAR2(700) NOT NULL ENABLE,                                
	"M_EXCLUSION_CD" VARCHAR2(25),                                                 
	"C_PATH" VARCHAR2(700),                                                        
	"C_SYMBOL" VARCHAR2(50)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("C_METADATAXML") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."I2B2"                                            
   (	"C_HLEVEL" NUMBER(22,0),                                                   
	"C_FULLNAME" VARCHAR2(700) NOT NULL ENABLE,                                    
	"C_NAME" VARCHAR2(2000),                                                       
	"C_SYNONYM_CD" CHAR(1),                                                        
	"C_VISUALATTRIBUTES" CHAR(3),                                                  
	"C_TOTALNUM" NUMBER(22,0),                                                     
	"C_BASECODE" VARCHAR2(50),                                                     
	"C_METADATAXML" CLOB,                                                          
	"C_FACTTABLECOLUMN" VARCHAR2(50),                                              
	"C_TABLENAME" VARCHAR2(50),                                                    
	"C_COLUMNNAME" VARCHAR2(50),                                                   
	"C_COLUMNDATATYPE" VARCHAR2(50),                                               
	"C_OPERATOR" VARCHAR2(10),                                                     
	"C_DIMCODE" VARCHAR2(700),                                                     
	"C_COMMENT" CLOB,                                                              
	"C_TOOLTIP" VARCHAR2(900),                                                     
	"UPDATE_DATE" DATE DEFAULT sysdate NOT NULL ENABLE,                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"VALUETYPE_CD" VARCHAR2(50),                                                   
	"I2B2_ID" NUMBER(22,0),                                                        
	"M_APPLIED_PATH" VARCHAR2(700),                                                
	"M_EXCLUSION_CD" VARCHAR2(25),                                                 
	"C_PATH" VARCHAR2(700),                                                        
	"C_SYMBOL" VARCHAR2(50)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS FOR OLTP NOLOGGING     
  STORAGE(INITIAL 75497472 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("C_METADATAXML") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."I2B2_SECURE"                                     
   (	"C_HLEVEL" NUMBER(22,0),                                                   
	"C_FULLNAME" VARCHAR2(900) NOT NULL ENABLE,                                    
	"C_NAME" VARCHAR2(2000),                                                       
	"C_SYNONYM_CD" CHAR(1),                                                        
	"C_VISUALATTRIBUTES" CHAR(3),                                                  
	"C_TOTALNUM" NUMBER(22,0),                                                     
	"C_BASECODE" VARCHAR2(450),                                                    
	"C_METADATAXML" CLOB,                                                          
	"C_FACTTABLECOLUMN" VARCHAR2(50),                                              
	"C_TABLENAME" VARCHAR2(50),                                                    
	"C_COLUMNNAME" VARCHAR2(50),                                                   
	"C_COLUMNDATATYPE" VARCHAR2(50),                                               
	"C_OPERATOR" VARCHAR2(10),                                                     
	"C_DIMCODE" VARCHAR2(900),                                                     
	"C_COMMENT" CLOB,                                                              
	"C_TOOLTIP" VARCHAR2(900),                                                     
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"VALUETYPE_CD" VARCHAR2(50),                                                   
	"SECURE_OBJ_TOKEN" VARCHAR2(50)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 75497472 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("C_METADATAXML") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."I2B2_TAGS"                                       
   (	"TAG_ID" NUMBER(18,0) NOT NULL ENABLE,                                     
	"PATH" VARCHAR2(400),                                                          
	"TAG" VARCHAR2(400),                                                           
	"TAG_TYPE" VARCHAR2(400),                                                      
	"TAGS_IDX" NUMBER(22,0) NOT NULL ENABLE                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."ONT_DB_LOOKUP"                                   
   (	"C_DOMAIN_ID" VARCHAR2(255),                                               
	"C_PROJECT_PATH" VARCHAR2(255),                                                
	"C_OWNER_ID" VARCHAR2(255),                                                    
	"C_DB_FULLSCHEMA" VARCHAR2(255),                                               
	"C_DB_DATASOURCE" VARCHAR2(255),                                               
	"C_DB_SERVERTYPE" VARCHAR2(255),                                               
	"C_DB_NICENAME" VARCHAR2(255),                                                 
	"C_DB_TOOLTIP" VARCHAR2(255),                                                  
	"C_COMMENT" CLOB,                                                              
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."ONT_PROCESS_STATUS"                              
   (	"PROCESS_ID" NUMBER(5,0),                                                  
	"PROCESS_TYPE_CD" VARCHAR2(50),                                                
	"START_DATE" DATE,                                                             
	"END_DATE" DATE,                                                               
	"PROCESS_STEP_CD" VARCHAR2(50),                                                
	"PROCESS_STATUS_CD" VARCHAR2(50),                                              
	"CRC_UPLOAD_ID" VARCHAR2(5),                                                   
	"STATUS_CD" VARCHAR2(50),                                                      
	"MESSAGE" VARCHAR2(2000),                                                      
	"ENTRY_DATE" DATE,                                                             
	"CHANGE_DATE" DATE,                                                            
	"CHANGEDBY_CHAR" CHAR(50),                                                     
	 PRIMARY KEY ("PROCESS_ID")                                                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."QUERY1"                                          
   (	"TRIALNUMBER" NVARCHAR2(255),                                              
	"DESCRIPTION" NCLOB                                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("DESCRIPTION") STORE AS BASICFILE "SYS_LOB0000015519C00002$$"(            
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."SCHEMES"                                         
   (	"C_KEY" VARCHAR2(50),                                                      
	"C_NAME" VARCHAR2(50),                                                         
	"C_DESCRIPTION" VARCHAR2(100)                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2METADATA"."TABLE_ACCESS"                                    
   (	"C_TABLE_CD" VARCHAR2(50),                                                 
	"C_TABLE_NAME" VARCHAR2(50),                                                   
	"C_PROTECTED_ACCESS" CHAR(1),                                                  
	"C_HLEVEL" NUMBER(22,0),                                                       
	"C_FULLNAME" VARCHAR2(700),                                                    
	"C_NAME" VARCHAR2(2000),                                                       
	"C_SYNONYM_CD" CHAR(1),                                                        
	"C_VISUALATTRIBUTES" CHAR(3),                                                  
	"C_TOTALNUM" NUMBER(22,0),                                                     
	"C_BASECODE" VARCHAR2(50),                                                     
	"C_METADATAXML" CLOB,                                                          
	"C_FACTTABLECOLUMN" VARCHAR2(50),                                              
	"C_DIMTABLENAME" VARCHAR2(50),                                                 
	"C_COLUMNNAME" VARCHAR2(50),                                                   
	"C_COLUMNDATATYPE" VARCHAR2(50),                                               
	"C_OPERATOR" VARCHAR2(10),                                                     
	"C_DIMCODE" VARCHAR2(700),                                                     
	"C_COMMENT" CLOB,                                                              
	"C_TOOLTIP" VARCHAR2(900),                                                     
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1),                                                         
	"VALUETYPE_CD" VARCHAR2(50)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("C_METADATAXML") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2METADATA"."TRG_I2B2_ID"                        
before insert on "I2B2"                                                         
for each row begin                                                              
  if inserting then                                                             
    if :NEW."I2B2_ID" is null then                                              
      select I2B2_ID_SEQ.nextval into :NEW."I2B2_ID" from dual;                 
    end if;                                                                     
  end if;                                                                       
end;                                                                            
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "I2B2METADATA"."TRG_I2B2_ID" ENABLE                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2METADATA"."TRG_I2B2_TAG_ID"                    
before insert on i2b2_tags                                                      
for each row begin                                                              
 if inserting then if :NEW."TAG_ID" is null then select SEQ_I2B2_DATA_ID.nextval
 into :NEW."TAG_ID" from dual;                                                  
 end if;                                                                        
 end if;                                                                        
 end;                                                                           
                                                                                
                                                                                
ALTER TRIGGER "I2B2METADATA"."TRG_I2B2_TAG_ID" ENABLE                           
                                                                                
                                                                                
