                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021197" ON "I2B2PM"."PM_CELL_DATA" ("CELL_
ID", "PROJECT_PATH")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021244" ON "I2B2PM"."PM_PROJECT_REQUEST" (
"ID")                                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021243" ON "I2B2PM"."PM_USER_PARAMS" ("ID"
)                                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021242" ON "I2B2PM"."PM_PROJECT_USER_PARAM
S" ("ID")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021241" ON "I2B2PM"."PM_PROJECT_PARAMS" ("
ID")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021240" ON "I2B2PM"."PM_HIVE_PARAMS" ("ID"
)                                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021239" ON "I2B2PM"."PM_GLOBAL_PARAMS" ("I
D")                                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021238" ON "I2B2PM"."PM_CELL_PARAMS" ("ID"
)                                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021204" ON "I2B2PM"."PM_APPROVALS_PARAMS" 
("ID")                                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021203" ON "I2B2PM"."PM_USER_SESSION" ("SE
SSION_ID", "USER_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021202" ON "I2B2PM"."PM_ROLE_REQUIREMENT" 
("TABLE_CD", "COLUMN_CD", "READ_HIVEMGMT_CD", "WRITE_HIVEMGMT_CD")              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021201" ON "I2B2PM"."PM_USER_DATA" ("USER_
ID")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021200" ON "I2B2PM"."PM_PROJECT_USER_ROLES
" ("PROJECT_ID", "USER_ID", "USER_ROLE_CD")                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021199" ON "I2B2PM"."PM_PROJECT_DATA" ("PR
OJECT_ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2PM"."SYS_C0021198" ON "I2B2PM"."PM_HIVE_DATA" ("DOMAI
N_ID")                                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2PM"."PM_PARAMS"  MINVALUE 1 MAXVALUE 999999999999999999
9999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE               
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_APPROVALS"                                          
   (	"APPROVAL_ID" VARCHAR2(50) NOT NULL ENABLE,                                
	"APPROVAL_NAME" VARCHAR2(255),                                                 
	"APPROVAL_DESCRIPTION" VARCHAR2(2000),                                         
	"APPROVAL_ACTIVATION_DATE" DATE,                                               
	"APPROVAL_EXPIRATION_DATE" DATE,                                               
	"OBJECT_CD" VARCHAR2(50),                                                      
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_USER_SESSION"                                       
   (	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                    
	"SESSION_ID" VARCHAR2(50) NOT NULL ENABLE,                                     
	"EXPIRED_DATE" DATE,                                                           
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("SESSION_ID", "USER_ID")                                         
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_USER_PARAMS"                                        
   (	"ID" NUMBER,                                                               
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"VALUE" CLOB,                                                                  
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("VALUE") STORE AS BASICFILE (                                             
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_USER_DATA"                                          
   (	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                    
	"FULL_NAME" VARCHAR2(255),                                                     
	"PASSWORD" VARCHAR2(255),                                                      
	"EMAIL" VARCHAR2(255),                                                         
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("USER_ID")                                                       
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_ROLE_REQUIREMENT"                                   
   (	"TABLE_CD" VARCHAR2(50) NOT NULL ENABLE,                                   
	"COLUMN_CD" VARCHAR2(50) NOT NULL ENABLE,                                      
	"READ_HIVEMGMT_CD" VARCHAR2(50) NOT NULL ENABLE,                               
	"WRITE_HIVEMGMT_CD" VARCHAR2(50) NOT NULL ENABLE,                              
	"NAME_CHAR" VARCHAR2(2000),                                                    
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("TABLE_CD", "COLUMN_CD", "READ_HIVEMGMT_CD", "WRITE_HIVEMGMT_CD")
                                                                                
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_PROJECT_USER_ROLES"                                 
   (	"PROJECT_ID" VARCHAR2(50) NOT NULL ENABLE,                                 
	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"USER_ROLE_CD" VARCHAR2(255) NOT NULL ENABLE,                                  
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("PROJECT_ID", "USER_ID", "USER_ROLE_CD")                         
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_PROJECT_USER_PARAMS"                                
   (	"ID" NUMBER,                                                               
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"PROJECT_ID" VARCHAR2(50) NOT NULL ENABLE,                                     
	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"VALUE" CLOB,                                                                  
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("VALUE") STORE AS BASICFILE (                                             
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_PROJECT_REQUEST"                                    
   (	"ID" NUMBER,                                                               
	"TITLE" VARCHAR2(255),                                                         
	"REQUEST_XML" CLOB NOT NULL ENABLE,                                            
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"PROJECT_ID" VARCHAR2(50),                                                     
	"SUBMIT_CHAR" VARCHAR2(50),                                                    
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("REQUEST_XML") STORE AS BASICFILE (                                       
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_PROJECT_PARAMS"                                     
   (	"ID" NUMBER,                                                               
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"PROJECT_ID" VARCHAR2(50) NOT NULL ENABLE,                                     
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"VALUE" CLOB,                                                                  
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("VALUE") STORE AS BASICFILE (                                             
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_PROJECT_DATA"                                       
   (	"PROJECT_ID" VARCHAR2(50) NOT NULL ENABLE,                                 
	"PROJECT_NAME" VARCHAR2(255),                                                  
	"PROJECT_WIKI" VARCHAR2(255),                                                  
	"PROJECT_KEY" VARCHAR2(255),                                                   
	"PROJECT_PATH" VARCHAR2(255),                                                  
	"PROJECT_DESCRIPTION" VARCHAR2(2000),                                          
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("PROJECT_ID")                                                    
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_HIVE_PARAMS"                                        
   (	"ID" NUMBER,                                                               
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"DOMAIN_ID" VARCHAR2(50) NOT NULL ENABLE,                                      
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"VALUE" CLOB,                                                                  
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("VALUE") STORE AS BASICFILE (                                             
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_HIVE_DATA"                                          
   (	"DOMAIN_ID" VARCHAR2(50) NOT NULL ENABLE,                                  
	"HELPURL" VARCHAR2(255),                                                       
	"DOMAIN_NAME" VARCHAR2(255),                                                   
	"ENVIRONMENT_CD" VARCHAR2(255),                                                
	"ACTIVE" NUMBER(1,0),                                                          
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("DOMAIN_ID")                                                     
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_GLOBAL_PARAMS"                                      
   (	"ID" NUMBER,                                                               
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"PROJECT_PATH" VARCHAR2(255) NOT NULL ENABLE,                                  
	"CAN_OVERRIDE" NUMBER(1,0),                                                    
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"VALUE" CLOB,                                                                  
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("VALUE") STORE AS BASICFILE (                                             
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_APPROVALS_PARAMS"                                   
   (	"ID" NUMBER,                                                               
	"APPROVAL_ID" VARCHAR2(50) NOT NULL ENABLE,                                    
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"VALUE" VARCHAR2(2000),                                                        
	"ACTIVATION_DATE" DATE,                                                        
	"EXPIRATION_DATE" DATE,                                                        
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"OBJECT_CD" VARCHAR2(50),                                                      
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("ID")                                                            
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_CELL_DATA"                                          
   (	"CELL_ID" VARCHAR2(50) NOT NULL ENABLE,                                    
	"PROJECT_PATH" VARCHAR2(255) NOT NULL ENABLE,                                  
	"NAME" VARCHAR2(255),                                                          
	"METHOD_CD" VARCHAR2(255),                                                     
	"URL" VARCHAR2(255),                                                           
	"CAN_OVERRIDE" NUMBER(1,0),                                                    
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	 PRIMARY KEY ("CELL_ID", "PROJECT_PATH")                                       
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2PM"."PM_CELL_PARAMS"                                        
   (	"ID" NUMBER,                                                               
	"DATATYPE_CD" VARCHAR2(50),                                                    
	"CELL_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"PROJECT_PATH" VARCHAR2(255) NOT NULL ENABLE,                                  
	"PARAM_NAME_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"CAN_OVERRIDE" NUMBER(1,0),                                                    
	"CHANGE_DATE" DATE,                                                            
	"ENTRY_DATE" DATE,                                                             
	"CHANGEBY_CHAR" VARCHAR2(50),                                                  
	"STATUS_CD" VARCHAR2(50),                                                      
	"VALUE" CLOB,                                                                  
	 PRIMARY KEY ("ID")                                                            
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
 LOB ("VALUE") STORE AS BASICFILE (                                             
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_CELL_PARAMS_INC"                       
	BEFORE INSERT                                                                  
	ON PM_CELL_PARAMS                                                              
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "I2B2PM"."PM_CELL_PARAMS_INC" ENABLE                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_GLOBAL_PARAMS_INC"                     
	BEFORE INSERT                                                                  
	ON PM_GLOBAL_PARAMS                                                            
	REFERENCING NEW AS NEW                                                         
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "I2B2PM"."PM_GLOBAL_PARAMS_INC" ENABLE                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_HIVE_PARAMS_INC"                       
	BEFORE INSERT                                                                  
	ON PM_HIVE_PARAMS                                                              
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
/	                                                                              
                                                                                
CREATE OR REPLACE TRIGGER PM_PROJECT_PARAMS_INC                                 
	BEFORE INSERT                                                                  
	ON PM_PROJECT_PARAMS                                                           
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
/	                                                                              
                                                                                
CREATE OR REPLACE TRIGGER PM_PROJECT_USER_PARAMS_INC                            
	BEFORE INSERT                                                                  
	ON PM_PROJECT_USER_PARAMS                                                      
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
/	                                                                              
                                                                                
                                                                                
CREATE OR REPLACE TRIGGER PM_USER_PARAMS_INC                                    
	BEFORE INSERT                                                                  
	ON PM_USER_PARAMS                                                              
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
/	                                                                              
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "I2B2PM"."PM_HIVE_PARAMS_INC" ENABLE                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2PM"."PM_PROJECT_REQUEST_INC"                   
	BEFORE INSERT                                                                  
	ON PM_PROJECT_REQUEST                                                          
	FOR EACH ROW                                                                   
	BEGIN                                                                          
	SELECT PM_PARAMS.NEXTVAL INTO :NEW.ID FROM DUAL;                               
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "I2B2PM"."PM_PROJECT_REQUEST_INC" ENABLE                          
                                                                                
                                                                                
