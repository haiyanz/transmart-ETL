                                                                                
  CREATE TABLE "I2B2SAMPLEDATA"."I2B2_SAMPLE"                                   
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
	"I2B2_SAMPLE_ID" NUMBER(10,0)                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2SAMPLEDATA"."TABLE_ACCESS"                                  
   (	"C_TABLE_CD" VARCHAR2(50),                                                 
	"C_TABLE_NAME" VARCHAR2(50),                                                   
	"C_PROTECTED_ACCESS" CHAR(1),                                                  
	"C_HLEVEL" NUMBER(22,0),                                                       
	"C_FULLNAME" VARCHAR2(900),                                                    
	"C_NAME" VARCHAR2(2000),                                                       
	"C_SYNONYM_CD" CHAR(1),                                                        
	"C_VISUALATTRIBUTES" CHAR(3),                                                  
	"C_TOTALNUM" NUMBER(22,0),                                                     
	"C_BASECODE" VARCHAR2(450),                                                    
	"C_METADATAXML" CLOB,                                                          
	"C_FACTTABLECOLUMN" VARCHAR2(50),                                              
	"C_DIMTABLENAME" VARCHAR2(50),                                                 
	"C_COLUMNNAME" VARCHAR2(50),                                                   
	"C_COLUMNDATATYPE" VARCHAR2(50),                                               
	"C_OPERATOR" VARCHAR2(10),                                                     
	"C_DIMCODE" VARCHAR2(900),                                                     
	"C_COMMENT" CLOB,                                                              
	"C_TOOLTIP" VARCHAR2(900),                                                     
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
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
                                                                                
                                                                                
