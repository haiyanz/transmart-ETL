                                                                                
  CREATE UNIQUE INDEX "I2B2WORKDATA"."WORKPLACE_ACCESS_PK" ON "I2B2WORKDATA"."WO
RKPLACE_ACCESS" ("C_INDEX")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2WORKDATA"."WORKPLACE_PK" ON "I2B2WORKDATA"."WORKPLACE
" ("C_INDEX")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2WORKDATA"."WORKPLACE"                                       
   (	"C_NAME" VARCHAR2(255) NOT NULL ENABLE,                                    
	"C_USER_ID" VARCHAR2(255) NOT NULL ENABLE,                                     
	"C_GROUP_ID" VARCHAR2(255) NOT NULL ENABLE,                                    
	"C_SHARE_ID" VARCHAR2(255),                                                    
	"C_INDEX" VARCHAR2(255) NOT NULL ENABLE,                                       
	"C_PARENT_INDEX" VARCHAR2(255),                                                
	"C_VISUALATTRIBUTES" CHAR(3) NOT NULL ENABLE,                                  
	"C_PROTECTED_ACCESS" CHAR(1),                                                  
	"C_TOOLTIP" VARCHAR2(255),                                                     
	"C_WORK_XML" CLOB,                                                             
	"C_WORK_XML_SCHEMA" CLOB,                                                      
	"C_WORK_XML_I2B2_TYPE" VARCHAR2(255),                                          
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1),                                                         
	 CONSTRAINT "WORKPLACE_PK" PRIMARY KEY ("C_INDEX")                             
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
 LOB ("C_WORK_XML") STORE AS BASICFILE (                                        
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("C_WORK_XML_SCHEMA") STORE AS BASICFILE (                                 
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2WORKDATA"."WORKPLACE_ACCESS"                                
   (	"C_TABLE_CD" VARCHAR2(255) NOT NULL ENABLE,                                
	"C_TABLE_NAME" VARCHAR2(255) NOT NULL ENABLE,                                  
	"C_PROTECTED_ACCESS" CHAR(1),                                                  
	"C_HLEVEL" NUMBER(38,0) NOT NULL ENABLE,                                       
	"C_NAME" VARCHAR2(255) NOT NULL ENABLE,                                        
	"C_USER_ID" VARCHAR2(255) NOT NULL ENABLE,                                     
	"C_GROUP_ID" VARCHAR2(255) NOT NULL ENABLE,                                    
	"C_SHARE_ID" VARCHAR2(255),                                                    
	"C_INDEX" VARCHAR2(255) NOT NULL ENABLE,                                       
	"C_PARENT_INDEX" VARCHAR2(255),                                                
	"C_VISUALATTRIBUTES" CHAR(3) NOT NULL ENABLE,                                  
	"C_TOOLTIP" VARCHAR2(255),                                                     
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1),                                                         
	 CONSTRAINT "WORKPLACE_ACCESS_PK" PRIMARY KEY ("C_INDEX")                      
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
                                                                                
                                                                                
