                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."ANALSIS_JOB_PK" ON "I2B2HIVE"."CRC_ANALYSIS_JO
B" ("JOB_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."WORK_DB_LOOKUP_PK" ON "I2B2HIVE"."WORK_DB_LOOK
UP" ("C_DOMAIN_ID", "C_PROJECT_PATH", "C_OWNER_ID")                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."SYS_C0021232" ON "I2B2HIVE"."JMS_MESSAGES" ("M
ESSAGEID", "DESTINATION")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."SYS_C0021194" ON "I2B2HIVE"."JMS_USERS" ("USER
ID")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."SYS_C0021193" ON "I2B2HIVE"."JMS_TRANSACTIONS"
 ("TXID")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."SYS_C0021192" ON "I2B2HIVE"."JMS_SUBSCRIPTIONS
" ("CLIENTID", "SUBNAME")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."SYS_C0021191" ON "I2B2HIVE"."JMS_ROLES" ("USER
ID", "ROLEID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."ONT_DB_LOOKUP_PK" ON "I2B2HIVE"."ONT_DB_LOOKUP
" ("C_DOMAIN_ID", "C_PROJECT_PATH", "C_OWNER_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2HIVE"."JMS_MESSAGES_TXOP_TXID" ON "I2B2HIVE"."JMS_MESSAGES" 
("TXOP", "TXID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2HIVE"."JMS_MESSAGES_DESTINATION" ON "I2B2HIVE"."JMS_MESSAGES
" ("DESTINATION")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."HILO_PK" ON "I2B2HIVE"."HILOSEQUENCES" ("SEQUE
NCENAME")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2HIVE"."CRC_DB_LOOKUP_PK" ON "I2B2HIVE"."CRC_DB_LOOKUP
" ("C_DOMAIN_ID", "C_PROJECT_PATH", "C_OWNER_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."CRC_ANALYSIS_JOB"                                    
   (	"JOB_ID" VARCHAR2(10),                                                     
	"QUEUE_NAME" VARCHAR2(50),                                                     
	"STATUS_TYPE_ID" NUMBER(*,0),                                                  
	"DOMAIN_ID" VARCHAR2(255),                                                     
	"PROJECT_ID" VARCHAR2(500),                                                    
	"USER_ID" VARCHAR2(255),                                                       
	"REQUEST_XML" CLOB,                                                            
	"CREATE_DATE" DATE,                                                            
	"UPDATE_DATE" DATE                                                             
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."CRC_DB_LOOKUP"                                       
   (	"C_DOMAIN_ID" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_PROJECT_PATH" VARCHAR2(255) NOT NULL ENABLE,                                
	"C_OWNER_ID" VARCHAR2(255) NOT NULL ENABLE,                                    
	"C_DB_FULLSCHEMA" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_DATASOURCE" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_SERVERTYPE" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_NICENAME" VARCHAR2(255),                                                 
	"C_DB_TOOLTIP" VARCHAR2(255),                                                  
	"C_COMMENT" CLOB,                                                              
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1),                                                         
	 CONSTRAINT "CRC_DB_LOOKUP_PK" PRIMARY KEY ("C_DOMAIN_ID", "C_PROJECT_PATH", "C
_OWNER_ID")                                                                     
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
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."HILOSEQUENCES"                                       
   (	"SEQUENCENAME" VARCHAR2(50),                                               
	"HIGHVALUES" NUMBER(*,0),                                                      
	 CONSTRAINT "HILO_PK" PRIMARY KEY ("SEQUENCENAME")                             
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."JMS_MESSAGES"                                        
   (	"MESSAGEID" NUMBER(38,0) NOT NULL ENABLE,                                  
	"DESTINATION" VARCHAR2(255) NOT NULL ENABLE,                                   
	"TXID" NUMBER(38,0),                                                           
	"TXOP" CHAR(1),                                                                
	"MESSAGEBLOB" BLOB,                                                            
	 PRIMARY KEY ("MESSAGEID", "DESTINATION")                                      
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
 LOB ("MESSAGEBLOB") STORE AS BASICFILE (                                       
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."JMS_ROLES"                                           
   (	"ROLEID" VARCHAR2(32) NOT NULL ENABLE,                                     
	"USERID" VARCHAR2(32) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("USERID", "ROLEID")                                              
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."JMS_SUBSCRIPTIONS"                                   
   (	"CLIENTID" VARCHAR2(128) NOT NULL ENABLE,                                  
	"SUBNAME" VARCHAR2(128) NOT NULL ENABLE,                                       
	"TOPIC" VARCHAR2(255) NOT NULL ENABLE,                                         
	"SELECTOR" VARCHAR2(255),                                                      
	 PRIMARY KEY ("CLIENTID", "SUBNAME")                                           
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."JMS_TRANSACTIONS"                                    
   (	"TXID" NUMBER(38,0),                                                       
	 PRIMARY KEY ("TXID")                                                          
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."JMS_USERS"                                           
   (	"USERID" VARCHAR2(32) NOT NULL ENABLE,                                     
	"PASSWD" VARCHAR2(32) NOT NULL ENABLE,                                         
	"CLIENTID" VARCHAR2(128),                                                      
	 PRIMARY KEY ("USERID")                                                        
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."ONT_DB_LOOKUP"                                       
   (	"C_DOMAIN_ID" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_PROJECT_PATH" VARCHAR2(255) NOT NULL ENABLE,                                
	"C_OWNER_ID" VARCHAR2(255) NOT NULL ENABLE,                                    
	"C_DB_FULLSCHEMA" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_DATASOURCE" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_SERVERTYPE" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_NICENAME" VARCHAR2(255),                                                 
	"C_DB_TOOLTIP" VARCHAR2(255),                                                  
	"C_COMMENT" CLOB,                                                              
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1),                                                         
	 CONSTRAINT "ONT_DB_LOOKUP_PK" PRIMARY KEY ("C_DOMAIN_ID", "C_PROJECT_PATH", "C
_OWNER_ID")                                                                     
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
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."TIMERS"                                              
   (	"TIMERID" VARCHAR2(80),                                                    
	"TARGETID" VARCHAR2(250),                                                      
	"INITIALDATE" TIMESTAMP (9),                                                   
	"TIMERINTERVAL" NUMBER(19,0),                                                  
	"INSTANCEPK" BLOB,                                                             
	"INFO" BLOB                                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("INSTANCEPK") STORE AS BASICFILE (                                        
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("INFO") STORE AS BASICFILE (                                              
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2HIVE"."WORK_DB_LOOKUP"                                      
   (	"C_DOMAIN_ID" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_PROJECT_PATH" VARCHAR2(255) NOT NULL ENABLE,                                
	"C_OWNER_ID" VARCHAR2(255) NOT NULL ENABLE,                                    
	"C_DB_FULLSCHEMA" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_DATASOURCE" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_SERVERTYPE" VARCHAR2(255) NOT NULL ENABLE,                               
	"C_DB_NICENAME" VARCHAR2(255),                                                 
	"C_DB_TOOLTIP" VARCHAR2(255),                                                  
	"C_COMMENT" CLOB,                                                              
	"C_ENTRY_DATE" DATE,                                                           
	"C_CHANGE_DATE" DATE,                                                          
	"C_STATUS_CD" CHAR(1),                                                         
	 CONSTRAINT "WORK_DB_LOOKUP_PK" PRIMARY KEY ("C_DOMAIN_ID", "C_PROJECT_PATH", "
C_OWNER_ID")                                                                    
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
 LOB ("C_COMMENT") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
