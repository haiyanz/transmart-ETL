                                                                                
  CREATE OR REPLACE FUNCTION "I2B2DEMODATA"."ISNUMERIC"                         
  ( p_string in varchar2)                                                       
  return number                                                                 
  as                                                                            
      l_number number;                                                          
  begin                                                                         
      l_number := p_string;                                                     
      return 1;                                                                 
  exception                                                                     
      when others then                                                          
          return 0;                                                             
  end;                                                                          
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "I2B2DEMODATA"."SF_XTAB" (v_variable IN varchar2,  
                                    v_protocol IN number,                       
                                    v_subject  IN varchar2,                     
                                    v_rowid number)RETURN varchar2 IS           
                                                                                
/****************************************************************************** 
   NAME:       sf_xtab                                                          
   PURPOSE:    This function serves to flatten the SAS to Oracle Conversion via 
               the SLM Process.                                                 
                                                                                
   REVISIONS:                                                                   
   Ver        Date        Author           Description                          
   ---------  ----------  ---------------  ------------------------------------ 
   1.0        5/14/2009   George Kuebrich                                       
                                                                                
   NOTES:                                                                       
                                                                                
   Automatically available Auto Replace Keywords:                               
      Object Name:     sf_xtab                                                  
      Sysdate:         5/14/2009                                                
      Date and Time:   5/14/2009, 8:33:45 AM, and 5/14/2009 8:33:45 AM          
      Username:         (set in TOAD Options, Procedure Editor)                 
      Table Name:       (set in the "New PL/SQL Object" dialog)                 
                                                                                
******************************************************************************/ 
sqlstmt varchar2(1000);                                                         
tmpVar varchar2(500);                                                           
BEGIN                                                                           
                                                                                
   tmpVar := null;                                                              
   execute immediate 'select distinct value into :tmpVar                        
     from sideshow_eav a,                                                       
          protocol b,                                                           
          variable c                                                            
    where a.protocol_id=b.protocol_id                                           
      and a.protocol_id=c.protocol_id                                           
      and a.protocol_id=:2                                                      
      and a.variable_id=c.variable_id                                           
      and a.subject_id=:3                                                       
      and c.variable_name in (:4)                                               
      and a.row_id =:5' USING v_protocol,v_subject,v_variable,v_rowid;          
                                                                                
    --EXECUTE IMMEDIATE sqlstmt USING v_protocol,v_subject,v_variable;          
                                                                                
   RETURN tmpVar;                                                               
   EXCEPTION                                                                    
     WHEN NO_DATA_FOUND THEN                                                    
       NULL;                                                                    
                                                                                
END sf_xtab;                                                                    
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "I2B2DEMODATA"."SF_GET_VISIT" (v_protocolid     IN 
SIDESHOW_EAV.protocol_id%TYPE,                                                  
                                        v_subjectid      IN SIDESHOW_EAV.subject
_id%TYPE,                                                                       
                                        v_variableid     IN SIDESHOW_EAV.variabl
e_id%TYPE)                                                                      
                                        RETURN varchar2  IS                     
--***************************************************************************   
--* Name:  Sf_Get_Visit                                                         
--* Date:  03/24/2009                                                           
--* Author:  George Kuebrich                                                    
--* Purpose:    To select and return the subject's visit for the associated data
set and variable_id.                                                            
--* Inputs:  protocol_id, subject_id, variable_id from the sideshow_eav table   
--* Output:  Returns the subject's visit                                        
--* Effects:   NONE                                                             
--***************************************************************************   
v_visit varchar2(500);                                                          
BEGIN                                                                           
   SELECT DISTINCT decode(upper(c.variable_name),'VISIT',b.value,decode(upper(c.
variable_name),'PERIOD',B.VALUE)) into v_visit                                  
from protocol a,                                                                
     sideshow_eav b,                                                            
     variable c                                                                 
where a.protocol_id=b.protocol_id                                               
  and a.protocol_id=c.protocol_id                                               
  and c.variable_id=b.variable_id                                               
  and a.protocol_id=v_protocolid                                                
  and b.subject_id=v_subjectid                                                  
  AND decode(upper(c.variable_name),'VISIT',b.value,decode(upper(c.variable_name
),'PERIOD',B.VALUE)) IS NOT NULL                                                
  and exists (select ''                                                         
               from variable d                                                  
              where d.protocol_id=a.protocol_id                                 
                and d.variable_id=v_variableid                                  
                and d.dataset_name=c.dataset_name);                             
   RETURN v_visit;                                                              
END Sf_Get_Visit;                                                               
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."ANALYSIS_PLUGIN_PK" ON "I2B2DEMODATA"."QT_
ANALYSIS_PLUGIN" ("PLUGIN_ID")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."VISIT_DIM_PK" ON "I2B2DEMODATA"."VISIT_DIM
ENSION" ("PATIENT_NUM", "ENCOUNTER_NUM")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."VISITDIM_STD_EDD_IDX" ON "I2B2DEMODATA"."VISIT_DI
MENSION" ("START_DATE", "END_DATE")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."VISITDIM_EN_PN_LP_IO_SD_IDX" ON "I2B2DEMODATA"."V
ISIT_DIMENSION" ("ENCOUNTER_NUM", "PATIENT_NUM", "LOCATION_PATH", "INOUT_CD", "S
TART_DATE")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."VD_UPLOADID_IDX" ON "I2B2DEMODATA"."VISIT_DIMENSI
ON" ("UPLOAD_ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."TIMERS_PK" ON "I2B2DEMODATA"."TIMERS" ("TI
MERID", "TARGETID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0021237" ON "I2B2DEMODATA"."QT_PDO_QU
ERY_MASTER" ("QUERY_MASTER_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0021219" ON "I2B2DEMODATA"."QT_QUERY_
MASTER" ("QUERY_MASTER_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0021217" ON "I2B2DEMODATA"."JMS_MESSA
GES" ("MESSAGEID", "DESTINATION")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."SYS_C0021215" ON "I2B2DEMODATA"."ASYNC_JOB
" ("ID")                                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."QT_PAT_SET_COLL_PFZ2" ON "I2B2DEMODATA"."QT_PATIE
NT_SET_COLLECTION" ("PATIENT_NUM")                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."QT_PAT_SET_COLL_PFZ1" ON "I2B2DEMODATA"."QT_PATIE
NT_SET_COLLECTION" ("RESULT_INSTANCE_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."QT_IDX_QM_UGID" ON "I2B2DEMODATA"."QT_QUERY_MASTE
R" ("USER_ID", "GROUP_ID", "MASTER_TYPE_CD")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."QT_IDX_PQM_UGID" ON "I2B2DEMODATA"."QT_PDO_QUERY_
MASTER" ("USER_ID", "GROUP_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."QT_APNAMEVERGRP_IDX" ON "I2B2DEMODATA"."QT_ANALYS
IS_PLUGIN" ("PLUGIN_NAME", "VERSION_CD", "GROUP_ID")                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."PROVIDER_DIMENSION_PK" ON "I2B2DEMODATA"."
PROVIDER_DIMENSION" ("PROVIDER_PATH", "PROVIDER_ID")                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."PROD_UPLOADID_IDX" ON "I2B2DEMODATA"."PROVIDER_DI
MENSION" ("UPLOAD_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."PD_IDX_NAME_CHAR" ON "I2B2DEMODATA"."PROVIDER_DIM
ENSION" ("PROVIDER_ID", "NAME_CHAR")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."PD_IDX_ALLPATIENTDIM" ON "I2B2DEMODATA"."PATIENT_
DIMENSION" ("PATIENT_NUM", "VITAL_STATUS_CD", "BIRTH_DATE", "DEATH_DATE", "SEX_C
D", "AGE_IN_YEARS_NUM", "LANGUAGE_CD", "RACE_CD", "MARITAL_STATUS_CD", "RELIGION
_CD", "ZIP_CD", "INCOME_CD")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."OB_FACT_PK" ON "I2B2DEMODATA"."OBSERVATION
_FACT" ("ENCOUNTER_NUM", "PATIENT_NUM", "CONCEPT_CD", "PROVIDER_ID", "START_DATE
", "MODIFIER_CD")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 27262976 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."JMS_MESSAGES_TXOP_TXID" ON "I2B2DEMODATA"."JMS_ME
SSAGES" ("TXOP", "TXID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."JMS_MESSAGES_DESTINATION" ON "I2B2DEMODATA"."JMS_
MESSAGES" ("DESTINATION")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."IDX_OB_FACT_3" ON "I2B2DEMODATA"."OBSERVATION_FAC
T" ("MODIFIER_CD")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."IDX_OB_FACT_2" ON "I2B2DEMODATA"."OBSERVATION_FAC
T" ("CONCEPT_CD", "PATIENT_NUM", "ENCOUNTER_NUM")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."IDX_OB_FACT_1" ON "I2B2DEMODATA"."OBSERVATION_FAC
T" ("CONCEPT_CD")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."IDX_CONCEPT_DIM_2" ON "I2B2DEMODATA"."CONCEPT_DIM
ENSION" ("CONCEPT_PATH")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 10485760 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."IDX_CONCEPT_DIM_1" ON "I2B2DEMODATA"."CONCEPT_DIM
ENSION" ("CONCEPT_CD")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."CODE_LOOKUP_PK" ON "I2B2DEMODATA"."CODE_LO
OKUP" ("TABLE_CD", "COLUMN_CD", "CODE_CD")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."CL_IDX_UPLOADID" ON "I2B2DEMODATA"."CODE_LOOKUP" 
("UPLOAD_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "I2B2DEMODATA"."CL_IDX_NAME_CHAR" ON "I2B2DEMODATA"."CODE_LOOKUP"
 ("NAME_CHAR")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "I2B2DEMODATA"."ANALYSIS_PLUGIN_RESULT_PK" ON "I2B2DEMODAT
A"."QT_ANALYSIS_PLUGIN_RESULT_TYPE" ("PLUGIN_ID", "RESULT_TYPE_ID")             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_CONCEPT_TABLE" (tempCo
nceptTableName IN VARCHAR,                                                      
  errorMsg OUT VARCHAR)                                                         
IS                                                                              
                                                                                
BEGIN                                                                           
execute immediate 'create table ' ||  tempConceptTableName || ' (               
        CONCEPT_CD VARCHAR2(50) NOT NULL,                                       
	CONCEPT_PATH VARCHAR2(900) NOT NULL ,                                          
	NAME_CHAR VARCHAR2(2000),                                                      
	CONCEPT_BLOB CLOB,                                                             
	UPDATE_DATE date,                                                              
	DOWNLOAD_DATE DATE,                                                            
	IMPORT_DATE DATE,                                                              
	SOURCESYSTEM_CD VARCHAR2(50)                                                   
	 )';                                                                           
                                                                                
 execute immediate 'CREATE INDEX idx_' || tempConceptTableName || '_pat_id ON ' 
|| tempConceptTableName || '  (CONCEPT_PATH)';                                  
                                                                                
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."UTIL_GRANT_ALL"                   
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."UPDATE_OBSERVATION_FACT" (upload_t
emptable_name IN VARCHAR, upload_id IN NUMBER, appendFlag IN NUMBER,            
   errorMsg OUT VARCHAR)                                                        
IS                                                                              
BEGIN                                                                           
                                                                                
                                                                                
                                                                                
--Delete duplicate records(encounter_ide,patient_ide,concept_cd,start_date,modif
ier_cd,provider_id)                                                             
execute immediate 'DELETE FROM ' || upload_temptable_name ||'  t1               
  where rowid > (select min(rowid) from ' || upload_temptable_name ||' t2       
    where t1.encounter_id = t2.encounter_id                                     
          and                                                                   
          t1.encounter_id_source = t2.encounter_id_source                       
          and                                                                   
          t1.patient_id = t2.patient_id                                         
          and                                                                   
          t1.patient_id_source = t2.patient_id_source                           
          and                                                                   
          t1.concept_cd = t2.concept_cd                                         
          and                                                                   
          t1.start_date = t2.start_date                                         
          and                                                                   
          nvl(t1.modifier_cd,''xyz'') = nvl(t2.modifier_cd,''xyz'')             
		  and                                                                         
		  t1.instance_num = t2.instance_num                                           
          and                                                                   
          t1.provider_id = t2.provider_id)';                                    
                                                                                
                                                                                
--Delete records having null in start_date                                      
execute immediate 'DELETE FROM ' || upload_temptable_name ||'  t1               
 where t1.start_date is null';                                                  
                                                                                
                                                                                
--One time lookup on encounter_ide to get encounter_num                         
execute immediate 'UPDATE ' ||  upload_temptable_name                           
 || ' SET encounter_num = (SELECT em.encounter_num                              
		     FROM encounter_mapping em                                                
		     WHERE em.encounter_ide = ' || upload_temptable_name||'.encounter_id      
                     and em.encounter_ide_source = '|| upload_temptable_name||'.
encounter_id_source                                                             
	 	    )                                                                        
WHERE EXISTS (SELECT em.encounter_num                                           
		     FROM encounter_mapping em                                                
		     WHERE em.encounter_ide = '|| upload_temptable_name||'.encounter_id       
                     and em.encounter_ide_source = '||upload_temptable_name||'.e
ncounter_id_source)';		                                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
--One time lookup on patient_ide to get patient_num                             
execute immediate 'UPDATE ' ||  upload_temptable_name                           
 || ' SET patient_num = (SELECT pm.patient_num                                  
		     FROM patient_mapping pm                                                  
		     WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id           
                     and pm.patient_ide_source = '|| upload_temptable_name||'.pa
tient_id_source                                                                 
	 	    )                                                                        
WHERE EXISTS (SELECT pm.patient_num                                             
		     FROM patient_mapping pm                                                  
		     WHERE pm.patient_ide = '|| upload_temptable_name||'.patient_id           
                     and pm.patient_ide_source = '||upload_temptable_name||'.pat
ient_id_source)';		                                                             
                                                                                
                                                                                
                                                                                
IF (appendFlag = 0) THEN                                                        
--Archive records which are to be deleted in observation_fact table             
execute immediate 'INSERT ALL INTO  archive_observation_fact                    
		SELECT obsfact.*, ' || upload_id ||' archive_upload_id                        
		FROM observation_fact obsfact                                                 
		WHERE obsfact.encounter_num IN                                                
			(SELECT temp_obsfact.encounter_num                                           
			FROM  ' ||upload_temptable_name ||' temp_obsfact                             
                        group by temp_obsfact.encounter_num                     
            )';                                                                 
                                                                                
                                                                                
--Delete above archived row from observation_fact                               
execute immediate 'DELETE  observation_fact                                     
					WHERE EXISTS (                                                             
					SELECT archive.encounter_num                                               
					FROM archive_observation_fact  archive                                     
					where archive.archive_upload_id = '||upload_id ||'                         
                                         AND archive.encounter_num=observation_f
act.encounter_num                                                               
										 AND archive.concept_cd = observation_fact.concept_cd                 
										 AND archive.start_date = observation_fact.start_date                 
                    )';                                                         
END IF;                                                                         
                                                                                
-- if the append is true, then do the update else do insert all                 
IF (appendFlag = 0) THEN                                                        
                                                                                
--Transfer all rows from temp_obsfact to observation_fact                       
execute immediate 'INSERT ALL INTO observation_fact(encounter_num,concept_cd, pa
tient_num,provider_id, start_date,modifier_cd,instance_num,valtype_cd,tval_char,
nval_num,valueflag_cd,                                                          
quantity_num,confidence_num,observation_blob,units_cd,end_date,location_cd, upda
te_date,download_date,import_date,sourcesystem_cd,                              
upload_id)                                                                      
SELECT encounter_num,concept_cd, patient_num,provider_id, start_date,modifier_cd
,instance_num,valtype_cd,tval_char,nval_num,valueflag_cd,                       
quantity_num,confidence_num,observation_blob,units_cd,end_date,location_cd, upda
te_date,download_date,sysdate import_date,sourcesystem_cd,                      
temp.upload_id                                                                  
FROM ' || upload_temptable_name ||' temp                                        
where temp.patient_num is not null and  temp.encounter_num is not null';        
                                                                                
ELSE                                                                            
execute immediate '  MERGE INTO observation_fact                                
USING ' || upload_temptable_name ||' temp                                       
ON (temp.encounter_num = observation_fact.encounter_num                         
				    and temp.patient_num = observation_fact.patient_num                     
                                    and temp.concept_cd = observation_fact.conce
pt_cd                                                                           
					and temp.start_date = observation_fact.start_date                          
		            and temp.provider_id = observation_fact.provider_id               
			 		and temp.modifier_cd = observation_fact.modifier_cd                       
					and temp.instance_num = observation_fact.instance_num                      
					)                                                                          
  when matched then                                                             
  update set valtype_cd = temp.valtype_cd ,                                     
    tval_char=temp.tval_char,                                                   
    nval_num = temp.nval_num,                                                   
    valueflag_cd=temp.valueflag_cd,                                             
    quantity_num=temp.quantity_num,                                             
	confidence_num=temp.confidence_num,                                            
	observation_blob =temp.observation_blob,                                       
	units_cd=temp.units_cd,                                                        
	end_date=temp.end_date,                                                        
	location_cd =temp.location_cd,                                                 
	update_date=temp.update_date ,                                                 
	download_date =temp.download_date,                                             
	import_date=temp.import_date,                                                  
	sourcesystem_cd =temp.sourcesystem_cd,                                         
	upload_id = temp.upload_id                                                     
    where nvl(observation_fact.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY
''))<= nvl(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY''))           
     when not matched then                                                      
			 	insert (encounter_num,                                                     
					concept_cd,                                                                
		 			patient_num,                                                              
		 			provider_id,                                                              
 					start_date,                                                               
		 			modifier_cd,                                                              
					instance_num,                                                              
 					valtype_cd,                                                               
		 			tval_char,                                                                
 					nval_num,                                                                 
		 			valueflag_cd,                                                             
 					quantity_num,                                                             
		 			confidence_num,                                                           
 					observation_blob,                                                         
		 			units_cd,                                                                 
 					end_date,                                                                 
		 			location_cd,                                                              
 					update_date,                                                              
		 			download_date,                                                            
 					import_date,                                                              
		 			sourcesystem_cd,                                                          
 					upload_id)                                                                
			 	values (                                                                   
 					temp.encounter_num,                                                       
		 			temp.concept_cd,                                                          
		 			temp.patient_num,                                                         
 					temp.provider_id,                                                         
		 			temp.start_date,                                                          
 					temp.modifier_cd,                                                         
					temp.instance_num,                                                         
		 			temp.valtype_cd,                                                          
 					temp.tval_char,                                                           
		 			temp.nval_num,                                                            
		 			temp.valueflag_cd,                                                        
		 			temp.quantity_num,                                                        
 					temp.confidence_num,                                                      
		 			temp.observation_blob,                                                    
		 			temp.units_cd,                                                            
		 			temp.end_date,                                                            
		 			temp.location_cd,                                                         
		 			temp.update_date,                                                         
		 			temp.download_date,                                                       
		 			temp.import_date,                                                         
 					temp.sourcesystem_cd,                                                     
		 			temp.upload_id                                                            
 				) where temp.patient_num is not null and  temp.encounter_num is not null'; 
                                                                                
END IF;                                                                         
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SYNC_CLEAR_PROVIDER_TABLE" (tempPr
oviderTableName in VARCHAR, backupProviderTableName IN VARCHAR, uploadId in NUMB
ER, errorMsg OUT VARCHAR )                                                      
IS                                                                              
                                                                                
interProviderTableName  varchar2(400);                                          
                                                                                
BEGIN                                                                           
	interProviderTableName := backupProviderTableName || '_inter';                 
	                                                                               
		--Delete duplicate rows with same encounter and patient combination           
	execute immediate 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE rowid >
                                                                                
					   (SELECT  min(rowid) FROM ' || tempProviderTableName || ' t2             
					     WHERE t1.provider_id = t2.provider_id                                 
                                            AND t1.provider_path = t2.provider_p
ath                                                                             
                                            )';                                 
                                                                                
    execute immediate 'create table ' ||  interProviderTableName || ' (         
    PROVIDER_ID         VARCHAR2(50) NOT NULL,                                  
	PROVIDER_PATH       VARCHAR2(700) NOT NULL,                                    
	NAME_CHAR       	VARCHAR2(850) NULL,                                           
	PROVIDER_BLOB       CLOB NULL,                                                 
	UPDATE_DATE     	DATE NULL,                                                    
	DOWNLOAD_DATE       DATE NULL,                                                 
	IMPORT_DATE         DATE NULL,                                                 
	SOURCESYSTEM_CD     VARCHAR2(50) NULL,                                         
	UPLOAD_ID        	NUMBER(38,0) NULL ,                                          
    CONSTRAINT  ' || interProviderTableName || '_pk PRIMARY KEY(PROVIDER_PATH,pr
ovider_id)                                                                      
	 )';                                                                           
                                                                                
    --Create new patient(patient_mapping) if temp table patient_ide does not exi
sts                                                                             
	-- in patient_mapping table.                                                   
	execute immediate 'insert into ' ||  interProviderTableName || ' (provider_id,p
rovider_path,name_char,provider_blob,update_date,download_date,import_date,sourc
esystem_cd,upload_id)                                                           
			    select  provider_id,provider_path,                                       
                        name_char,provider_blob,                                
                        update_date,download_date,                              
                        sysdate,sourcesystem_cd, ' || uploadId || '             
	                     from ' || tempProviderTableName || '  temp ';             
					                                                                           
	--backup the concept_dimension table before creating a new one                 
	execute immediate 'alter table provider_dimension rename to ' || backupProvider
TableName  ||'' ;                                                               
                                                                                
	-- add index on provider_id, name_char                                         
    execute immediate 'CREATE INDEX ' || interProviderTableName || '_id_idx ON '
 || interProviderTableName  || '(Provider_Id,name_char)';                       
    execute immediate 'CREATE INDEX ' || interProviderTableName || '_uid_idx ON 
' || interProviderTableName  || '(UPLOAD_ID)';                                  
                                                                                
	--backup the concept_dimension table before creating a new one                 
	execute immediate 'alter table ' || interProviderTableName  || ' rename to prov
ider_dimension' ;                                                               
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SYNC_CLEAR_MODIFIER_TABLE" (tempMo
difierTableName in VARCHAR, backupModifierTableName IN VARCHAR, uploadId in NUMB
ER, errorMsg OUT VARCHAR )                                                      
IS                                                                              
                                                                                
interModifierTableName  varchar2(400);                                          
                                                                                
BEGIN                                                                           
	interModifierTableName := backupModifierTableName || '_inter';                 
	                                                                               
	--Delete duplicate rows with same modifier_path and modifier cd                
	execute immediate 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE rowid >
                                                                                
					   (SELECT  min(rowid) FROM ' || tempModifierTableName || ' t2             
					     WHERE t1.modifier_cd = t2.modifier_cd                                 
                                            AND t1.modifier_path = t2.modifier_p
ath                                                                             
                                            )';                                 
                                                                                
    execute immediate 'create table ' ||  interModifierTableName || ' (         
        MODIFIER_CD          VARCHAR2(50) NOT NULL,                             
	MODIFIER_PATH    	VARCHAR2(700) NOT NULL,                                      
	NAME_CHAR       	VARCHAR2(2000) NULL,                                          
	MODIFIER_BLOB        CLOB NULL,                                                
	UPDATE_DATE         DATE NULL,                                                 
	DOWNLOAD_DATE       DATE NULL,                                                 
	IMPORT_DATE         DATE NULL,                                                 
	SOURCESYSTEM_CD     VARCHAR2(50) NULL,                                         
	UPLOAD_ID       	NUMBER(38,0) NULL,                                            
    CONSTRAINT '|| interModifierTableName ||'_pk  PRIMARY KEY(MODIFIER_PATH)    
	 )';                                                                           
                                                                                
    --Create new patient(patient_mapping) if temp table patient_ide does not exi
sts                                                                             
	-- in patient_mapping table.                                                   
	execute immediate 'insert into '|| interModifierTableName ||'  (modifier_cd,mod
ifier_path,name_char,modifier_blob,update_date,download_date,import_date,sources
ystem_cd,upload_id)                                                             
			    select  modifier_cd, substr(modifier_path,1,700),                        
                        name_char,modifier_blob,                                
                        update_date,download_date,                              
                        sysdate,sourcesystem_cd,                                
                         ' || uploadId || '  from ' || tempModifierTableName || 
'  temp ';                                                                      
	--backup the modifier_dimension table before creating a new one                
	execute immediate 'alter table modifier_dimension rename to ' || backupModifier
TableName  ||'' ;                                                               
                                                                                
	-- add index on upload_id                                                      
    execute immediate 'CREATE INDEX ' || interModifierTableName || '_uid_idx ON 
' || interModifierTableName || '(UPLOAD_ID)';                                   
                                                                                
    -- add index on upload_id                                                   
    execute immediate 'CREATE INDEX ' || interModifierTableName || '_cd_idx ON '
 || interModifierTableName || '(modifier_cd)';                                  
                                                                                
                                                                                
       --backup the modifier_dimension table before creating a new one          
	execute immediate 'alter table ' || interModifierTableName  || ' rename to modi
fier_dimension' ;                                                               
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SYNC_CLEAR_CONCEPT_TABLE" (tempCon
ceptTableName in VARCHAR, backupConceptTableName IN VARCHAR, uploadId in NUMBER,
 errorMsg OUT VARCHAR )                                                         
IS                                                                              
                                                                                
interConceptTableName  varchar2(400);                                           
                                                                                
BEGIN                                                                           
	interConceptTableName := backupConceptTableName || '_inter';                   
	                                                                               
		--Delete duplicate rows with same encounter and patient combination           
	execute immediate 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE rowid > 
                                                                                
					   (SELECT  min(rowid) FROM ' || tempConceptTableName || ' t2              
					     WHERE t1.concept_cd = t2.concept_cd                                   
                                            AND t1.concept_path = t2.concept_pat
h                                                                               
                                            )';                                 
                                                                                
    execute immediate 'create table ' ||  interConceptTableName || ' (          
    CONCEPT_CD          VARCHAR2(50) NOT NULL,                                  
	CONCEPT_PATH    	VARCHAR2(700) NOT NULL,                                       
	NAME_CHAR       	VARCHAR2(2000) NULL,                                          
	CONCEPT_BLOB        CLOB NULL,                                                 
	UPDATE_DATE         DATE NULL,                                                 
	DOWNLOAD_DATE       DATE NULL,                                                 
	IMPORT_DATE         DATE NULL,                                                 
	SOURCESYSTEM_CD     VARCHAR2(50) NULL,                                         
	UPLOAD_ID       	NUMBER(38,0) NULL,                                            
    CONSTRAINT '|| interConceptTableName ||'_pk  PRIMARY KEY(CONCEPT_PATH)      
	 )';                                                                           
                                                                                
    --Create new patient(patient_mapping) if temp table patient_ide does not exi
sts                                                                             
	-- in patient_mapping table.                                                   
	execute immediate 'insert into '|| interConceptTableName ||'  (concept_cd,conce
pt_path,name_char,concept_blob,update_date,download_date,import_date,sourcesyste
m_cd,upload_id)                                                                 
			    select  concept_cd, substr(concept_path,1,700),                          
                        name_char,concept_blob,                                 
                        update_date,download_date,                              
                        sysdate,sourcesystem_cd,                                
                         ' || uploadId || '  from ' || tempConceptTableName || '
  temp ';                                                                       
	--backup the concept_dimension table before creating a new one                 
	execute immediate 'alter table concept_dimension rename to ' || backupConceptTa
bleName  ||'' ;                                                                 
                                                                                
	-- add index on upload_id                                                      
    execute immediate 'CREATE INDEX ' || interConceptTableName || '_uid_idx ON '
 || interConceptTableName || '(UPLOAD_ID)';                                     
                                                                                
    -- add index on upload_id                                                   
    execute immediate 'CREATE INDEX ' || interConceptTableName || '_cd_idx ON ' 
|| interConceptTableName || '(concept_cd)';                                     
                                                                                
                                                                                
    --backup the concept_dimension table before creating a new one              
	execute immediate 'alter table ' || interConceptTableName  || ' rename to conce
pt_dimension' ;                                                                 
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SP_XTAB" (v_variable IN varchar2, 
                                    v_protocol IN number,                       
                                    v_subject  IN varchar2) IS                  
                                                                                
/****************************************************************************** 
   NAME:       sf_xtab                                                          
   PURPOSE:    This function serves to flatten the SAS to Oracle Conversion via 
               the SLM Process.                                                 
                                                                                
   REVISIONS:                                                                   
   Ver        Date        Author           Description                          
   ---------  ----------  ---------------  ------------------------------------ 
   1.0        5/14/2009   George Kuebrich                                       
                                                                                
   NOTES:                                                                       
                                                                                
   Automatically available Auto Replace Keywords:                               
      Object Name:     sf_xtab                                                  
      Sysdate:         5/14/2009                                                
      Date and Time:   5/14/2009, 8:33:45 AM, and 5/14/2009 8:33:45 AM          
      Username:         (set in TOAD Options, Procedure Editor)                 
      Table Name:       (set in the "New PL/SQL Object" dialog)                 
                                                                                
******************************************************************************/ 
sql_stmt varchar2(4000);                                                        
BEGIN                                                                           
   --tmpVar := null;                                                            
   sql_stmt := 'select distinct value into tmpVar                               
     from sideshow_eav a,                                                       
          protocol b,                                                           
          variable c                                                            
    where a.protocol_id=b.protocol_id                                           
      and a.protocol_id=c.protocol_id                                           
      and a.protocol_id='||v_protocol||                                         
    ' and a.variable_id=c.variable_id                                           
      and a.subject_id='||v_subject||                                           
    ' and c.variable_name in ('''||v_variable||''')';                           
                                                                                
   DBMS_OUTPUT.PUT_LINE(SQL_STMT);                                              
                                                                                
   --RETURN tmpVar;                                                             
   EXCEPTION                                                                    
     WHEN NO_DATA_FOUND THEN                                                    
       NULL;                                                                    
     WHEN OTHERS THEN                                                           
       -- Consider logging the error and then re-raise                          
       RAISE;                                                                   
END sp_xtab;                                                                    
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."SETONT" (sourcevar varchar2) as be
gin delete from i2b2metadata.i2b2 where sourcesystem_cd=sourcevar;  insert into 
i2b2metadata.i2b2 select C_HLEVEL, C_FULLNAME, C_NAME, C_SYNONYM_CD, C_VISUALATT
RIBUTES, C_TOTALNUM, C_BASECODE , C_METADATAXML , C_FACTTABLECOLUMN , C_TABLENAM
E , C_COLUMNNAME , C_COLUMNDATATYPE ,C_OPERATOR , C_DIMCODE, C_COMMENT , C_TOOLT
IP , UPDATE_DATE , DOWNLOAD_DATE , IMPORT_DATE , SOURCESYSTEM_CD, VALUETYPE_CD f
rom dimloader;   delete from concept_dimension where sourcesystem_cd = sourcevar
; insert into concept_dimension (    CONCEPT_CD, CONCEPT_PATH,  NAME_CHAR, CONCE
PT_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD,  TABLE_NAME) 
select  c_basecode,  c_fullname||'\', c_name, null, '8-oct-07','8-oct-07',	'8-oc
t-07',	sourcesystem_cd,'CONCEPT_DIMENSION' from i2b2metadata.i2b2 where sourcesy
stem_cd=sourcevar and c_basecode is not null;end;                               
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."REMOVE_TEMP_TABLE" (tempTableName 
VARCHAR)                                                                        
IS                                                                              
BEGIN                                                                           
	execute immediate 'drop table ' || tempTableName || ' cascade constraints';    
	                                                                               
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."PATIENT_SUBSET2" (                
  p_result_instance_id IN VARCHAR2,                                             
  p_pathway IN VARCHAR2,                                                        
  p_refcur  OUT SYS_REFCURSOR) AS                                               
                                                                                
BEGIN                                                                           
                                                                                
OPEN p_refcur FOR SELECT * FROM (WITH                                           
  patients AS (SELECT DISTINCT a.patient_num                                    
        FROM qt_patient_set_collection a,                                       
             qt_query_result_instance b,                                        
             qt_query_instance c,                                               
             qt_query_master d                                                  
        WHERE a.result_instance_id = b.result_instance_id AND                   
              b.query_instance_id = c.query_instance_id AND                     
              c.query_master_id = d.query_master_id AND                         
              b.result_instance_id = p_result_instance_id),                     
                                                                                
 samples AS  (SELECT a.concept_cd  FROM concept_dimension a WHERE a.concept_path
 IN (                                                                           
    SELECT SUBSTR(item_key,INSTR(item_key,'\',1,3)) FROM (                      
      SELECT extractValue(value(ik),'/item_key') item_key FROM (SELECT sys.xmlty
pe.createXML(a.i2b2_request_xml) col                                            
        FROM qt_query_master a,                                                 
             qt_query_instance b,                                               
             qt_query_result_instance c                                         
        WHERE a.query_master_id = b.query_master_id AND                         
              b.query_instance_id = c.query_instance_id AND                     
              c.result_instance_id = p_result_instance_id) tab1,                
              TABLE(xmlsequence(extract(col,'//ns4:request/query_definition/pane
l/item/item_key',                                                               
                                            'xmlns:ns4="http://www.i2b2.org/xsd/
cell/crc/psm/1.1/"'))) ik)))                                                    
                                                                                
  SELECT DISTINCT a.probeset, a.gene_symbol, a.refseq, a.log10_intensity, a.pval
ue, b.patient_uid, a.assay_id                                                   
      FROM i2b2_subject_assay_data a                                            
      JOIN i2b2_subject_sample_mapping b                                        
        ON a.patient_id = b.patient_id                                          
      JOIN i2b2_pathway_gene c                                                  
        ON a.gene_symbol = c.gene_symbol                                        
      JOIN i2b2_pathway d                                                       
        ON d.id = c.pathway_id                                                  
      WHERE d.name = p_pathway                                                  
        AND b.patient_uid IN (SELECT patient_num FROM patients)                 
        AND B.concept_code IN (CASE WHEN ( SELECT COUNT(*) FROM I2B2_SUBJECT_SAM
PLE_MAPPING                                                                     
                                       WHERE concept_code IN (SELECT concept_cd 
FROM samples))>0 THEN                                                           
                                         (SELECT concept_cd FROM samples)       
                                       ELSE                                     
                                         (SELECT concept_code FROM I2B2_SUBJECT_
SAMPLE_MAPPING)                                                                 
                                      END));                                    
END PATIENT_SUBSET2;                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PROVIDER_FROMTEMP" (tempPro
viderTableName IN VARCHAR, upload_id IN NUMBER,                                 
   errorMsg OUT VARCHAR)                                                        
                                                                                
IS                                                                              
                                                                                
BEGIN                                                                           
	--Delete duplicate rows with same encounter and patient combination            
	execute immediate 'DELETE FROM ' || tempProviderTableName || ' t1 WHERE rowid >
                                                                                
					   (SELECT  min(rowid) FROM ' || tempProviderTableName || ' t2             
					     WHERE t1.provider_id = t2.provider_id                                 
                                            AND t1.provider_path = t2.provider_p
ath                                                                             
                                            )';                                 
	                                                                               
	                                                                               
                                                                                
 execute immediate ' UPDATE provider_dimension  set  (provider_id,              
                        name_char,provider_blob,                                
                        update_date,download_date,                              
                        import_date,sourcesystem_cd,                            
			     	UPLOAD_ID) = (select temp.provider_id, temp.name_char,temp.provider_blo
b,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,             
			     	' || UPLOAD_ID  || ' from ' || tempProviderTableName || '  temp   where
                                                                                
					temp.provider_path = provider_dimension.provider_path and temp.update_date 
>= provider_dimension.update_date)                                              
					where exists (select 1 from ' || tempProviderTableName || ' temp  where tem
p.provider_path = provider_dimension.provider_path                              
					and temp.update_date >= provider_dimension.update_date) ';                 
                                                                                
                                                                                
    --Create new patient(patient_mapping) if temp table patient_ide does not exi
sts                                                                             
	-- in patient_mapping table.                                                   
	execute immediate 'insert into provider_dimension  (provider_id,provider_path,n
ame_char,provider_blob,update_date,download_date,import_date,sourcesystem_cd,upl
oad_id)                                                                         
			    select  provider_id,provider_path,                                       
                        name_char,provider_blob,                                
                        update_date,download_date,                              
                        sysdate,sourcesystem_cd, ' || upload_id || '            
	                                                                               
                         from ' || tempProviderTableName || '  temp             
					where not exists (select provider_id from provider_dimension pd where pd.pr
ovider_path = temp.provider_path )';                                            
	                                                                               
	                                                                               
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PID_MAP_FROMTEMP" (tempPidT
ableName IN VARCHAR,  upload_id IN NUMBER,                                      
   errorMsg OUT VARCHAR)                                                        
is                                                                              
 existingPatientNum varchar2(32);                                               
 maxPatientNum number;                                                          
                                                                                
 TYPE distinctPidCurTyp IS REF CURSOR;                                          
distinctPidCur   distinctPidCurTyp;                                             
 sql_stmt  varchar2(400);                                                       
                                                                                
disPatientId varchar2(100);                                                     
disPatientIdSource varchar2(100);                                               
                                                                                
BEGIN                                                                           
 sql_stmt := ' SELECT distinct patient_id,patient_id_source from ' || tempPidTab
leName ||' ';                                                                   
                                                                                
  --delete the data if they miss                                                
  execute immediate ' delete  from ' || tempPidTableName ||  ' t1  where        
rowid > (select min(rowid) from ' || tempPidTableName || ' t2                   
where t1.patient_map_id = t2.patient_map_id                                     
and t1.patient_map_id_source = t2.patient_map_id_source) ';                     
                                                                                
 LOCK TABLE  patient_mapping IN EXCLUSIVE MODE NOWAIT;                          
 select max(patient_num) into maxPatientNum from patient_mapping ;              
 -- set max patient num to zero of the value is null                            
 if maxPatientNum is null then                                                  
  maxPatientNum := 0;                                                           
end if;                                                                         
                                                                                
  open distinctPidCur for sql_stmt ;                                            
                                                                                
   loop                                                                         
                                                                                
     FETCH distinctPidCur INTO disPatientId, disPatientIdSource;                
      EXIT WHEN distinctPidCur%NOTFOUND;                                        
        -- dbms_output.put_line(disPatientId);                                  
                                                                                
  if  disPatientIdSource = 'HIVE'  THEN                                         
   begin                                                                        
    --check if hive number exist, if so assign that number to reset of map_id's 
within that pid                                                                 
    select patient_num into existingPatientNum from patient_mapping where patien
t_num = disPatientId and patient_ide_source = 'HIVE';                           
    EXCEPTION                                                                   
       when NO_DATA_FOUND THEN                                                  
           existingPatientNum := null;                                          
    end;                                                                        
   if existingPatientNum is not null then                                       
        execute immediate ' update ' || tempPidTableName ||' set patient_num = p
atient_id, process_status_flag = ''P''                                          
        where patient_id = :x and not exists (select 1 from patient_mapping pm w
here pm.patient_ide = patient_map_id                                            
        and pm.patient_ide_source = patient_map_id_source)' using disPatientId; 
   else                                                                         
        -- generate new patient_num i.e. take max(patient_num) + 1              
        if maxPatientNum < disPatientId then                                    
            maxPatientNum := disPatientId;                                      
        end if ;                                                                
        execute immediate ' update ' || tempPidTableName ||' set patient_num = p
atient_id, process_status_flag = ''P'' where                                    
        patient_id = :x and patient_id_source = ''HIVE'' and not exists (select 
1 from patient_mapping pm where pm.patient_ide = patient_map_id                 
        and pm.patient_ide_source = patient_map_id_source)' using disPatientId; 
   end if;                                                                      
                                                                                
   -- test if record fectched                                                   
   -- dbms_output.put_line(' HIVE ');                                           
                                                                                
 else                                                                           
    begin                                                                       
       select patient_num into existingPatientNum from patient_mapping where pat
ient_ide = disPatientId and                                                     
        patient_ide_source = disPatientIdSource ;                               
                                                                                
       -- test if record fetched.                                               
       EXCEPTION                                                                
           WHEN NO_DATA_FOUND THEN                                              
           existingPatientNum := null;                                          
       end;                                                                     
       if existingPatientNum is not null then                                   
            execute immediate ' update ' || tempPidTableName ||' set patient_num
 = :x , process_status_flag = ''P''                                             
            where patient_id = :y and not exists (select 1 from patient_mapping 
pm where pm.patient_ide = patient_map_id                                        
        and pm.patient_ide_source = patient_map_id_source)' using  existingPatie
ntNum,disPatientId;                                                             
       else                                                                     
                                                                                
            maxPatientNum := maxPatientNum + 1 ;                                
             execute immediate 'insert into ' || tempPidTableName ||' (patient_m
ap_id,patient_map_id_source,patient_id,patient_id_source,patient_num,process_sta
tus_flag                                                                        
             ,patient_map_id_status,update_date,download_date,import_date,source
system_cd)                                                                      
             values(:x,''HIVE'',:y,''HIVE'',:z,''P'',''A'',sysdate,sysdate,sysda
te,''edu.harvard.i2b2.crc'')' using maxPatientNum,maxPatientNum,maxPatientNum;  
            execute immediate 'update ' || tempPidTableName ||' set patient_num 
=  :x , process_status_flag = ''P''                                             
             where patient_id = :y and  not exists (select 1 from               
            patient_mapping pm where pm.patient_ide = patient_map_id            
            and pm.patient_ide_source = patient_map_id_source)' using maxPatient
Num, disPatientId  ;                                                            
                                                                                
       end if ;                                                                 
                                                                                
      -- dbms_output.put_line(' NOT HIVE ');                                    
 end if;                                                                        
                                                                                
END LOOP;                                                                       
close distinctPidCur ;                                                          
commit;                                                                         
                                                                                
-- do the mapping update if the update date is old                              
   execute immediate ' merge into patient_mapping                               
      using ' || tempPidTableName ||' temp                                      
      on (temp.patient_map_id = patient_mapping.patient_IDE                     
  		  and temp.patient_map_id_source = patient_mapping.patient_IDE_SOURCE       
	   ) when matched then                                                         
  		update set patient_num = temp.patient_id,                                   
    	patient_ide_status	= temp.patient_map_id_status  ,                         
    	update_date = temp.update_date,                                            
    	download_date  = temp.download_date ,                                      
		import_date = sysdate ,                                                       
    	sourcesystem_cd  = temp.sourcesystem_cd ,                                  
		upload_id = ' || upload_id ||'                                                
    	where  temp.patient_id_source = ''HIVE'' and temp.process_status_flag is nu
ll  and                                                                         
        nvl(patient_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')
)<= nvl(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) ' ;          
                                                                                
-- insert new mapping records i.e flagged P                                     
execute immediate ' insert into patient_mapping (patient_ide,patient_ide_source,
patient_ide_status,patient_num,update_date,download_date,import_date,sourcesyste
m_cd,upload_id)                                                                 
    select patient_map_id,patient_map_id_source,patient_map_id_status,patient_nu
m,update_date,download_date,sysdate,sourcesystem_cd,' || upload_id ||' from '|| 
tempPidTableName || '                                                           
    where process_status_flag = ''P'' ' ;                                       
commit;                                                                         
EXCEPTION                                                                       
   WHEN OTHERS THEN                                                             
      if distinctPidCur%isopen then                                             
          close distinctPidCur;                                                 
      end if;                                                                   
      rollback;                                                                 
      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -
ERROR- '||SQLERRM);                                                             
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_PATIENT_MAP_FROMTEMP" (temp
PatientTableName IN VARCHAR,  upload_id IN NUMBER,                              
   errorMsg OUT VARCHAR )                                                       
IS                                                                              
                                                                                
BEGIN                                                                           
	                                                                               
	--Create new patient mapping entry for HIVE patient's if they are not already m
apped in mapping table                                                          
	execute immediate 'insert into patient_mapping (                               
		select distinct temp.patient_id, temp.patient_id_source,''A'',temp.patient_id 
,' || upload_id || '                                                            
		from ' || tempPatientTableName ||'  temp                                      
		where temp.patient_id_source = ''HIVE'' and                                   
   		not exists (select patient_ide from patient_mapping pm where pm.patient_num
 = temp.patient_id and pm.patient_ide_source = temp.patient_id_source)          
		)';                                                                           
                                                                                
    --Create new visit for above inserted encounter's                           
	--If Visit table's encounter and patient num does match temp table,            
	--then new visit information is created.                                       
	execute immediate 'MERGE  INTO patient_dimension pd                            
		   USING ( select case when (ptemp.patient_id_source=''HIVE'') then to_number(
ptemp.patient_id)                                                               
                                       else pmap.patient_num end patient_num,   
                                  ptemp.VITAL_STATUS_CD,                        
                                  ptemp.BIRTH_DATE,                             
                                  ptemp.DEATH_DATE,                             
                                  ptemp.SEX_CD ,                                
                                  ptemp.AGE_IN_YEARS_NUM,                       
                                  ptemp.LANGUAGE_CD,                            
                                  ptemp.RACE_CD,                                
                                  ptemp.MARITAL_STATUS_CD,                      
                                  ptemp.RELIGION_CD,                            
                                  ptemp.ZIP_CD,                                 
								  ptemp.STATECITYZIP_PATH ,                                             
								  ptemp.PATIENT_BLOB,                                                   
								  ptemp.UPDATE_DATE,                                                    
								  ptemp.DOWNLOAD_DATE,                                                  
								  ptemp.IMPORT_DATE,                                                    
								  ptemp.SOURCESYSTEM_CD                                                 
								                                                                        
                   from ' || tempPatientTableName || '  ptemp , patient_mapping 
pmap                                                                            
                   where   ptemp.patient_id = pmap.patient_ide(+)               
                   and ptemp.patient_id_source = pmap.patient_ide_source(+)     
           ) temp                                                               
		   on (                                                                       
				pd.patient_num = temp.patient_num                                           
		    )                                                                         
			when matched then                                                            
			 	update  set                                                                
			 		pd.VITAL_STATUS_CD= temp.VITAL_STATUS_CD,                                 
                    pd.BIRTH_DATE= temp.BIRTH_DATE,                             
                    pd.DEATH_DATE= temp.DEATH_DATE,                             
                    pd.SEX_CD= temp.SEX_CD,                                     
                    pd.AGE_IN_YEARS_NUM=temp.AGE_IN_YEARS_NUM,                  
                    pd.LANGUAGE_CD=temp.LANGUAGE_CD,                            
                    pd.RACE_CD=temp.RACE_CD,                                    
                    pd.MARITAL_STATUS_CD=temp.MARITAL_STATUS_CD,                
                    pd.RELIGION_CD=temp.RELIGION_CD,                            
                    pd.ZIP_CD=temp.ZIP_CD,                                      
					pd.STATECITYZIP_PATH =temp.STATECITYZIP_PATH,                              
					pd.PATIENT_BLOB=temp.PATIENT_BLOB,                                         
					pd.UPDATE_DATE=temp.UPDATE_DATE,                                           
					pd.DOWNLOAD_DATE=temp.DOWNLOAD_DATE,                                       
					pd.SOURCESYSTEM_CD=temp.SOURCESYSTEM_CD,                                   
					pd.UPLOAD_ID = '||upload_id||'                                             
                    where temp.update_date > pd.update_date                     
			 when not matched then                                                       
			 	insert (                                                                   
					PATIENT_NUM,                                                               
					VITAL_STATUS_CD,                                                           
                    BIRTH_DATE,                                                 
                    DEATH_DATE,                                                 
                    SEX_CD,                                                     
                    AGE_IN_YEARS_NUM,                                           
                    LANGUAGE_CD,                                                
                    RACE_CD,                                                    
                    MARITAL_STATUS_CD,                                          
                    RELIGION_CD,                                                
                    ZIP_CD,                                                     
					STATECITYZIP_PATH,                                                         
					PATIENT_BLOB,                                                              
					UPDATE_DATE,                                                               
					DOWNLOAD_DATE,                                                             
					SOURCESYSTEM_CD,                                                           
					import_date,                                                               
	                upload_id                                                      
 					)                                                                         
			 	values (                                                                   
 					temp.PATIENT_NUM,                                                         
					temp.VITAL_STATUS_CD,                                                      
                    temp.BIRTH_DATE,                                            
                    temp.DEATH_DATE,                                            
                    temp.SEX_CD,                                                
                    temp.AGE_IN_YEARS_NUM,                                      
                    temp.LANGUAGE_CD,                                           
                    temp.RACE_CD,                                               
                    temp.MARITAL_STATUS_CD,                                     
                    temp.RELIGION_CD,                                           
                    temp.ZIP_CD,                                                
					temp.STATECITYZIP_PATH,                                                    
					temp.PATIENT_BLOB,                                                         
					temp.UPDATE_DATE,                                                          
					temp.DOWNLOAD_DATE,                                                        
					temp.SOURCESYSTEM_CD,                                                      
					sysdate,                                                                   
	     			'||upload_id||'                                                        
 				)';                                                                        
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_MODIFIER_FROMTEMP" (tempMod
ifierTableName IN VARCHAR, upload_id IN NUMBER, errorMsg OUT VARCHAR )          
IS                                                                              
                                                                                
BEGIN                                                                           
	--Delete duplicate rows                                                        
	execute immediate 'DELETE FROM ' || tempModifierTableName || ' t1 WHERE rowid >
                                                                                
					   (SELECT  min(rowid) FROM ' || tempModifierTableName || ' t2             
					     WHERE t1.modifier_cd = t2.modifier_cd                                 
                                            AND t1.modifier_path = t2.modifier_p
ath                                                                             
                                            )';                                 
	                                                                               
	   execute immediate ' UPDATE modifier_dimension  set  (modifier_cd,           
                        name_char,modifier_blob,                                
                        update_date,download_date,                              
                        import_date,sourcesystem_cd,                            
			     	UPLOAD_ID) = (select temp.modifier_cd, temp.name_char,temp.modifier_blo
b,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,             
			     	' || UPLOAD_ID  || ' from ' || tempModifierTableName || '  temp   where
                                                                                
					temp.modifier_path = modifier_dimension.modifier_path and temp.update_date 
>= modifier_dimension.update_date)                                              
					where exists (select 1 from ' || tempModifierTableName || ' temp  where tem
p.modifier_path = modifier_dimension.modifier_path                              
					and temp.update_date >= modifier_dimension.update_date) ';                 
                                                                                
                                                                                
                                                                                
                                                                                
    --Create new modifier if temp table modifier_path does not exists           
	-- in modifier dimension table.                                                
	execute immediate 'insert into modifier_dimension  (modifier_cd,modifier_path,n
ame_char,modifier_blob,update_date,download_date,import_date,sourcesystem_cd,upl
oad_id)                                                                         
			    select  modifier_cd, modifier_path,                                      
                        name_char,modifier_blob,                                
                        update_date,download_date,                              
                        sysdate,sourcesystem_cd,                                
                         ' || upload_id || '  from ' || tempModifierTableName ||
 '  temp                                                                        
					where not exists (select modifier_cd from modifier_dimension cd where cd.mo
difier_path = temp.modifier_path)                                               
					                                                                           
	';                                                                             
	                                                                               
	                                                                               
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_ENCOUNTERVISIT_FROMTEMP" (t
empTableName IN VARCHAR, upload_id IN NUMBER,                                   
  errorMsg OUT VARCHAR)                                                         
IS                                                                              
maxEncounterNum number;                                                         
BEGIN                                                                           
                                                                                
     --Delete duplicate rows with same encounter and patient combination        
	execute immediate 'DELETE FROM ' || tempTableName || ' t1 WHERE rowid >        
					   (SELECT  min(rowid) FROM ' || tempTableName || ' t2                     
					     WHERE t1.encounter_id = t2.encounter_id                               
                                            AND t1.encounter_id_source = t2.enco
unter_id_source                                                                 
                                            AND nvl(t1.patient_id,'''') = nvl(t2
.patient_id,'''')                                                               
                                            AND nvl(t1.patient_id_source,'''') =
 nvl(t2.patient_id_source,''''))';                                              
                                                                                
	 LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;                       
    -- select max(encounter_num) into maxEncounterNum from encounter_mapping ;  
                                                                                
	 --Create new patient(patient_mapping) if temp table patient_ide does not exist
s                                                                               
	-- in patient_mapping table.                                                   
     execute immediate ' insert into encounter_mapping (encounter_ide,encounter_
ide_source,encounter_num,patient_ide,patient_ide_source,encounter_ide_status, up
load_id)                                                                        
     	(select distinctTemp.encounter_id, distinctTemp.encounter_id_source, disti
nctTemp.encounter_id,  distinctTemp.patient_id,distinctTemp.patient_id_source,''
A'',  '|| upload_id ||'                                                         
				from                                                                        
					(select distinct encounter_id, encounter_id_source,patient_id,patient_id_so
urce from ' || tempTableName || '  temp                                         
					where                                                                      
				     not exists (select encounter_ide from encounter_mapping em where em.enc
ounter_ide = temp.encounter_id and em.encounter_ide_source = temp.encounter_id_s
ource)                                                                          
					 and encounter_id_source = ''HIVE'' )   distinctTemp) ' ;                  
                                                                                
	                                                                               
	                                                                               
	-- update patient_num for temp table                                           
execute immediate ' UPDATE ' ||  tempTableName                                  
 || ' SET encounter_num = (SELECT em.encounter_num                              
		     FROM encounter_mapping em                                                
		     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id              
                     and em.encounter_ide_source = '|| tempTableName ||'.encount
er_id_source                                                                    
					 and nvl(em.patient_ide_source,'''') = nvl('|| tempTableName ||'.patient_id
_source,'''')                                                                   
				     and nvl(em.patient_ide,'''')= nvl('|| tempTableName ||'.patient_id,''''
)                                                                               
	 	    )                                                                        
WHERE EXISTS (SELECT em.encounter_num                                           
		     FROM encounter_mapping em                                                
		     WHERE em.encounter_ide = '|| tempTableName ||'.encounter_id              
                     and em.encounter_ide_source = '||tempTableName||'.encounter
_id_source                                                                      
					 and nvl(em.patient_ide_source,'''') = nvl('|| tempTableName ||'.patient_id
_source,'''')                                                                   
				     and nvl(em.patient_ide,'''')= nvl('|| tempTableName ||'.patient_id,''''
))';	                                                                           
                                                                                
	 execute immediate ' UPDATE visit_dimension  set  (	START_DATE,END_DATE,INOUT_C
D,LOCATION_CD,VISIT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPORT_DATE,SOURCESYSTEM_CD, 
UPLOAD_ID )                                                                     
			= (select temp.START_DATE,temp.END_DATE,temp.INOUT_CD,temp.LOCATION_CD,temp.V
ISIT_BLOB,temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,     
			     	' || UPLOAD_ID  || ' from ' || tempTableName || '  temp   where        
					temp.encounter_num = visit_dimension.encounter_num and temp.update_date >= 
visit_dimension.update_date)                                                    
					where exists (select 1 from ' || tempTableName || ' temp  where temp.encoun
ter_num = visit_dimension.encounter_num                                         
					and temp.update_date >= visit_dimension.update_date) ';                    
                                                                                
   execute immediate 'insert into visit_dimension  (encounter_num,patient_num,ST
ART_DATE,END_DATE,INOUT_CD,LOCATION_CD,VISIT_BLOB,UPDATE_DATE,DOWNLOAD_DATE,IMPO
RT_DATE,SOURCESYSTEM_CD, UPLOAD_ID)                                             
	               select temp.encounter_num, pm.patient_num,                      
					temp.START_DATE,temp.END_DATE,temp.INOUT_CD,temp.LOCATION_CD,temp.VISIT_BLO
B,                                                                              
					temp.update_date,                                                          
					temp.download_date,                                                        
					sysdate, -- import date                                                    
					temp.sourcesystem_cd,                                                      
		            '|| upload_id ||'                                                 
			from                                                                         
				' || tempTableName || '  temp , patient_mapping pm                          
			where                                                                        
                 temp.encounter_num is not null and                             
		      	 not exists (select encounter_num from visit_dimension vd where vd.enco
unter_num = temp.encounter_num) and                                             
				 pm.patient_ide = temp.patient_id and pm.patient_ide_source = temp.patient_i
d_source                                                                        
	 ';                                                                            
commit;                                                                         
		                                                                              
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		rollback;                                                                     
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_EID_MAP_FROMTEMP" (tempEidT
ableName IN VARCHAR,  upload_id IN NUMBER,                                      
   errorMsg OUT VARCHAR )                                                       
is                                                                              
 existingEncounterNum varchar2(32);                                             
 maxEncounterNum number;                                                        
                                                                                
 TYPE distinctEIdCurTyp IS REF CURSOR;                                          
distinctEidCur   distinctEIdCurTyp;                                             
 sql_stmt  varchar2(400);                                                       
                                                                                
disEncounterId varchar2(100);                                                   
disEncounterIdSource varchar2(100);                                             
                                                                                
BEGIN                                                                           
 sql_stmt := ' SELECT distinct encounter_id,encounter_id_source from ' || tempEi
dTableName ||' ';                                                               
                                                                                
  execute immediate ' delete  from ' || tempEidTableName ||  ' t1  where        
rowid > (select min(rowid) from ' || tempEidTableName || ' t2                   
where t1.encounter_map_id = t2.encounter_map_id                                 
and t1.encounter_map_id_source = t2.encounter_map_id_source                     
and t1.encounter_id = t2.encounter_id                                           
and t1.encounter_id_source = t2.encounter_id_source) ';                         
                                                                                
 LOCK TABLE  encounter_mapping IN EXCLUSIVE MODE NOWAIT;                        
 select max(encounter_num) into maxEncounterNum from encounter_mapping ;        
                                                                                
if maxEncounterNum is null then                                                 
  maxEncounterNum := 0;                                                         
end if;                                                                         
                                                                                
  open distinctEidCur for sql_stmt ;                                            
                                                                                
   loop                                                                         
     FETCH distinctEidCur INTO disEncounterId, disEncounterIdSource;            
      EXIT WHEN distinctEidCur%NOTFOUND;                                        
       -- dbms_output.put_line(disEncounterId);                                 
                                                                                
  if  disEncounterIdSource = 'HIVE'  THEN                                       
   begin                                                                        
    --check if hive number exist, if so assign that number to reset of map_id's 
within that pid                                                                 
    select encounter_num into existingEncounterNum from encounter_mapping where 
encounter_num = disEncounterId and encounter_ide_source = 'HIVE';               
    EXCEPTION                                                                   
       when NO_DATA_FOUND THEN                                                  
           existingEncounterNum := null;                                        
    end;                                                                        
   if existingEncounterNum is not null then                                     
        execute immediate ' update ' || tempEidTableName ||' set encounter_num =
 encounter_id, process_status_flag = ''P''                                      
        where encounter_id = :x and not exists (select 1 from encounter_mapping 
em where em.encounter_ide = encounter_map_id                                    
        and em.encounter_ide_source = encounter_map_id_source)' using disEncount
erId;                                                                           
	                                                                               
   else                                                                         
        -- generate new patient_num i.e. take max(_num) + 1                     
        if maxEncounterNum < disEncounterId then                                
            maxEncounterNum := disEncounterId;                                  
        end if ;                                                                
        execute immediate ' update ' || tempEidTableName ||' set encounter_num =
 encounter_id, process_status_flag = ''P'' where                                
        encounter_id =  :x and encounter_id_source = ''HIVE'' and not exists (se
lect 1 from encounter_mapping em where em.encounter_ide = encounter_map_id      
        and em.encounter_ide_source = encounter_map_id_source)' using disEncount
erId;                                                                           
                                                                                
   end if;                                                                      
                                                                                
   -- test if record fectched                                                   
   -- dbms_output.put_line(' HIVE ');                                           
                                                                                
 else                                                                           
    begin                                                                       
       select encounter_num into existingEncounterNum from encounter_mapping whe
re encounter_ide = disEncounterId and                                           
        encounter_ide_source = disEncounterIdSource ;                           
                                                                                
       -- test if record fetched.                                               
       EXCEPTION                                                                
           WHEN NO_DATA_FOUND THEN                                              
           existingEncounterNum := null;                                        
       end;                                                                     
       if existingEncounterNum is not  null then                                
            execute immediate ' update ' || tempEidTableName ||' set encounter_n
um = :x , process_status_flag = ''P''                                           
            where encounter_id = :y and not exists (select 1 from encounter_mapp
ing em where em.encounter_ide = encounter_map_id                                
        and em.encounter_ide_source = encounter_map_id_source)' using existingEn
counterNum, disEncounterId;                                                     
       else                                                                     
                                                                                
            maxEncounterNum := maxEncounterNum + 1 ;                            
			--TODO : add update colunn                                                   
             execute immediate ' insert into ' || tempEidTableName ||' (encounte
r_map_id,encounter_map_id_source,encounter_id,encounter_id_source,encounter_num,
process_status_flag                                                             
             ,encounter_map_id_status,update_date,download_date,import_date,sour
cesystem_cd)                                                                    
             values(:x,''HIVE'',:y,''HIVE'',:z,''P'',''A'',sysdate,sysdate,sysda
te,''edu.harvard.i2b2.crc'')' using maxEncounterNum,maxEncounterNum,maxEncounter
Num;                                                                            
            execute immediate ' update ' || tempEidTableName ||' set encounter_n
um =  :x , process_status_flag = ''P''                                          
            where encounter_id = :y and  not exists (select 1 from              
            encounter_mapping em where em.encounter_ide = encounter_map_id      
            and em.encounter_ide_source = encounter_map_id_source)' using maxEnc
ounterNum, disEncounterId;                                                      
                                                                                
       end if ;                                                                 
                                                                                
      -- dbms_output.put_line(' NOT HIVE ');                                    
 end if;                                                                        
                                                                                
END LOOP;                                                                       
close distinctEidCur ;                                                          
commit;                                                                         
 -- do the mapping update if the update date is old                             
   execute immediate ' merge into encounter_mapping                             
      using ' || tempEidTableName ||' temp                                      
      on (temp.encounter_map_id = encounter_mapping.ENCOUNTER_IDE               
  		  and temp.encounter_map_id_source = encounter_mapping.ENCOUNTER_IDE_SOURCE 
	   ) when matched then                                                         
  		update set ENCOUNTER_NUM = temp.encounter_id,                               
    	patient_ide   =   temp.patient_map_id ,                                    
    	patient_ide_source  =	temp.patient_map_id_source ,                         
    	encounter_ide_status	= temp.encounter_map_id_status  ,                     
    	update_date = temp.update_date,                                            
    	download_date  = temp.download_date ,                                      
		import_date = sysdate ,                                                       
    	sourcesystem_cd  = temp.sourcesystem_cd ,                                  
		upload_id = ' || upload_id ||'                                                
    	where  temp.encounter_id_source = ''HIVE'' and temp.process_status_flag is 
null  and                                                                       
        nvl(encounter_mapping.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'
'))<= nvl(temp.update_date,to_date(''01-JAN-1900'',''DD-MON-YYYY'')) ' ;        
                                                                                
-- insert new mapping records i.e flagged P                                     
execute immediate ' insert into encounter_mapping (encounter_ide,encounter_ide_s
ource,encounter_ide_status,encounter_num,patient_ide,patient_ide_source,update_d
ate,download_date,import_date,sourcesystem_cd,upload_id)                        
    select encounter_map_id,encounter_map_id_source,encounter_map_id_status,enco
unter_num,patient_map_id,patient_map_id_source,update_date,download_date,sysdate
,sourcesystem_cd,' || upload_id || ' from ' || tempEidTableName || '            
    where process_status_flag = ''P'' ' ;                                       
commit;                                                                         
EXCEPTION                                                                       
   WHEN OTHERS THEN                                                             
      if distinctEidCur%isopen then                                             
          close distinctEidCur;                                                 
      end if;                                                                   
      rollback;                                                                 
      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -
ERROR- '||SQLERRM);                                                             
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."INSERT_CONCEPT_FROMTEMP" (tempConc
eptTableName IN VARCHAR, upload_id IN NUMBER, errorMsg OUT VARCHAR )            
IS                                                                              
                                                                                
BEGIN                                                                           
	--Delete duplicate rows with same encounter and patient combination            
	execute immediate 'DELETE FROM ' || tempConceptTableName || ' t1 WHERE rowid > 
                                                                                
					   (SELECT  min(rowid) FROM ' || tempConceptTableName || ' t2              
					     WHERE t1.concept_cd = t2.concept_cd                                   
                                            AND t1.concept_path = t2.concept_pat
h                                                                               
                                            )';                                 
	                                                                               
	   execute immediate ' UPDATE concept_dimension  set  (concept_cd,             
                        name_char,concept_blob,                                 
                        update_date,download_date,                              
                        import_date,sourcesystem_cd,                            
			     	UPLOAD_ID) = (select temp.concept_cd, temp.name_char,temp.concept_blob,
temp.update_date,temp.DOWNLOAD_DATE,sysdate,temp.SOURCESYSTEM_CD,               
			     	' || UPLOAD_ID  || ' from ' || tempConceptTableName || '  temp   where 
                                                                                
					temp.concept_path = concept_dimension.concept_path and temp.update_date >= 
concept_dimension.update_date)                                                  
					where exists (select 1 from ' || tempConceptTableName || ' temp  where temp
.concept_path = concept_dimension.concept_path                                  
					and temp.update_date >= concept_dimension.update_date) ';                  
                                                                                
                                                                                
                                                                                
                                                                                
    --Create new patient(patient_mapping) if temp table patient_ide does not exi
sts                                                                             
	-- in patient_mapping table.                                                   
	execute immediate 'insert into concept_dimension  (concept_cd,concept_path,name
_char,concept_blob,update_date,download_date,import_date,sourcesystem_cd,upload_
id)                                                                             
			    select  concept_cd, concept_path,                                        
                        name_char,concept_blob,                                 
                        update_date,download_date,                              
                        sysdate,sourcesystem_cd,                                
                         ' || upload_id || '  from ' || tempConceptTableName || 
'  temp                                                                         
					where not exists (select concept_cd from concept_dimension cd where cd.conc
ept_path = temp.concept_path)                                                   
					                                                                           
	';                                                                             
	                                                                               
	                                                                               
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERRO
R- '||SQLERRM);	                                                                
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_VISIT_TABLE" (tempTabl
eName IN VARCHAR, errorMsg OUT VARCHAR )                                        
IS                                                                              
                                                                                
BEGIN                                                                           
	-- Create temp table to store encounter/visit information                      
	execute immediate 'create table ' ||  tempTableName || ' (                     
		encounter_id 			VARCHAR(200) not null,                                        
		encounter_id_source 	VARCHAR(50) not null,                                    
		patient_id  			VARCHAR(200) not null,                                         
		patient_id_source 		VARCHAR2(50) not null,                                    
		encounter_num	 		    NUMBER(38,0),                                            
		inout_cd   			VARCHAR(50),                                                    
		location_cd 			VARCHAR2(50),                                                  
		location_path 			VARCHAR2(900),                                               
 		start_date   			DATE,                                                        
 		end_date    			DATE,                                                         
 		visit_blob 				CLOB,                                                         
 		update_date  			DATE,                                                        
		download_date 			DATE,                                                        
 		import_date 			DATE,                                                         
		sourcesystem_cd 		VARCHAR2(50)                                                
	)';                                                                            
                                                                                
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_enc_id ON ' || t
empTableName || '  ( encounter_id,encounter_id_source,patient_id,patient_id_sour
ce )';                                                                          
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_patient_id ON ' 
|| tempTableName || '  ( patient_id,patient_id_source )';                       
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_TABLE" (tempTableName 
IN VARCHAR, errorMsg OUT VARCHAR)                                               
IS                                                                              
                                                                                
BEGIN                                                                           
	execute immediate 'create table ' ||  tempTableName || '  (                    
		encounter_num  NUMBER(38,0),                                                  
		encounter_id varchar(200) not null,                                           
        encounter_id_source varchar(50) not null,                               
		concept_cd 	 VARCHAR(50) not null,                                            
                patient_num number(38,0),                                       
		patient_id  varchar(200) not null,                                            
        patient_id_source  varchar(50) not null,                                
		provider_id   VARCHAR(50),                                                    
 		start_date   DATE,                                                           
		modifier_cd VARCHAR2(100),                                                    
	    instance_num number(18,0),                                                 
 		valtype_cd varchar2(50),                                                     
		tval_char varchar(255),                                                       
 		nval_num NUMBER(18,5),                                                       
		valueflag_cd CHAR(50),                                                        
 		quantity_num NUMBER(18,5),                                                   
		confidence_num NUMBER(18,0),                                                  
 		observation_blob CLOB,                                                       
		units_cd VARCHAR2(50),                                                        
 		end_date    DATE,                                                            
		location_cd VARCHAR2(50),                                                     
 		update_date  DATE,                                                           
		download_date DATE,                                                           
 		import_date DATE,                                                            
		sourcesystem_cd VARCHAR2(50) ,                                                
 		upload_id INTEGER                                                            
	) NOLOGGING';                                                                  
                                                                                
                                                                                
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_pk ON ' || tempT
ableName || '  ( encounter_num,patient_num,concept_cd,provider_id,start_date,mod
ifier_cd,instance_num)';                                                        
    execute immediate 'CREATE INDEX idx_' || tempTableName || '_enc_pat_id ON ' 
|| tempTableName || '  (encounter_id,encounter_id_source, patient_id,patient_id_
source )';                                                                      
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_PROVIDER_TABLE" (tempP
roviderTableName IN VARCHAR,                                                    
   errorMsg OUT VARCHAR)                                                        
IS                                                                              
                                                                                
BEGIN                                                                           
                                                                                
execute immediate 'create table ' ||  tempProviderTableName || ' (              
    PROVIDER_ID VARCHAR2(50) NOT NULL,                                          
	PROVIDER_PATH VARCHAR2(700) NOT NULL,                                          
	NAME_CHAR VARCHAR2(2000),                                                      
	PROVIDER_BLOB CLOB,                                                            
	UPDATE_DATE DATE,                                                              
	DOWNLOAD_DATE DATE,                                                            
	IMPORT_DATE DATE,                                                              
	SOURCESYSTEM_CD VARCHAR2(50),                                                  
	UPLOAD_ID NUMBER(*,0)                                                          
	 )';                                                                           
 execute immediate 'CREATE INDEX idx_' || tempProviderTableName || '_ppath_id ON
 ' || tempProviderTableName || '  (PROVIDER_PATH)';                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_PID_TABLE" (tempPatien
tMappingTableName IN VARCHAR,                                                   
    errorMsg OUT VARCHAR )                                                      
IS                                                                              
                                                                                
BEGIN                                                                           
execute immediate 'create table ' ||  tempPatientMappingTableName || ' (        
	   	PATIENT_MAP_ID VARCHAR2(200),                                              
		PATIENT_MAP_ID_SOURCE VARCHAR2(50),                                           
		PATIENT_ID_STATUS VARCHAR2(50),                                               
		PATIENT_ID  VARCHAR2(200),                                                    
	    PATIENT_ID_SOURCE varchar(50),                                             
		PATIENT_NUM NUMBER(38,0),                                                     
	    PATIENT_MAP_ID_STATUS VARCHAR2(50),                                        
		PROCESS_STATUS_FLAG CHAR(1),                                                  
		UPDATE_DATE DATE,                                                             
		DOWNLOAD_DATE DATE,                                                           
		IMPORT_DATE DATE,                                                             
		SOURCESYSTEM_CD VARCHAR2(50)                                                  
                                                                                
	 )';                                                                           
                                                                                
execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || '_pid_id
 ON ' || tempPatientMappingTableName || '  ( PATIENT_ID, PATIENT_ID_SOURCE )';  
                                                                                
execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || 'map_pid
_id ON ' || tempPatientMappingTableName || '                                    
( PATIENT_ID, PATIENT_ID_SOURCE,PATIENT_MAP_ID, PATIENT_MAP_ID_SOURCE,  PATIENT_
NUM )';                                                                         
                                                                                
execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || 'stat_pi
d_id ON ' || tempPatientMappingTableName || '                                   
(PROCESS_STATUS_FLAG)';                                                         
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_PATIENT_TABLE" (tempPa
tientDimensionTableName IN VARCHAR,                                             
    errorMsg OUT VARCHAR )                                                      
IS                                                                              
                                                                                
BEGIN                                                                           
	-- Create temp table to store encounter/visit information                      
	execute immediate 'create table ' ||  tempPatientDimensionTableName || ' (     
		PATIENT_ID VARCHAR2(200),                                                     
		PATIENT_ID_SOURCE VARCHAR2(50),                                               
		PATIENT_NUM NUMBER(38,0),                                                     
	    VITAL_STATUS_CD VARCHAR2(50),                                              
	    BIRTH_DATE DATE,                                                           
	    DEATH_DATE DATE,                                                           
	    SEX_CD CHAR(50),                                                           
	    AGE_IN_YEARS_NUM NUMBER(5,0),                                              
	    LANGUAGE_CD VARCHAR2(50),                                                  
		RACE_CD VARCHAR2(50 ),                                                        
		MARITAL_STATUS_CD VARCHAR2(50),                                               
		RELIGION_CD VARCHAR2(50),                                                     
		ZIP_CD VARCHAR2(50),                                                          
		STATECITYZIP_PATH VARCHAR2(700),                                              
		PATIENT_BLOB CLOB,                                                            
		UPDATE_DATE DATE,                                                             
		DOWNLOAD_DATE DATE,                                                           
		IMPORT_DATE DATE,                                                             
		SOURCESYSTEM_CD VARCHAR2(50)                                                  
	)';                                                                            
                                                                                
execute immediate 'CREATE INDEX idx_' || tempPatientDimensionTableName || '_pat_
id ON ' || tempPatientDimensionTableName || '  (PATIENT_ID, PATIENT_ID_SOURCE,PA
TIENT_NUM)';                                                                    
                                                                                
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_MODIFIER_TABLE" (tempM
odifierTableName IN VARCHAR,                                                    
  errorMsg OUT VARCHAR)                                                         
IS                                                                              
                                                                                
BEGIN                                                                           
execute immediate 'create table ' ||  tempModifierTableName || ' (              
        MODIFIER_CD VARCHAR2(50) NOT NULL,                                      
	MODIFIER_PATH VARCHAR2(900) NOT NULL ,                                         
	NAME_CHAR VARCHAR2(2000),                                                      
	MODIFIER_BLOB CLOB,                                                            
	UPDATE_DATE date,                                                              
	DOWNLOAD_DATE DATE,                                                            
	IMPORT_DATE DATE,                                                              
	SOURCESYSTEM_CD VARCHAR2(50)                                                   
	 )';                                                                           
                                                                                
 execute immediate 'CREATE INDEX idx_' || tempModifierTableName || '_pat_id ON '
 || tempModifierTableName || '  (MODIFIER_PATH)';                               
                                                                                
                                                                                
                                                                                
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "I2B2DEMODATA"."CREATE_TEMP_EID_TABLE" (tempPatien
tMappingTableName IN VARCHAR ,errorMsg OUT VARCHAR)                             
IS                                                                              
                                                                                
BEGIN                                                                           
execute immediate 'create table ' ||  tempPatientMappingTableName || ' (        
	ENCOUNTER_MAP_ID       	VARCHAR2(200) NOT NULL,                                
    ENCOUNTER_MAP_ID_SOURCE	VARCHAR2(50) NOT NULL,                              
    PATIENT_MAP_ID          VARCHAR2(200),                                      
	PATIENT_MAP_ID_SOURCE   VARCHAR2(50),                                          
    ENCOUNTER_ID       	    VARCHAR2(200) NOT NULL,                             
    ENCOUNTER_ID_SOURCE     VARCHAR2(50) ,                                      
    ENCOUNTER_NUM           NUMBER,                                             
    ENCOUNTER_MAP_ID_STATUS    VARCHAR2(50),                                    
    PROCESS_STATUS_FLAG     CHAR(1),                                            
	UPDATE_DATE DATE,                                                              
	DOWNLOAD_DATE DATE,                                                            
	IMPORT_DATE DATE,                                                              
	SOURCESYSTEM_CD VARCHAR2(50)                                                   
)';                                                                             
                                                                                
execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || '_eid_id
 ON ' || tempPatientMappingTableName || '  (ENCOUNTER_ID, ENCOUNTER_ID_SOURCE, E
NCOUNTER_MAP_ID, ENCOUNTER_MAP_ID_SOURCE, ENCOUNTER_NUM)';                      
                                                                                
 execute immediate 'CREATE INDEX idx_' || tempPatientMappingTableName || '_state
id_eid_id ON ' || tempPatientMappingTableName || '  (PROCESS_STATUS_FLAG)';     
EXCEPTION                                                                       
	WHEN OTHERS THEN                                                               
		dbms_output.put_line(SQLCODE|| ' - ' ||SQLERRM);                              
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."CONCEPT_ID"  MINVALUE 1 MAXVALUE 99999999999
9999999999999999 INCREMENT BY 1 START WITH 60303 CACHE 20 NOORDER  NOCYCLE      
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."SQ_UP_PATDIM_PATIENTNUM"  MINVALUE 1 MAXVALU
E 9999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  ORDER  NOCYCLE             
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."SQ_UP_ENCDIM_ENCOUNTERNUM"  MINVALUE 1 MAXVA
LUE 9999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE           
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."SQ_UPLOADSTATUS_UPLOADID"  MINVALUE 1 MAXVAL
UE 9999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."SEQ_SUBJECT_REFERENCE"  MINVALUE 1 MAXVALUE 
999999999999999999999999999 INCREMENT BY 1 START WITH 743 CACHE 20 NOORDER  NOCY
CLE                                                                             
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."SEQ_PATIENT_NUM"  MINVALUE 1 MAXVALUE 999999
9999999999999999999999 INCREMENT BY 1 START WITH 29420 CACHE 20 NOORDER  NOCYCLE
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QXR_XRID"  MINVALUE 1 MAXVALUE 9999999
99999999999999999999 INCREMENT BY 1 START WITH 655 CACHE 20 NOORDER  NOCYCLE    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QS_QSID"  MINVALUE 1 MAXVALUE 99999999
9999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QR_QRID"  MINVALUE 1 MAXVALUE 99999999
9999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QRI_QRIID"  MINVALUE 1 MAXVALUE 999999
999999999999999999999 INCREMENT BY 1 START WITH 20728 CACHE 20 NOORDER  NOCYCLE 
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QPR_PCID"  MINVALUE 1 MAXVALUE 9999999
99999999999999999999 INCREMENT BY 1 START WITH 3406292 CACHE 20 NOORDER  NOCYCLE
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QPER_PECID"  MINVALUE 1 MAXVALUE 99999
9999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QM_QMID"  MINVALUE 1 MAXVALUE 99999999
9999999999999999999 INCREMENT BY 1 START WITH 20770 CACHE 20 NOORDER  NOCYCLE   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_QI_QIID"  MINVALUE 1 MAXVALUE 99999999
9999999999999999999 INCREMENT BY 1 START WITH 20748 CACHE 20 NOORDER  NOCYCLE   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."QT_SQ_PQM_QMID"  MINVALUE 1 MAXVALUE 9999999
999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "I2B2DEMODATA"."PROTOCOL_ID_SEQ"  MINVALUE 1 MAXVALUE 999999
999999999999999999999 INCREMENT BY 1 START WITH 215 CACHE 20 NOORDER  NOCYCLE   
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."ASYNC_JOB"                                       
   (	"ID" NUMBER NOT NULL ENABLE,                                               
	"JOB_NAME" VARCHAR2(200),                                                      
	"JOB_STATUS" VARCHAR2(200),                                                    
	"RUN_TIME" VARCHAR2(200),                                                      
	"LAST_RUN_ON" TIMESTAMP (6),                                                   
	"VIEWER_URL" VARCHAR2(4000),                                                   
	"ALT_VIEWER_URL" VARCHAR2(4000),                                               
	"JOB_RESULTS" CLOB,                                                            
	"JOB_TYPE" VARCHAR2(20),                                                       
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 589824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("JOB_RESULTS") STORE AS BASICFILE (                                       
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."VISIT_DIMENSION"                                 
   (	"ENCOUNTER_NUM" NUMBER(38,0),                                              
	"PATIENT_NUM" NUMBER(38,0),                                                    
	"INOUT_CD" VARCHAR2(50),                                                       
	"LOCATION_CD" VARCHAR2(50),                                                    
	"LOCATION_PATH" VARCHAR2(900),                                                 
	"START_DATE" DATE,                                                             
	"END_DATE" DATE,                                                               
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER(38,0),                                                      
	"ACTIVE_STATUS_CD" VARCHAR2(50),                                               
	"VISIT_BLOB" CLOB,                                                             
	"LENGTH_OF_STAY" NUMBER(38,0),                                                 
	 CONSTRAINT "VISIT_DIMENSION_PK" PRIMARY KEY ("ENCOUNTER_NUM", "PATIENT_NUM")  
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
 LOB ("VISIT_BLOB") STORE AS BASICFILE (                                        
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."UPLOAD_STATUS"                                   
   (	"UPLOAD_ID" NUMBER(38,0),                                                  
	"UPLOAD_LABEL" VARCHAR2(500) NOT NULL ENABLE,                                  
	"USER_ID" VARCHAR2(100) NOT NULL ENABLE,                                       
	"SOURCE_CD" VARCHAR2(50) NOT NULL ENABLE,                                      
	"NO_OF_RECORD" NUMBER,                                                         
	"LOADED_RECORD" NUMBER,                                                        
	"DELETED_RECORD" NUMBER,                                                       
	"LOAD_DATE" DATE NOT NULL ENABLE,                                              
	"END_DATE" DATE,                                                               
	"LOAD_STATUS" VARCHAR2(100),                                                   
	"TRANSFORM_NAME" VARCHAR2(500),                                                
	"MESSAGE" CLOB,                                                                
	"INPUT_FILE_NAME" CLOB,                                                        
	"LOG_FILE_NAME" CLOB                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("MESSAGE") STORE AS BASICFILE (                                           
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("INPUT_FILE_NAME") STORE AS BASICFILE (                                   
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("LOG_FILE_NAME") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."CODE_LOOKUP"                                     
   (	"TABLE_CD" VARCHAR2(100) NOT NULL ENABLE,                                  
	"COLUMN_CD" VARCHAR2(100) NOT NULL ENABLE,                                     
	"CODE_CD" VARCHAR2(50) NOT NULL ENABLE,                                        
	"NAME_CHAR" VARCHAR2(650),                                                     
	"LOOKUP_BLOB" CLOB,                                                            
	"UPLOAD_DATE" DATE,                                                            
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER(38,0),                                                      
	 CONSTRAINT "CODE_LOOKUP_PK" PRIMARY KEY ("TABLE_CD", "COLUMN_CD", "CODE_CD")  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("LOOKUP_BLOB") STORE AS BASICFILE (                                       
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."CONCEPT_COUNTS"                                  
   (	"CONCEPT_PATH" VARCHAR2(500),                                              
	"PARENT_CONCEPT_PATH" VARCHAR2(500),                                           
	"PATIENT_COUNT" NUMBER(38,0)                                                   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."CONCEPT_DIMENSION"                               
   (	"CONCEPT_CD" VARCHAR2(50) NOT NULL ENABLE,                                 
	"CONCEPT_PATH" VARCHAR2(700) NOT NULL ENABLE,                                  
	"NAME_CHAR" VARCHAR2(2000),                                                    
	"CONCEPT_BLOB" CLOB,                                                           
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER,                                                            
	"TABLE_NAME" VARCHAR2(255)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 14680064 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("CONCEPT_BLOB") STORE AS BASICFILE (                                      
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."COUNTER"                                         
   (	"CONCEPT_CD" VARCHAR2(50) NOT NULL ENABLE,                                 
	"COUNTS" NUMBER                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."CRC_DB_LOOKUP"                                   
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."DATAMART_REPORT"                                 
   (	"TOTAL_PATIENT" NUMBER(38,0),                                              
	"TOTAL_OBSERVATIONFACT" NUMBER(38,0),                                          
	"TOTAL_EVENT" NUMBER(38,0),                                                    
	"REPORT_DATE" DATE                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."DIMLOADER"                                       
   (	"C_HLEVEL" NUMBER(22,0),                                                   
	"C_FULLNAME" VARCHAR2(900),                                                    
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
	"C_DIMCODE" VARCHAR2(900),                                                     
	"C_COMMENT" CLOB,                                                              
	"C_TOOLTIP" VARCHAR2(900),                                                     
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
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
                                                                                
                                                                                
                                                                                
  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."DX"                             
   (	"ENCOUNTER_NUM" NUMBER(22,0),                                              
	"PATIENT_NUM" NUMBER(22,0)                                                     
   ) ON COMMIT PRESERVE ROWS                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."ENCOUNTER_MAPPING"                               
   (	"ENCOUNTER_IDE" VARCHAR2(200) NOT NULL ENABLE,                             
	"ENCOUNTER_IDE_SOURCE" VARCHAR2(50) NOT NULL ENABLE,                           
	"ENCOUNTER_NUM" NUMBER(38,0) NOT NULL ENABLE,                                  
	"PATIENT_IDE" VARCHAR2(200),                                                   
	"PATIENT_IDE_SOURCE" VARCHAR2(50),                                             
	"ENCOUNTER_IDE_STATUS" VARCHAR2(50),                                           
	"UPDATE_DATE" DATE,                                                            
	"UPLOAD_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER(38,0)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."GLOBAL_TEMP_FACT_PARAM_TABLE"   
   (	"SET_INDEX" NUMBER(*,0),                                                   
	"CHAR_PARAM1" VARCHAR2(500),                                                   
	"CHAR_PARAM2" VARCHAR2(500),                                                   
	"NUM_PARAM1" NUMBER(*,0),                                                      
	"NUM_PARAM2" NUMBER(*,0)                                                       
   ) ON COMMIT PRESERVE ROWS                                                    
                                                                                
                                                                                
                                                                                
  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."GLOBAL_TEMP_PARAM_TABLE"        
   (	"SET_INDEX" NUMBER(*,0),                                                   
	"CHAR_PARAM1" VARCHAR2(500),                                                   
	"CHAR_PARAM2" VARCHAR2(500),                                                   
	"NUM_PARAM1" NUMBER(*,0),                                                      
	"NUM_PARAM2" NUMBER(*,0)                                                       
   ) ON COMMIT PRESERVE ROWS                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."HILOSEQUENCES"                                   
   (	"SEQUENCENAME" VARCHAR2(50) NOT NULL ENABLE,                               
	"HIGHVALUES" NUMBER(*,0) NOT NULL ENABLE                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."JMS_MESSAGES"                                    
   (	"MESSAGEID" NUMBER(*,0) NOT NULL ENABLE,                                   
	"DESTINATION" VARCHAR2(255) NOT NULL ENABLE,                                   
	"TXID" NUMBER(*,0),                                                            
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
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."JMS_ROLES"                                       
   (	"ROLEID" VARCHAR2(32) NOT NULL ENABLE,                                     
	"USERID" VARCHAR2(32) NOT NULL ENABLE                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."JMS_SUBSCRIPTIONS"                               
   (	"CLIENTID" VARCHAR2(128) NOT NULL ENABLE,                                  
	"SUBNAME" VARCHAR2(128) NOT NULL ENABLE,                                       
	"TOPIC" VARCHAR2(255) NOT NULL ENABLE,                                         
	"SELECTOR" VARCHAR2(255)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."JMS_TRANSACTIONS"                                
   (	"TXID" NUMBER(*,0)                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."JMS_USERS"                                       
   (	"USERID" VARCHAR2(32) NOT NULL ENABLE,                                     
	"PASSWD" VARCHAR2(32) NOT NULL ENABLE,                                         
	"CLIENTID" VARCHAR2(128)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."MASTER_QUERY_GLOBAL_TEMP"       
   (	"ENCOUNTER_NUM" NUMBER(22,0),                                              
	"PATIENT_NUM" NUMBER(22,0),                                                    
	"INSTANCE_NUM" NUMBER(18,0),                                                   
	"CONCEPT_CD" VARCHAR2(50),                                                     
	"START_DATE" DATE,                                                             
	"PROVIDER_ID" VARCHAR2(50),                                                    
	"MASTER_ID" VARCHAR2(50),                                                      
	"LEVEL_NO" NUMBER(5,0)                                                         
   ) ON COMMIT PRESERVE ROWS                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."NEWS_UPDATES"                                    
   (	"NEWSID" NUMBER,                                                           
	"RANBYUSER" VARCHAR2(200),                                                     
	"ROWSAFFECTED" NUMBER,                                                         
	"OPERATION" VARCHAR2(200),                                                     
	"DATASETNAME" VARCHAR2(200),                                                   
	"UPDATEDATE" TIMESTAMP (6),                                                    
	"COMMENTFIELD" VARCHAR2(200)                                                   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."OBSERVATION_FACT"                                
   (	"ENCOUNTER_NUM" NUMBER(38,0),                                              
	"PATIENT_NUM" NUMBER(38,0),                                                    
	"CONCEPT_CD" VARCHAR2(50) NOT NULL ENABLE,                                     
	"PROVIDER_ID" VARCHAR2(50) NOT NULL ENABLE,                                    
	"START_DATE" DATE,                                                             
	"MODIFIER_CD" VARCHAR2(100),                                                   
	"VALTYPE_CD" VARCHAR2(50),                                                     
	"TVAL_CHAR" VARCHAR2(255),                                                     
	"NVAL_NUM" NUMBER(18,5),                                                       
	"VALUEFLAG_CD" VARCHAR2(50),                                                   
	"QUANTITY_NUM" NUMBER(18,5),                                                   
	"UNITS_CD" VARCHAR2(50),                                                       
	"END_DATE" DATE,                                                               
	"LOCATION_CD" VARCHAR2(50),                                                    
	"CONFIDENCE_NUM" NUMBER(18,0),                                                 
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER(38,0),                                                      
	"OBSERVATION_BLOB" CLOB,                                                       
	"INSTANCE_NUM" NUMBER(18,0)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS FOR OLTP NOLOGGING     
  STORAGE(INITIAL 26214400 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("OBSERVATION_BLOB") STORE AS BASICFILE (                                  
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."PATIENT_DIMENSION"                               
   (	"PATIENT_NUM" NUMBER(38,0),                                                
	"VITAL_STATUS_CD" VARCHAR2(50),                                                
	"BIRTH_DATE" DATE,                                                             
	"DEATH_DATE" DATE,                                                             
	"SEX_CD" VARCHAR2(50),                                                         
	"AGE_IN_YEARS_NUM" NUMBER(38,0),                                               
	"LANGUAGE_CD" VARCHAR2(50),                                                    
	"RACE_CD" VARCHAR2(50),                                                        
	"MARITAL_STATUS_CD" VARCHAR2(50),                                              
	"RELIGION_CD" VARCHAR2(50),                                                    
	"ZIP_CD" VARCHAR2(50),                                                         
	"STATECITYZIP_PATH" VARCHAR2(700),                                             
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER(38,0),                                                      
	"PATIENT_BLOB" CLOB,                                                           
	"INCOME_CD" VARCHAR2(50)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("PATIENT_BLOB") STORE AS BASICFILE (                                      
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."PATIENT_MAPPING"                                 
   (	"PATIENT_IDE" VARCHAR2(200) NOT NULL ENABLE,                               
	"PATIENT_IDE_SOURCE" VARCHAR2(50) NOT NULL ENABLE,                             
	"PATIENT_NUM" NUMBER(38,0) NOT NULL ENABLE,                                    
	"PATIENT_IDE_STATUS" VARCHAR2(50),                                             
	"UPLOAD_DATE" DATE,                                                            
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER(38,0)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."PATIENT_TRIAL"                                   
   (	"PATIENT_NUM" NUMBER,                                                      
	"TRIAL" VARCHAR2(30),                                                          
	"SECURE_OBJ_TOKEN" VARCHAR2(50)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."PROVIDER_DIMENSION"                              
   (	"PROVIDER_ID" VARCHAR2(50) NOT NULL ENABLE,                                
	"PROVIDER_PATH" VARCHAR2(700) NOT NULL ENABLE,                                 
	"NAME_CHAR" VARCHAR2(850),                                                     
	"PROVIDER_BLOB" CLOB,                                                          
	"UPDATE_DATE" DATE,                                                            
	"DOWNLOAD_DATE" DATE,                                                          
	"IMPORT_DATE" DATE,                                                            
	"SOURCESYSTEM_CD" VARCHAR2(50),                                                
	"UPLOAD_ID" NUMBER,                                                            
	 CONSTRAINT "PROVIDER_DIMENSION_PK" PRIMARY KEY ("PROVIDER_PATH", "PROVIDER_ID"
)                                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("PROVIDER_BLOB") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN"                              
   (	"PLUGIN_ID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"PLUGIN_NAME" VARCHAR2(2000),                                                  
	"DESCRIPTION" VARCHAR2(2000),                                                  
	"VERSION_CD" VARCHAR2(50),                                                     
	"PARAMETER_INFO" CLOB,                                                         
	"STATUS_CD" VARCHAR2(50),                                                      
	"USER_ID" VARCHAR2(50),                                                        
	"GROUP_ID" VARCHAR2(50),                                                       
	"CREATE_DATE" DATE,                                                            
	"UPDATE_DATE" DATE,                                                            
	"PARAMETER_INFO_XSD" CLOB,                                                     
	"COMMAND_LINE" CLOB,                                                           
	"WORKING_FOLDER" CLOB,                                                         
	"COMMANDOPTION_CD" CLOB,                                                       
	"PLUGIN_ICON" CLOB,                                                            
	 CONSTRAINT "ANALYSIS_PLUGIN_PK" PRIMARY KEY ("PLUGIN_ID")                     
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
 LOB ("PARAMETER_INFO") STORE AS BASICFILE (                                    
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("PARAMETER_INFO_XSD") STORE AS BASICFILE (                                
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("COMMAND_LINE") STORE AS BASICFILE (                                      
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("WORKING_FOLDER") STORE AS BASICFILE (                                    
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("COMMANDOPTION_CD") STORE AS BASICFILE (                                  
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("PLUGIN_ICON") STORE AS BASICFILE (                                       
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN_RESULT_TYPE"                  
   (	"PLUGIN_ID" NUMBER(10,0),                                                  
	"RESULT_TYPE_ID" NUMBER(10,0),                                                 
	 CONSTRAINT "ANALYSIS_PLUGIN_RESULT_PK" PRIMARY KEY ("PLUGIN_ID", "RESULT_TYPE_
ID")                                                                            
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
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_BREAKDOWN_PATH"                               
   (	"NAME" VARCHAR2(100),                                                      
	"VALUE" VARCHAR2(2000),                                                        
	"CREATE_DATE" DATE,                                                            
	"UPDATE_DATE" DATE,                                                            
	"USER_ID" VARCHAR2(50)                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_PATIENT_ENC_COLLECTION"                       
   (	"PATIENT_ENC_COLL_ID" NUMBER(10,0),                                        
	"RESULT_INSTANCE_ID" NUMBER(5,0),                                              
	"SET_INDEX" NUMBER(10,0),                                                      
	"PATIENT_NUM" NUMBER(10,0),                                                    
	"ENCOUNTER_NUM" NUMBER(10,0)                                                   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_PATIENT_SET_COLLECTION"                       
   (	"PATIENT_SET_COLL_ID" NUMBER(10,0),                                        
	"RESULT_INSTANCE_ID" NUMBER(5,0),                                              
	"SET_INDEX" NUMBER(10,0),                                                      
	"PATIENT_NUM" NUMBER(10,0)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 33554432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_PDO_QUERY_MASTER"                             
   (	"QUERY_MASTER_ID" NUMBER(5,0),                                             
	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"GROUP_ID" VARCHAR2(50) NOT NULL ENABLE,                                       
	"CREATE_DATE" DATE NOT NULL ENABLE,                                            
	"REQUEST_XML" CLOB,                                                            
	"I2B2_REQUEST_XML" CLOB,                                                       
	 PRIMARY KEY ("QUERY_MASTER_ID")                                               
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
 LOB ("I2B2_REQUEST_XML") STORE AS BASICFILE (                                  
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_PRIVILEGE"                                    
   (	"PROTECTION_LABEL_CD" VARCHAR2(1500),                                      
	"DATAPROT_CD" VARCHAR2(1000),                                                  
	"HIVEMGMT_CD" VARCHAR2(1000),                                                  
	"PLUGIN_ID" NUMBER(10,0)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE"                               
   (	"QUERY_INSTANCE_ID" NUMBER(5,0),                                           
	"QUERY_MASTER_ID" NUMBER(5,0),                                                 
	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"GROUP_ID" VARCHAR2(50) NOT NULL ENABLE,                                       
	"BATCH_MODE" VARCHAR2(50),                                                     
	"START_DATE" DATE NOT NULL ENABLE,                                             
	"END_DATE" DATE,                                                               
	"STATUS_TYPE_ID" NUMBER(5,0),                                                  
	"DELETE_FLAG" VARCHAR2(3),                                                     
	"MESSAGE" CLOB                                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("MESSAGE") STORE AS BASICFILE (                                           
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_MASTER"                                 
   (	"QUERY_MASTER_ID" NUMBER(5,0),                                             
	"NAME" VARCHAR2(250) NOT NULL ENABLE,                                          
	"USER_ID" VARCHAR2(50) NOT NULL ENABLE,                                        
	"GROUP_ID" VARCHAR2(50) NOT NULL ENABLE,                                       
	"CREATE_DATE" DATE NOT NULL ENABLE,                                            
	"DELETE_DATE" DATE,                                                            
	"REQUEST_XML" CLOB,                                                            
	"DELETE_FLAG" VARCHAR2(3),                                                     
	"GENERATED_SQL" CLOB,                                                          
	"I2B2_REQUEST_XML" CLOB,                                                       
	"MASTER_TYPE_CD" VARCHAR2(2000),                                               
	"PLUGIN_ID" NUMBER(10,0),                                                      
	 PRIMARY KEY ("QUERY_MASTER_ID")                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 27262976 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("REQUEST_XML") STORE AS BASICFILE (                                       
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("GENERATED_SQL") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("I2B2_REQUEST_XML") STORE AS BASICFILE (                                  
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE"                        
   (	"RESULT_INSTANCE_ID" NUMBER(5,0),                                          
	"QUERY_INSTANCE_ID" NUMBER(5,0),                                               
	"RESULT_TYPE_ID" NUMBER(3,0) NOT NULL ENABLE,                                  
	"SET_SIZE" NUMBER(10,0),                                                       
	"START_DATE" DATE NOT NULL ENABLE,                                             
	"END_DATE" DATE,                                                               
	"STATUS_TYPE_ID" NUMBER(3,0) NOT NULL ENABLE,                                  
	"DELETE_FLAG" VARCHAR2(3),                                                     
	"MESSAGE" CLOB,                                                                
	"DESCRIPTION" VARCHAR2(200),                                                   
	"REAL_SET_SIZE" NUMBER(10,0),                                                  
	"OBFUSC_METHOD" VARCHAR2(500)                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("MESSAGE") STORE AS BASICFILE (                                           
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_TYPE"                            
   (	"RESULT_TYPE_ID" NUMBER(3,0),                                              
	"NAME" VARCHAR2(100),                                                          
	"DESCRIPTION" VARCHAR2(200),                                                   
	"DISPLAY_TYPE_ID" VARCHAR2(500),                                               
	"VISUAL_ATTRIBUTE_TYPE_ID" VARCHAR2(3)                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_QUERY_STATUS_TYPE"                            
   (	"STATUS_TYPE_ID" NUMBER(3,0),                                              
	"NAME" VARCHAR2(100),                                                          
	"DESCRIPTION" VARCHAR2(200)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."QT_XML_RESULT"                                   
   (	"XML_RESULT_ID" NUMBER(5,0),                                               
	"RESULT_INSTANCE_ID" NUMBER(5,0),                                              
	"XML_VALUE" CLOB                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("XML_VALUE") STORE AS BASICFILE (                                         
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."QUERY_GLOBAL_TEMP"              
   (	"ENCOUNTER_NUM" NUMBER(22,0),                                              
	"PATIENT_NUM" NUMBER(22,0),                                                    
	"INSTANCE_NUM" NUMBER(18,0),                                                   
	"CONCEPT_CD" VARCHAR2(50),                                                     
	"START_DATE" DATE,                                                             
	"PROVIDER_ID" VARCHAR2(50),                                                    
	"PANEL_COUNT" NUMBER(5,0),                                                     
	"FACT_COUNT" NUMBER(22,0),                                                     
	"FACT_PANELS" NUMBER(5,0)                                                      
   ) ON COMMIT PRESERVE ROWS                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."SAMPLE_CATEGORIES"                               
   (	"TRIAL_NAME" VARCHAR2(100),                                                
	"TISSUE_TYPE" VARCHAR2(2000),                                                  
	"DATA_TYPES" VARCHAR2(2000),                                                   
	"DISEASE" VARCHAR2(2000),                                                      
	"TISSUE_STATE" VARCHAR2(2000),                                                 
	"SAMPLE_ID" VARCHAR2(250),                                                     
	"BIOBANK" VARCHAR2(3),                                                         
	"SOURCE_ORGANISM" VARCHAR2(255),                                               
	"TREATMENT" VARCHAR2(255),                                                     
	"SAMPLE_TREATMENT" VARCHAR2(2000),                                             
	"SUBJECT_TREATMENT" VARCHAR2(2000),                                            
	"TIMEPOINT" VARCHAR2(250),                                                     
	 CHECK (BioBank in('No','Yes')) ENABLE                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."SET_TYPE"                                        
   (	"ID" NUMBER(38,0),                                                         
	"NAME" VARCHAR2(500),                                                          
	"CREATE_DATE" DATE                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."SET_UPLOAD_STATUS"                               
   (	"UPLOAD_ID" NUMBER,                                                        
	"SET_TYPE_ID" NUMBER(38,0),                                                    
	"SOURCE_CD" VARCHAR2(50) NOT NULL ENABLE,                                      
	"NO_OF_RECORD" NUMBER,                                                         
	"LOADED_RECORD" NUMBER,                                                        
	"DELETED_RECORD" NUMBER,                                                       
	"LOAD_DATE" DATE NOT NULL ENABLE,                                              
	"END_DATE" DATE,                                                               
	"LOAD_STATUS" VARCHAR2(100),                                                   
	"TRANSFORM_NAME" VARCHAR2(500),                                                
	"MESSAGE" CLOB,                                                                
	"INPUT_FILE_NAME" CLOB,                                                        
	"LOG_FILE_NAME" CLOB                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
 LOB ("MESSAGE") STORE AS BASICFILE (                                           
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("INPUT_FILE_NAME") STORE AS BASICFILE (                                   
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("LOG_FILE_NAME") STORE AS BASICFILE (                                     
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."SOURCE_MASTER"                                   
   (	"SOURCE_CD" VARCHAR2(50) NOT NULL ENABLE,                                  
	"DESCRIPTION" VARCHAR2(300),                                                   
	"CREATE_DATE" DATE                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "I2B2_DATA"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "I2B2DEMODATA"."TIMERS"                                          
   (	"TIMERID" VARCHAR2(80) NOT NULL ENABLE,                                    
	"TARGETID" VARCHAR2(250) NOT NULL ENABLE,                                      
	"INITIALDATE" TIMESTAMP (9) NOT NULL ENABLE,                                   
	"TIMERINTERVAL" NUMBER(19,0),                                                  
	"INSTANCEPK" BLOB,                                                             
	"INFO" BLOB,                                                                   
	 CONSTRAINT "TIMERS_PK" PRIMARY KEY ("TIMERID", "TARGETID")                    
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
 LOB ("INSTANCEPK") STORE AS BASICFILE (                                        
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("INFO") STORE AS BASICFILE (                                              
  TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10         
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2DEMODATA"."TRG_CONCEPT_DIMENSION"              
BEFORE                                                                          
  INSERT ON CONCEPT_DIMENSION FOR EACH ROW                                      
BEGIN                                                                           
  IF inserting THEN                                                             
    IF :NEW.CONCEPT_CD IS NULL THEN                                             
        SELECT CONCEPT_ID.nextval INTO :NEW.CONCEPT_CD FROM dual;               
    END IF;                                                                     
  END IF;                                                                       
END;                                                                            
                                                                                
ALTER TRIGGER "I2B2DEMODATA"."TRG_CONCEPT_DIMENSION" ENABLE                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "I2B2DEMODATA"."TRG_PATIENT_DIMENSION"              
BEFORE                                                                          
  INSERT ON PATIENT_DIMENSION FOR EACH ROW                                      
BEGIN                                                                           
  IF inserting THEN                                                             
    IF :NEW.PATIENT_NUM IS NULL THEN                                            
        SELECT SEQ_PATIENT_NUM.nextval INTO :NEW.PATIENT_NUM FROM dual;         
    END IF;                                                                     
  END IF;                                                                       
END;                                                                            
                                                                                
ALTER TRIGGER "I2B2DEMODATA"."TRG_PATIENT_DIMENSION" ENABLE                     
                                                                                
                                                                                
