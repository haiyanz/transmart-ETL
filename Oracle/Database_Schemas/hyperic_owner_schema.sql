                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ACKNOWLEDGED_BY_IDX" ON "HYPERIC_OWNER"."EAM_ESC
ALATION_STATE" ("ACKNOWLEDGED_BY")                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."UI_PLUGIN_ID_IDX" ON "HYPERIC_OWNER"."EAM_UI_VIE
W" ("UI_PLUGIN_ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."UI_ATTACHMENT_VIEW_ID_IDX" ON "HYPERIC_OWNER"."E
AM_UI_ATTACHMENT" ("VIEW_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."UI_ATTACHMENT_RES_ID_IDX" ON "HYPERIC_OWNER"."EA
M_UI_ATTACH_RSRC" ("RESOURCE_ID")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."TYPE_NAME_IDX" ON "HYPERIC_OWNER"."EAM_MONITORAB
LE_TYPE" ("NAME")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."TEMPL_MONITORABLE_TYPE_ID_IDX" ON "HYPERIC_OWNER
"."EAM_MEASUREMENT_TEMPL" ("MONITORABLE_TYPE_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."TEMPL_DESIG_IDX" ON "HYPERIC_OWNER"."EAM_MEASURE
MENT_TEMPL" ("DESIGNATE")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."TEMPL_CATEGORY_IDX" ON "HYPERIC_OWNER"."EAM_MEAS
UREMENT_TEMPL" ("CATEGORY_ID")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013649" ON "HYPERIC_OWNER"."QRTZ_TR
IGGER_LISTENERS" ("TRIGGER_NAME", "TRIGGER_GROUP", "TRIGGER_LISTENER")          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013645" ON "HYPERIC_OWNER"."QRTZ_TR
IGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013636" ON "HYPERIC_OWNER"."QRTZ_SI
MPLE_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013630" ON "HYPERIC_OWNER"."QRTZ_SC
HEDULER_STATE" ("INSTANCE_NAME")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013626" ON "HYPERIC_OWNER"."QRTZ_PA
USED_TRIGGER_GRPS" ("TRIGGER_GROUP")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013624" ON "HYPERIC_OWNER"."QRTZ_LO
CKS" ("LOCK_NAME")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013622" ON "HYPERIC_OWNER"."QRTZ_JO
B_LISTENERS" ("JOB_NAME", "JOB_GROUP", "JOB_LISTENER")                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013618" ON "HYPERIC_OWNER"."QRTZ_JO
B_DETAILS" ("JOB_NAME", "JOB_GROUP")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013610" ON "HYPERIC_OWNER"."QRTZ_FI
RED_TRIGGERS" ("ENTRY_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013601" ON "HYPERIC_OWNER"."QRTZ_CR
ON_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013597" ON "HYPERIC_OWNER"."QRTZ_CA
LENDARS" ("CALENDAR_NAME")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013594" ON "HYPERIC_OWNER"."QRTZ_BL
OB_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013591" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_COMPAT" ("TIMESTAMP", "MEASUREMENT_ID")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013588" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_8D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013585" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_8D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013582" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_7D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013579" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_7D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013576" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_6D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013573" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_6D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013570" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_5D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013567" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_5D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013564" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_4D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013561" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_4D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013558" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_3D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013555" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_3D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013552" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_2D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013549" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_2D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013546" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_1D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013543" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_1D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013540" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_0D_1S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013537" ON "HYPERIC_OWNER"."HQ_METR
IC_DATA_0D_0S" ("TIMESTAMP", "MEASUREMENT_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013534" ON "HYPERIC_OWNER"."HQ_AVAI
L_DATA_RLE" ("MEASUREMENT_ID", "STARTIME")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013529" ON "HYPERIC_OWNER"."EAM_VIR
TUAL" ("RESOURCE_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013525" ON "HYPERIC_OWNER"."EAM_UPD
ATE_STATUS" ("ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013520" ON "HYPERIC_OWNER"."EAM_UI_
VIEW_RESOURCE" ("VIEW_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013518" ON "HYPERIC_OWNER"."EAM_UI_
VIEW_MASTHEAD" ("VIEW_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013516" ON "HYPERIC_OWNER"."EAM_UI_
VIEW_ADMIN" ("VIEW_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013514" ON "HYPERIC_OWNER"."EAM_UI_
VIEW" ("PATH")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013513" ON "HYPERIC_OWNER"."EAM_UI_
VIEW" ("ID")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013506" ON "HYPERIC_OWNER"."EAM_UI_
PLUGIN" ("NAME")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013505" ON "HYPERIC_OWNER"."EAM_UI_
PLUGIN" ("ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013500" ON "HYPERIC_OWNER"."EAM_UI_
ATTACH_RSRC" ("ATTACH_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013496" ON "HYPERIC_OWNER"."EAM_UI_
ATTACH_MAST" ("ATTACH_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013493" ON "HYPERIC_OWNER"."EAM_UI_
ATTACH_ADMIN" ("ATTACH_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013490" ON "HYPERIC_OWNER"."EAM_UI_
ATTACHMENT" ("ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013485" ON "HYPERIC_OWNER"."EAM_SUB
JECT_ROLE_MAP" ("SUBJECT_ID", "ROLE_ID")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013482" ON "HYPERIC_OWNER"."EAM_SUB
JECT" ("NAME", "DSN")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013481" ON "HYPERIC_OWNER"."EAM_SUB
JECT" ("ID")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013473" ON "HYPERIC_OWNER"."EAM_STA
T_ERRORS" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013469" ON "HYPERIC_OWNER"."EAM_SRN
" ("INSTANCE_ID", "APPDEF_TYPE")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013464" ON "HYPERIC_OWNER"."EAM_SER
VICE_TYPE" ("ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013460" ON "HYPERIC_OWNER"."EAM_SER
VICE_REQUEST" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013455" ON "HYPERIC_OWNER"."EAM_SER
VICE_DEP_MAP" ("APPSERVICE_ID", "DEPENDENT_SERVICE_ID")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013454" ON "HYPERIC_OWNER"."EAM_SER
VICE_DEP_MAP" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013452" ON "HYPERIC_OWNER"."EAM_SER
VICE" ("ID", "PARENT_SERVICE_ID")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013451" ON "HYPERIC_OWNER"."EAM_SER
VICE" ("ID")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013447" ON "HYPERIC_OWNER"."EAM_SER
VER_TYPE" ("NAME")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013446" ON "HYPERIC_OWNER"."EAM_SER
VER_TYPE" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013442" ON "HYPERIC_OWNER"."EAM_SER
VER" ("PLATFORM_ID", "AUTOINVENTORYIDENTIFIER")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013441" ON "HYPERIC_OWNER"."EAM_SER
VER" ("ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013437" ON "HYPERIC_OWNER"."EAM_ROL
E_RESOURCE_GROUP_MAP" ("RESOURCE_GROUP_ID", "ROLE_ID")                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013434" ON "HYPERIC_OWNER"."EAM_ROL
E_OPERATION_MAP" ("ROLE_ID", "OPERATION_ID")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013431" ON "HYPERIC_OWNER"."EAM_ROL
E_CALENDAR" ("ROLE_ID", "CALENDAR_ID", "CALTYPE")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013430" ON "HYPERIC_OWNER"."EAM_ROL
E_CALENDAR" ("ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013424" ON "HYPERIC_OWNER"."EAM_ROL
E" ("NAME")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013423" ON "HYPERIC_OWNER"."EAM_ROL
E" ("ID")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013419" ON "HYPERIC_OWNER"."EAM_RES
_GRP_RES_MAP" ("RESOURCE_ID", "RESOURCE_GROUP_ID")                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013418" ON "HYPERIC_OWNER"."EAM_RES
_GRP_RES_MAP" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013413" ON "HYPERIC_OWNER"."EAM_RES
OURCE_TYPE" ("RESOURCE_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013412" ON "HYPERIC_OWNER"."EAM_RES
OURCE_TYPE" ("NAME")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013411" ON "HYPERIC_OWNER"."EAM_RES
OURCE_TYPE" ("ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013407" ON "HYPERIC_OWNER"."EAM_RES
OURCE_RELATION" ("NAME")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013406" ON "HYPERIC_OWNER"."EAM_RES
OURCE_RELATION" ("ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013401" ON "HYPERIC_OWNER"."EAM_RES
OURCE_GROUP" ("ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013396" ON "HYPERIC_OWNER"."EAM_RES
OURCE_EDGE" ("FROM_ID", "TO_ID", "REL_ID", "DISTANCE")                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013395" ON "HYPERIC_OWNER"."EAM_RES
OURCE_EDGE" ("ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013388" ON "HYPERIC_OWNER"."EAM_RES
OURCE_AUX_LOGS" ("ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013381" ON "HYPERIC_OWNER"."EAM_RES
OURCE" ("ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013377" ON "HYPERIC_OWNER"."EAM_REQ
UEST_STAT" ("ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013366" ON "HYPERIC_OWNER"."EAM_REG
ISTERED_TRIGGER" ("ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013361" ON "HYPERIC_OWNER"."EAM_PRI
NCIPAL" ("PRINCIPAL")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013360" ON "HYPERIC_OWNER"."EAM_PRI
NCIPAL" ("ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013355" ON "HYPERIC_OWNER"."EAM_PLU
GIN" ("NAME")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013354" ON "HYPERIC_OWNER"."EAM_PLU
GIN" ("ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013344" ON "HYPERIC_OWNER"."EAM_PLA
TFORM_TYPE" ("ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013340" ON "HYPERIC_OWNER"."EAM_PLA
TFORM_SERVER_TYPE_MAP" ("SERVER_TYPE_ID", "PLATFORM_TYPE_ID")                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013338" ON "HYPERIC_OWNER"."EAM_PLA
TFORM" ("FQDN")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013337" ON "HYPERIC_OWNER"."EAM_PLA
TFORM" ("ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013332" ON "HYPERIC_OWNER"."EAM_OPE
RATION" ("NAME", "RESOURCE_TYPE_ID")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013331" ON "HYPERIC_OWNER"."EAM_OPE
RATION" ("ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013327" ON "HYPERIC_OWNER"."EAM_NUM
BERS" ("I")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013325" ON "HYPERIC_OWNER"."EAM_MON
ITORABLE_TYPE" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013319" ON "HYPERIC_OWNER"."EAM_MET
RIC_PROB" ("MEASUREMENT_ID", "TIMESTAMP", "ADDITIONAL")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013313" ON "HYPERIC_OWNER"."EAM_MET
RIC_AUX_LOGS" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013307" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_TEMPL" ("ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013291" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_DATA_6H" ("TIMESTAMP", "MEASUREMENT_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013288" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_DATA_1H" ("TIMESTAMP", "MEASUREMENT_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013285" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_DATA_1D" ("TIMESTAMP", "MEASUREMENT_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013282" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_CAT" ("NAME")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013281" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_CAT" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013277" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT_BL" ("ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013272" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT" ("INSTANCE_ID", "TEMPLATE_ID")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013271" ON "HYPERIC_OWNER"."EAM_MEA
SUREMENT" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013262" ON "HYPERIC_OWNER"."EAM_IP"
 ("PLATFORM_ID", "ADDRESS")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013261" ON "HYPERIC_OWNER"."EAM_IP"
 ("ID")                                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013256" ON "HYPERIC_OWNER"."EAM_GTR
IGGER_TYPES" ("ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013252" ON "HYPERIC_OWNER"."EAM_GTR
IGGERS" ("ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013245" ON "HYPERIC_OWNER"."EAM_GAL
ERT_LOGS" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013236" ON "HYPERIC_OWNER"."EAM_GAL
ERT_DEFS" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013226" ON "HYPERIC_OWNER"."EAM_GAL
ERT_AUX_LOGS" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013218" ON "HYPERIC_OWNER"."EAM_GAL
ERT_ACTION_LOG" ("ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013212" ON "HYPERIC_OWNER"."EAM_EXE
C_STRATEGY_TYPES" ("ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013208" ON "HYPERIC_OWNER"."EAM_EXE
C_STRATEGIES" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013201" ON "HYPERIC_OWNER"."EAM_EVE
NT_LOG" ("ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013195" ON "HYPERIC_OWNER"."EAM_ESC
ALATION_STATE" ("ALERT_DEF_ID", "ALERT_TYPE")                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013194" ON "HYPERIC_OWNER"."EAM_ESC
ALATION_STATE" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013185" ON "HYPERIC_OWNER"."EAM_ESC
ALATION_ACTION" ("ESCALATION_ID", "IDX")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013180" ON "HYPERIC_OWNER"."EAM_ESC
ALATION" ("NAME")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013179" ON "HYPERIC_OWNER"."EAM_ESC
ALATION" ("ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013169" ON "HYPERIC_OWNER"."EAM_ERR
OR_CODE" ("ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013164" ON "HYPERIC_OWNER"."EAM_DAS
H_CONFIG" ("USER_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013163" ON "HYPERIC_OWNER"."EAM_DAS
H_CONFIG" ("ROLE_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013162" ON "HYPERIC_OWNER"."EAM_DAS
H_CONFIG" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013156" ON "HYPERIC_OWNER"."EAM_CRI
TERIA" ("ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013150" ON "HYPERIC_OWNER"."EAM_CRI
SPO_OPT" ("ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013145" ON "HYPERIC_OWNER"."EAM_CRI
SPO_ARRAY" ("OPT_ID", "IDX")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013141" ON "HYPERIC_OWNER"."EAM_CRI
SPO" ("ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013138" ON "HYPERIC_OWNER"."EAM_CPR
OP_KEY" ("APPDEF_TYPE", "APPDEF_TYPEID", "PROPKEY")                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013137" ON "HYPERIC_OWNER"."EAM_CPR
OP_KEY" ("ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013130" ON "HYPERIC_OWNER"."EAM_CPR
OP" ("APPDEF_ID", "KEYID", "VALUE_IDX")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013129" ON "HYPERIC_OWNER"."EAM_CPR
OP" ("ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013122" ON "HYPERIC_OWNER"."EAM_CON
TROL_SCHEDULE" ("JOBNAME")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013121" ON "HYPERIC_OWNER"."EAM_CON
TROL_SCHEDULE" ("TRIGGERNAME")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013120" ON "HYPERIC_OWNER"."EAM_CON
TROL_SCHEDULE" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013109" ON "HYPERIC_OWNER"."EAM_CON
TROL_HISTORY" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013097" ON "HYPERIC_OWNER"."EAM_CON
FIG_RESPONSE" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013093" ON "HYPERIC_OWNER"."EAM_CON
FIG_PROPS" ("PREFIX", "PROPKEY")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013092" ON "HYPERIC_OWNER"."EAM_CON
FIG_PROPS" ("ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013089" ON "HYPERIC_OWNER"."EAM_CAL
ENDAR_WEEK" ("CALENDAR_WEEK_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013084" ON "HYPERIC_OWNER"."EAM_CAL
ENDAR_ENT" ("ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013080" ON "HYPERIC_OWNER"."EAM_CAL
ENDAR" ("NAME")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013079" ON "HYPERIC_OWNER"."EAM_CAL
ENDAR" ("ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013075" ON "HYPERIC_OWNER"."EAM_AUT
OINV_SCHEDULE" ("SCANNAME")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013074" ON "HYPERIC_OWNER"."EAM_AUT
OINV_SCHEDULE" ("JOBNAME")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013073" ON "HYPERIC_OWNER"."EAM_AUT
OINV_SCHEDULE" ("TRIGGERNAME")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013072" ON "HYPERIC_OWNER"."EAM_AUT
OINV_SCHEDULE" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013063" ON "HYPERIC_OWNER"."EAM_AUT
OINV_HISTORY" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013050" ON "HYPERIC_OWNER"."EAM_AUD
IT" ("ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013037" ON "HYPERIC_OWNER"."EAM_APP
_TYPE_SERVICE_TYPE_MAP" ("SERVICE_TYPE_ID", "APPLICATION_TYPE_ID")              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013035" ON "HYPERIC_OWNER"."EAM_APP
_SERVICE" ("SERVICE_ID", "GROUP_ID", "APPLICATION_ID")                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013034" ON "HYPERIC_OWNER"."EAM_APP
_SERVICE" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013029" ON "HYPERIC_OWNER"."EAM_APP
LICATION_TYPE" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013025" ON "HYPERIC_OWNER"."EAM_APP
LICATION" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013021" ON "HYPERIC_OWNER"."EAM_ALE
RT_DEF_STATE" ("ALERT_DEFINITION_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013018" ON "HYPERIC_OWNER"."EAM_ALE
RT_DEFINITION" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013004" ON "HYPERIC_OWNER"."EAM_ALE
RT_CONDITION_LOG" ("ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0013002" ON "HYPERIC_OWNER"."EAM_ALE
RT_CONDITION" ("ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012997" ON "HYPERIC_OWNER"."EAM_ALE
RT_ACTION_LOG" ("ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012992" ON "HYPERIC_OWNER"."EAM_ALE
RT" ("ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012986" ON "HYPERIC_OWNER"."EAM_AIQ
_SERVICE" ("ID")                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012980" ON "HYPERIC_OWNER"."EAM_AIQ
_SERVER" ("AIQ_PLATFORM_ID", "AUTOINVENTORYIDENTIFIER")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012979" ON "HYPERIC_OWNER"."EAM_AIQ
_SERVER" ("ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012974" ON "HYPERIC_OWNER"."EAM_AIQ
_PLATFORM" ("CERTDN")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012973" ON "HYPERIC_OWNER"."EAM_AIQ
_PLATFORM" ("FQDN")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012972" ON "HYPERIC_OWNER"."EAM_AIQ
_PLATFORM" ("NAME")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012971" ON "HYPERIC_OWNER"."EAM_AIQ
_PLATFORM" ("ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012965" ON "HYPERIC_OWNER"."EAM_AIQ
_IP" ("AIQ_PLATFORM_ID", "ADDRESS")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012964" ON "HYPERIC_OWNER"."EAM_AIQ
_IP" ("ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012960" ON "HYPERIC_OWNER"."EAM_AGE
NT_TYPE" ("ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012957" ON "HYPERIC_OWNER"."EAM_AGE
NT_PLUGIN_STATUS" ("ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012949" ON "HYPERIC_OWNER"."EAM_AGE
NT" ("AGENTTOKEN")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012948" ON "HYPERIC_OWNER"."EAM_AGE
NT" ("ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "HYPERIC_OWNER"."SYS_C0012939" ON "HYPERIC_OWNER"."EAM_ACT
ION" ("ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SVC_TYPE_SERVER_TYPE_ID_IDX" ON "HYPERIC_OWNER".
"EAM_SERVICE_TYPE" ("SERVER_TYPE_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SVC_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_SERVICE
" ("SERVICE_TYPE_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SVC_CONFIG_RESP_ID_IDX" ON "HYPERIC_OWNER"."EAM_
SERVICE" ("CONFIG_RESPONSE_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SUBJECT_ID_IDX" ON "HYPERIC_OWNER"."EAM_AUDIT" (
"SUBJECT_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."STAT_ERRORS_REQSTAT" ON "HYPERIC_OWNER"."EAM_STA
T_ERRORS" ("REQSTAT_ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."STAT_ERRORS_ERROR_ID_IDX" ON "HYPERIC_OWNER"."EA
M_STAT_ERRORS" ("ERROR_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVICE_RESOURCE_ID_IDX" ON "HYPERIC_OWNER"."EAM
_SERVICE" ("RESOURCE_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVICE_REQUEST_URL" ON "HYPERIC_OWNER"."EAM_SER
VICE_REQUEST" ("URL")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVICE_REQUEST_SVCID" ON "HYPERIC_OWNER"."EAM_S
ERVICE_REQUEST" ("SERVICEID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVICE_ID" ON "HYPERIC_OWNER"."EAM_REQUEST_STAT
" ("SVCREQ_ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVER_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_SERV
ER" ("SERVER_TYPE_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVER_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_SERVE
R" ("RESOURCE_ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."SERVER_CONFIG_RESPONSE_ID_IDX" ON "HYPERIC_OWNER
"."EAM_SERVER" ("CONFIG_RESPONSE_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."RSRC_AUX_LOG_IDX" ON "HYPERIC_OWNER"."EAM_RESOUR
CE_AUX_LOGS" ("DEF_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ROLE_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_ROLE" (
"RESOURCE_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ROLE_RES_GRP_ROLE_ID_IDX" ON "HYPERIC_OWNER"."EA
M_ROLE_RESOURCE_GROUP_MAP" ("ROLE_ID")                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ROLE_OP_ID_IDX" ON "HYPERIC_OWNER"."EAM_ROLE_OPE
RATION_MAP" ("OPERATION_ID")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ROLE_CAL_ID_IDX" ON "HYPERIC_OWNER"."EAM_ROLE_CA
LENDAR" ("CALENDAR_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."RES_PROTO_IDX" ON "HYPERIC_OWNER"."EAM_RESOURCE_
GROUP" ("RESOURCE_PROTOTYPE")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."RES_GRP_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_RESO
URCE_GROUP" ("RESOURCE_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."RESOURCE_ID_IDX" ON "HYPERIC_OWNER"."EAM_AUDIT" 
("RESOURCE_ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."REQSTAT_IDX_ENDTIME" ON "HYPERIC_OWNER"."EAM_REQ
UEST_STAT" ("ENDTIME")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."REQSTAT_IDX_BEGINTIME" ON "HYPERIC_OWNER"."EAM_R
EQUEST_STAT" ("BEGINTIME")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."REL_ID_IDX" ON "HYPERIC_OWNER"."EAM_RESOURCE_EDG
E" ("REL_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."PREF_CRISPO_ID_IDX" ON "HYPERIC_OWNER"."EAM_SUBJ
ECT" ("PREF_CRISPO_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."PLATFORM_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_PL
ATFORM" ("PLATFORM_TYPE_ID")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."PLATFORM_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_PLA
TFORM" ("RESOURCE_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."PARENT_SERVICE_ID_IDX" ON "HYPERIC_OWNER"."EAM_S
ERVICE" ("PARENT_SERVICE_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."PARENT_ID_IDX" ON "HYPERIC_OWNER"."EAM_AUDIT" ("
PARENT_ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."OP_RES_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_OPER
ATION" ("RESOURCE_TYPE_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_COMPAT_MID_IDX" ON "HYPERIC_OWNER"."
HQ_METRIC_DATA_COMPAT" ("MEASUREMENT_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_8D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_8D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_8D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_8D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_7D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_7D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_7D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_7D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_6D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_6D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_6D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_6D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_5D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_5D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_5D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_5D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_4D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_4D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_4D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_4D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_3D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_3D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_3D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_3D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_2D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_2D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_2D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_2D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_1D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_1D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_1D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_1D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_0D_1S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_0D_1S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_DATA_0D_0S_MID_IDX" ON "HYPERIC_OWNER"."H
Q_METRIC_DATA_0D_0S" ("MEASUREMENT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_BASELINE_CALCULATED_IDX" ON "HYPERIC_OWNE
R"."EAM_MEASUREMENT_BL" ("MEASUREMENT_ID", "COMPUTE_TIME")                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_AUX_LOG_ID_IDX" ON "HYPERIC_OWNER"."EAM_R
ESOURCE_AUX_LOGS" ("AUX_LOG_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."METRIC_AUX_LOG_IDX" ON "HYPERIC_OWNER"."EAM_METR
IC_AUX_LOGS" ("DEF_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."MEAS_TEMPLATE_ID" ON "HYPERIC_OWNER"."EAM_MEASUR
EMENT" ("TEMPLATE_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."MEAS_RES_IDX" ON "HYPERIC_OWNER"."EAM_MEASUREMEN
T" ("RESOURCE_ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."MEASUREMENT_DATA_6H_MID_IDX" ON "HYPERIC_OWNER".
"EAM_MEASUREMENT_DATA_6H" ("MEASUREMENT_ID")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."MEASUREMENT_DATA_1H_MID_IDX" ON "HYPERIC_OWNER".
"EAM_MEASUREMENT_DATA_1H" ("MEASUREMENT_ID")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."MEASUREMENT_DATA_1D_MID_IDX" ON "HYPERIC_OWNER".
"EAM_MEASUREMENT_DATA_1D" ("MEASUREMENT_ID")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."KEYID_IDX" ON "HYPERIC_OWNER"."EAM_CPROP" ("KEYI
D")                                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GTRIGGERS_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_G
TRIGGERS" ("TYPE_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GTRIGGERS_STRAT_ID_IDX" ON "HYPERIC_OWNER"."EAM_
GTRIGGERS" ("STRAT_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GTRIGGERS_CONFIG_ID_IDX" ON "HYPERIC_OWNER"."EAM
_GTRIGGERS" ("CONFIG_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GROUP_MEMBER_IDX" ON "HYPERIC_OWNER"."EAM_RES_GR
P_RES_MAP" ("RESOURCE_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GROUP_GROUP_IDX" ON "HYPERIC_OWNER"."EAM_RES_GRP
_RES_MAP" ("RESOURCE_GROUP_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_LOGS_DEF_ID_IDX" ON "HYPERIC_OWNER"."EAM_
GALERT_LOGS" ("DEF_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_DEFS_GROUP_ID_IDX" ON "HYPERIC_OWNER"."EA
M_GALERT_DEFS" ("GROUP_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_DEFS_ESC_ID_IDX" ON "HYPERIC_OWNER"."EAM_
GALERT_DEFS" ("ESCALATION_ID")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_AUX_LOGS_PARENT_IDX" ON "HYPERIC_OWNER"."
EAM_GALERT_AUX_LOGS" ("PARENT")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_ACTION_SUBJECT_ID_IDX" ON "HYPERIC_OWNER"
."EAM_GALERT_ACTION_LOG" ("SUBJECT_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_ACTION_LOG_IDX" ON "HYPERIC_OWNER"."EAM_G
ALERT_ACTION_LOG" ("GALERT_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."GALERT_ACTION_ID_IDX" ON "HYPERIC_OWNER"."EAM_GA
LERT_ACTION_LOG" ("ACTION_ID")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EXEC_STRATEGIES_TYPE_ID_IDX" ON "HYPERIC_OWNER".
"EAM_EXEC_STRATEGIES" ("TYPE_ID")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EXEC_STRATEGIES_DEF_ID_IDX" ON "HYPERIC_OWNER"."
EAM_EXEC_STRATEGIES" ("DEF_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EXEC_STRATEGIES_CONFIG_ID_IDX" ON "HYPERIC_OWNER
"."EAM_EXEC_STRATEGIES" ("CONFIG_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EVENT_LOG_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_EV
ENT_LOG" ("RESOURCE_ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EVENT_LOG_IDX" ON "HYPERIC_OWNER"."EAM_EVENT_LOG
" ("TIMESTAMP", "RESOURCE_ID")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ESC_ACTION_ID_IDX" ON "HYPERIC_OWNER"."EAM_ESCAL
ATION_ACTION" ("ACTION_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ERROR_CODE" ON "HYPERIC_OWNER"."EAM_ERROR_CODE" 
("CODE")                                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_SUBJECT_RESOURCE_IDX" ON "HYPERIC_OWNER"."EA
M_SUBJECT" ("RESOURCE_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_SERVICE_AIID_IDX" ON "HYPERIC_OWNER"."EAM_SE
RVICE" ("SERVER_ID", "AUTOINVENTORYIDENTIFIER")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_SERVER_TYPE_PLUGIN_IDX" ON "HYPERIC_OWNER"."
EAM_SERVER_TYPE" ("PLUGIN")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_RESOURCE_TO_ID_IDX" ON "HYPERIC_OWNER"."EAM_
RESOURCE_EDGE" ("TO_ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_RESOURCE_PROTO_IDX" ON "HYPERIC_OWNER"."EAM_
RESOURCE" ("PROTO_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_RESOURCE_OWNER_ID_IDX" ON "HYPERIC_OWNER"."E
AM_RESOURCE" ("SUBJECT_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_RESOURCE_INSTANCE_ID_IDX" ON "HYPERIC_OWNER"
."EAM_RESOURCE" ("INSTANCE_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."EAM_GALERT_LOGS_TIME_IDX" ON "HYPERIC_OWNER"."EA
M_GALERT_LOGS" ("TIMESTAMP")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ACTION_ALERT_DEFINITION_ID_IDX" ON "HYPERIC_OWNE
R"."EAM_ACTION" ("ALERT_DEFINITION_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ACTION_CHILD_IDX" ON "HYPERIC_OWNER"."EAM_ACTION
" ("PARENT_ID")                                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AGENT_ID" ON "HYPERIC_OWNER"."EAM_AGENT_PLUGIN_S
TATUS" ("AGENT_ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AGENT_ID_IDX" ON "HYPERIC_OWNER"."EAM_PLATFORM" 
("AGENT_ID")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AGENT_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_AGENT
" ("AGENT_TYPE_ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AIQ_PLATFORM_AGENTTOKEN_IDX" ON "HYPERIC_OWNER".
"EAM_AIQ_PLATFORM" ("AGENTTOKEN")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AIQ_SERVER_NAME" ON "HYPERIC_OWNER"."EAM_AIQ_SER
VER" ("NAME")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AIQ_SERVICE_NAME_IDX" ON "HYPERIC_OWNER"."EAM_AI
Q_SERVICE" ("NAME")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AIQ_SVC_SERVER_ID_IDX" ON "HYPERIC_OWNER"."EAM_A
IQ_SERVICE" ("SERVER_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AI_HIST_SCANNAME_IDX" ON "HYPERIC_OWNER"."EAM_AU
TOINV_HISTORY" ("SCANNAME")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AI_SCHEDULE_ENTITY_IDX" ON "HYPERIC_OWNER"."EAM_
AUTOINV_SCHEDULE" ("ENTITY_ID", "ENTITY_TYPE")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AI_SCHEDULE_NEXTFIRETIME_IDX" ON "HYPERIC_OWNER"
."EAM_AUTOINV_SCHEDULE" ("NEXTFIRETIME")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_ACTION_ID_IDX" ON "HYPERIC_OWNER"."EAM_ALE
RT_ACTION_LOG" ("ACTION_ID")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_ACTION_LOG_IDX" ON "HYPERIC_OWNER"."EAM_AL
ERT_ACTION_LOG" ("ALERT_ID")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_ACTION_SUBJ_ID_IDX" ON "HYPERIC_OWNER"."EA
M_ALERT_ACTION_LOG" ("SUBJECT_ID")                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_ALERTDEFINITION_IDX" ON "HYPERIC_OWNER"."E
AM_ALERT" ("ALERT_DEFINITION_ID")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_CONDITION_ID_IDX" ON "HYPERIC_OWNER"."EAM_
ALERT_CONDITION_LOG" ("CONDITION_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_COND_ALERT_DEF_IDX" ON "HYPERIC_OWNER"."EA
M_ALERT_CONDITION" ("ALERT_DEFINITION_ID")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_COND_LOG_IDX" ON "HYPERIC_OWNER"."EAM_ALER
T_CONDITION_LOG" ("ALERT_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_COND_TRIGGER_ID_IDX" ON "HYPERIC_OWNER"."E
AM_ALERT_CONDITION" ("TRIGGER_ID")                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_DEF_CHILD_IDX" ON "HYPERIC_OWNER"."EAM_ALE
RT_DEFINITION" ("PARENT_ID", "PRIORITY")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_DEF_ESC_ID_IDX" ON "HYPERIC_OWNER"."EAM_AL
ERT_DEFINITION" ("ESCALATION_ID")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_DEF_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_AL
ERT_DEFINITION" ("RESOURCE_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_DEF_TRIGGER_IDX" ON "HYPERIC_OWNER"."EAM_R
EGISTERED_TRIGGER" ("ALERT_DEFINITION_ID")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."ALERT_TIME_IDX" ON "HYPERIC_OWNER"."EAM_ALERT" (
"CTIME")                                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APP_RES_ID_IDX" ON "HYPERIC_OWNER"."EAM_APPLICAT
ION" ("RESOURCE_ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APP_SVC_APP_ID_IDX" ON "HYPERIC_OWNER"."EAM_APP_
SERVICE" ("APPLICATION_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APP_SVC_GRP_ID_IDX" ON "HYPERIC_OWNER"."EAM_APP_
SERVICE" ("GROUP_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APP_SVC_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_APP
_SERVICE" ("SERVICE_TYPE_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APP_TYPE_ID_IDX" ON "HYPERIC_OWNER"."EAM_APPLICA
TION" ("APPLICATION_TYPE_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APS_FILE_NAME_IDX" ON "HYPERIC_OWNER"."EAM_AGENT
_PLUGIN_STATUS" ("FILE_NAME")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APS_MD5_IDX" ON "HYPERIC_OWNER"."EAM_AGENT_PLUGI
N_STATUS" ("MD5")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."APS_PLUGIN_NAME_IDX" ON "HYPERIC_OWNER"."EAM_AGE
NT_PLUGIN_STATUS" ("PLUGIN_NAME")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AUX_LOG_DEF_IDX" ON "HYPERIC_OWNER"."EAM_GALERT_
AUX_LOGS" ("DEF_ID")                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AUX_LOG_GALERT_ID" ON "HYPERIC_OWNER"."EAM_GALER
T_AUX_LOGS" ("GALERT_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AUX_LOG_ID_IDX" ON "HYPERIC_OWNER"."EAM_METRIC_A
UX_LOGS" ("AUX_LOG_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AUX_LOG_METRIC_ID_IDX" ON "HYPERIC_OWNER"."EAM_M
ETRIC_AUX_LOGS" ("METRIC_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."AVAIL_RLE_ENDTIME_VAL_IDX" ON "HYPERIC_OWNER"."H
Q_AVAIL_DATA_RLE" ("ENDTIME", "AVAILVAL")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CALENDAR_ID_IDX" ON "HYPERIC_OWNER"."EAM_CALENDA
R_ENT" ("CALENDAR_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CONFIG_RESPONSE_ID_IDX" ON "HYPERIC_OWNER"."EAM_
PLATFORM" ("CONFIG_RESPONSE_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CRESP_ERR_IDX" ON "HYPERIC_OWNER"."EAM_CONFIG_RE
SPONSE" ("VALIDATIONERR")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CRISPO_IDX" ON "HYPERIC_OWNER"."EAM_CRISPO_OPT" 
("CRISPO_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CRITERIA_RESOURCE_ID_PROP_IDX" ON "HYPERIC_OWNER
"."EAM_CRITERIA" ("RESOURCE_ID_PROP")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CRITERIA_RES_GRP_ID_IDX" ON "HYPERIC_OWNER"."EAM
_CRITERIA" ("RESOURCE_GROUP_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CTL_HISTORY_STARTTIME_IDX" ON "HYPERIC_OWNER"."E
AM_CONTROL_HISTORY" ("STARTTIME")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CTL_SCHEDULE_ENTITY_IDX" ON "HYPERIC_OWNER"."EAM
_CONTROL_SCHEDULE" ("ENTITY_ID", "ENTITY_TYPE")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."CTL_SCHEDULE_NEXTFIRETIME_IDX" ON "HYPERIC_OWNER
"."EAM_CONTROL_SCHEDULE" ("NEXTFIRETIME")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."DASH_CONFIG_CRISPO_ID_IDX" ON "HYPERIC_OWNER"."E
AM_DASH_CONFIG" ("CRISPO_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "HYPERIC_OWNER"."DEPENDENT_SVC_ID_IDX" ON "HYPERIC_OWNER"."EAM_SE
RVICE_DEP_MAP" ("DEPENDENT_SERVICE_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NOCOMPRESS LOG
GING                                                                            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ACTION_ID_SEQ"  MINVALUE 1 MAXVALUE 999
9999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  NOC
YCLE                                                                            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_UPDATE_STATUS_ID_SEQ"  MINVALUE 1 MAXVA
LUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORD
ER  NOCYCLE                                                                     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_UI_VIEW_ID_SEQ"  MINVALUE 1 MAXVALUE 99
99999999999999999999999999 INCREMENT BY 1 START WITH 10201 CACHE 100 NOORDER  NO
CYCLE                                                                           
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_UI_PLUGIN_ID_SEQ"  MINVALUE 1 MAXVALUE 
9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  
NOCYCLE                                                                         
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_UI_ATTACHMENT_ID_SEQ"  MINVALUE 1 MAXVA
LUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10201 CACHE 100 NOORD
ER  NOCYCLE                                                                     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SUBJECT_ID_SEQ"  MINVALUE 1 MAXVALUE 99
99999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  NO
CYCLE                                                                           
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_STAT_ERRORS_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SERVICE_TYPE_ID_SEQ"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10701 CACHE 100 NOORDE
R  NOCYCLE                                                                      
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SERVICE_REQUEST_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SERVICE_ID_SEQ"  MINVALUE 1 MAXVALUE 99
99999999999999999999999999 INCREMENT BY 1 START WITH 10132 CACHE 100 NOORDER  NO
CYCLE                                                                           
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SERVICE_DEP_MAP_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SERVER_TYPE_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10201 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_SERVER_ID_SEQ"  MINVALUE 1 MAXVALUE 999
9999999999999999999999999 INCREMENT BY 1 START WITH 10032 CACHE 100 NOORDER  NOC
YCLE                                                                            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ROLE_ID_SEQ"  MINVALUE 1 MAXVALUE 99999
99999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  NOCYC
LE                                                                              
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ROLE_CALENDAR_ID_SEQ"  MINVALUE 1 MAXVA
LUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORD
ER  NOCYCLE                                                                     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RES_GRP_RES_MAP_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11038 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RESOURCE_TYPE_ID_SEQ"  MINVALUE 1 MAXVA
LUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORD
ER  NOCYCLE                                                                     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RESOURCE_RELATION_ID_SEQ"  MINVALUE 1 M
AXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 N
OORDER  NOCYCLE                                                                 
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RESOURCE_ID_SEQ"  MINVALUE 1 MAXVALUE 9
999999999999999999999999999 INCREMENT BY 1 START WITH 11038 CACHE 100 NOORDER  N
OCYCLE                                                                          
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RESOURCE_GROUP_ID_SEQ"  MINVALUE 1 MAXV
ALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOOR
DER  NOCYCLE                                                                    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RESOURCE_EDGE_ID_SEQ"  MINVALUE 1 MAXVA
LUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11624 CACHE 100 NOORD
ER  NOCYCLE                                                                     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_RESOURCE_AUX_LOG_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_REQUEST_STAT_ID_SEQ"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDE
R  NOCYCLE                                                                      
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_REGISTERED_TRIGGER_ID_SEQ"  MINVALUE 1 
MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 
NOORDER  NOCYCLE                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_PRINCIPAL_ID_SEQ"  MINVALUE 1 MAXVALUE 
9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  
NOCYCLE                                                                         
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_PLUGIN_ID_SEQ"  MINVALUE 1 MAXVALUE 999
9999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  NOC
YCLE                                                                            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_PLATFORM_TYPE_ID_SEQ"  MINVALUE 1 MAXVA
LUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORD
ER  NOCYCLE                                                                     
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_PLATFORM_ID_SEQ"  MINVALUE 1 MAXVALUE 9
999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  N
OCYCLE                                                                          
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_OPERATION_ID_SEQ"  MINVALUE 1 MAXVALUE 
9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  
NOCYCLE                                                                         
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_MONITORABLE_TYPE_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10901 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_METRIC_AUX_LOG_ID_SEQ"  MINVALUE 1 MAXV
ALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOOR
DER  NOCYCLE                                                                    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_MEASUREMENT_TEMPL_ID_SEQ"  MINVALUE 1 M
AXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 28701 CACHE 100 N
OORDER  NOCYCLE                                                                 
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_MEASUREMENT_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 11955 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_MEASUREMENT_CAT_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_MEASUREMENT_BL_ID_SEQ"  MINVALUE 1 MAXV
ALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOOR
DER  NOCYCLE                                                                    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_IP_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999
999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  NOCYCLE
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_GTRIGGER_TYPES_ID_SEQ"  MINVALUE 1 MAXV
ALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOOR
DER  NOCYCLE                                                                    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_GTRIGGERS_ID_SEQ"  MINVALUE 1 MAXVALUE 
9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  
NOCYCLE                                                                         
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_GALERT_LOGS_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_GALERT_DEFS_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_GALERT_AUX_LOGS_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_GALERT_ACTION_LOG_ID_SEQ"  MINVALUE 1 M
AXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 N
OORDER  NOCYCLE                                                                 
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_EXEC_STRATEGY_TYPES_ID_SEQ"  MINVALUE 1
 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100
 NOORDER  NOCYCLE                                                               
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_EXEC_STRATEGIES_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_EVENT_LOG_ID_SEQ"  MINVALUE 1 MAXVALUE 
9999999999999999999999999999 INCREMENT BY 1 START WITH 48526 CACHE 100 NOORDER  
NOCYCLE                                                                         
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ESCALATION_STATE_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ESCALATION_ID_SEQ"  MINVALUE 1 MAXVALUE
 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER 
 NOCYCLE                                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ERROR_CODE_ID_SEQ"  MINVALUE 1 MAXVALUE
 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER 
 NOCYCLE                                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_DASH_CONFIG_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CRITERIA_ID_SEQ"  MINVALUE 1 MAXVALUE 9
999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  N
OCYCLE                                                                          
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CRISPO_OPT_ID_SEQ"  MINVALUE 1 MAXVALUE
 9999999999999999999999999999 INCREMENT BY 1 START WITH 10036 CACHE 100 NOORDER 
 NOCYCLE                                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CRISPO_ID_SEQ"  MINVALUE 1 MAXVALUE 999
9999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  NOC
YCLE                                                                            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CPROP_KEY_ID_SEQ"  MINVALUE 1 MAXVALUE 
9999999999999999999999999999 INCREMENT BY 1 START WITH 10901 CACHE 100 NOORDER  
NOCYCLE                                                                         
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CPROP_ID_SEQ"  MINVALUE 1 MAXVALUE 9999
999999999999999999999999 INCREMENT BY 1 START WITH 10213 CACHE 100 NOORDER  NOCY
CLE                                                                             
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CONTROL_SCHEDULE_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CONTROL_HISTORY_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CONFIG_RESPONSE_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10166 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CONFIG_PROPS_ID_SEQ"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDE
R  NOCYCLE                                                                      
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CALENDAR_ID_SEQ"  MINVALUE 1 MAXVALUE 9
999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER  N
OCYCLE                                                                          
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_CALENDAR_ENT_ID_SEQ"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDE
R  NOCYCLE                                                                      
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AUTOINV_SCHEDULE_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AUTOINV_HISTORY_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AUDIT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999
999999999999999999999999 INCREMENT BY 1 START WITH 11609 CACHE 100 NOORDER  NOCY
CLE                                                                             
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_APP_SERVICE_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_APPLICATION_TYPE_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_APPLICATION_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ALERT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999
999999999999999999999999 INCREMENT BY 1 START WITH 48526 CACHE 100 NOORDER  NOCY
CLE                                                                             
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ALERT_DEFINITION_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ALERT_CONDITION_LOG_ID_SEQ"  MINVALUE 1
 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 48526 CACHE 100
 NOORDER  NOCYCLE                                                               
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ALERT_CONDITION_ID_SEQ"  MINVALUE 1 MAX
VALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOO
RDER  NOCYCLE                                                                   
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_ALERT_ACTION_LOG_ID_SEQ"  MINVALUE 1 MA
XVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 49426 CACHE 100 NO
ORDER  NOCYCLE                                                                  
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AIQ_SERVICE_ID_SEQ"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER
  NOCYCLE                                                                       
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AIQ_SERVER_ID_SEQ"  MINVALUE 1 MAXVALUE
 9999999999999999999999999999 INCREMENT BY 1 START WITH 10141 CACHE 100 NOORDER 
 NOCYCLE                                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AIQ_PLATFORM_ID_SEQ"  MINVALUE 1 MAXVAL
UE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10105 CACHE 100 NOORDE
R  NOCYCLE                                                                      
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AIQ_IP_ID_SEQ"  MINVALUE 1 MAXVALUE 999
9999999999999999999999999 INCREMENT BY 1 START WITH 10109 CACHE 100 NOORDER  NOC
YCLE                                                                            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AGENT_TYPE_ID_SEQ"  MINVALUE 1 MAXVALUE
 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 CACHE 100 NOORDER 
 NOCYCLE                                                                        
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AGENT_PLUGIN_STATUS_ID_SEQ"  MINVALUE 1
 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10201 CACHE 100
 NOORDER  NOCYCLE                                                               
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "HYPERIC_OWNER"."EAM_AGENT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999
999999999999999999999999 INCREMENT BY 1 START WITH 10101 CACHE 100 NOORDER  NOCY
CLE                                                                             
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ACTION"                                     
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CLASSNAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                
	"CONFIG" BLOB,                                                                 
	"PARENT_ID" NUMBER(10,0),                                                      
	"ALERT_DEFINITION_ID" NUMBER(10,0),                                            
	"DELETED" NUMBER(1,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD0189B04B5AF9D12" FOREIGN KEY ("ALERT_DEFINITION_ID")           
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT_DEFINITION" ("ID") ON DELETE CASCADE EN
ABLE,                                                                           
	 CONSTRAINT "FKD0189B04C0BB4C7" FOREIGN KEY ("PARENT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_ACTION" ("ID") ON DELETE CASCADE ENABLE      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("CONFIG") STORE AS BASICFILE (                                            
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_TRIGGER_LISTENERS"                         
   (	"TRIGGER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                         
	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"TRIGGER_LISTENER" VARCHAR2(200 CHAR) NOT NULL ENABLE,                         
	 PRIMARY KEY ("TRIGGER_NAME", "TRIGGER_GROUP", "TRIGGER_LISTENER")             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "EAM_FK_QTL_QT" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP")      
	  REFERENCES "HYPERIC_OWNER"."QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP") 
ON DELETE CASCADE ENABLE                                                        
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_TRIGGERS"                                  
   (	"TRIGGER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                         
	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"JOB_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                 
	"JOB_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                
	"IS_VOLATILE" NUMBER(1,0) NOT NULL ENABLE,                                     
	"DESCRIPTION" VARCHAR2(250 CHAR),                                              
	"NEXT_FIRE_TIME" NUMBER(19,0),                                                 
	"PREV_FIRE_TIME" NUMBER(19,0),                                                 
	"TRIGGER_STATE" VARCHAR2(16 CHAR) NOT NULL ENABLE,                             
	"TRIGGER_TYPE" VARCHAR2(8 CHAR) NOT NULL ENABLE,                               
	"START_TIME" NUMBER(19,0) NOT NULL ENABLE,                                     
	"END_TIME" NUMBER(19,0),                                                       
	"CALENDAR_NAME" VARCHAR2(200 CHAR),                                            
	"MISFIRE_INSTR" NUMBER(10,0),                                                  
	"JOB_DATA" BLOB,                                                               
	"PRIORITY" NUMBER(10,0),                                                       
	 PRIMARY KEY ("TRIGGER_NAME", "TRIGGER_GROUP")                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "EAM_FK_QT_QJD" FOREIGN KEY ("JOB_NAME", "JOB_GROUP")              
	  REFERENCES "HYPERIC_OWNER"."QRTZ_JOB_DETAILS" ("JOB_NAME", "JOB_GROUP") ON DE
LETE CASCADE ENABLE                                                             
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("JOB_DATA") STORE AS BASICFILE (                                          
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_SIMPLE_TRIGGERS"                           
   (	"TRIGGER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                         
	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"REPEAT_COUNT" NUMBER(19,0) NOT NULL ENABLE,                                   
	"REPEAT_INTERVAL" NUMBER(19,0) NOT NULL ENABLE,                                
	"TIMES_TRIGGERED" NUMBER(19,0) NOT NULL ENABLE,                                
	 PRIMARY KEY ("TRIGGER_NAME", "TRIGGER_GROUP")                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "EAM_FK_QST_QT" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP")      
	  REFERENCES "HYPERIC_OWNER"."QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP") 
ENABLE                                                                          
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_SCHEDULER_STATE"                           
   (	"INSTANCE_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                        
	"LAST_CHECKIN_TIME" NUMBER(19,0) NOT NULL ENABLE,                              
	"CHECKIN_INTERVAL" NUMBER(19,0) NOT NULL ENABLE,                               
	 PRIMARY KEY ("INSTANCE_NAME")                                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_PAUSED_TRIGGER_GRPS"                       
   (	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                        
	 PRIMARY KEY ("TRIGGER_GROUP")                                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_LOCKS"                                     
   (	"LOCK_NAME" VARCHAR2(40 CHAR) NOT NULL ENABLE,                             
	 PRIMARY KEY ("LOCK_NAME")                                                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_JOB_LISTENERS"                             
   (	"JOB_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                             
	"JOB_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                
	"JOB_LISTENER" VARCHAR2(200 CHAR) NOT NULL ENABLE,                             
	 PRIMARY KEY ("JOB_NAME", "JOB_GROUP", "JOB_LISTENER")                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "EAM_FK_QJL_QJD" FOREIGN KEY ("JOB_NAME", "JOB_GROUP")             
	  REFERENCES "HYPERIC_OWNER"."QRTZ_JOB_DETAILS" ("JOB_NAME", "JOB_GROUP") ON DE
LETE CASCADE ENABLE                                                             
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_JOB_DETAILS"                               
   (	"JOB_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                             
	"JOB_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                
	"DESCRIPTION" VARCHAR2(250 CHAR),                                              
	"JOB_CLASS_NAME" VARCHAR2(250 CHAR) NOT NULL ENABLE,                           
	"IS_DURABLE" NUMBER(1,0) NOT NULL ENABLE,                                      
	"IS_VOLATILE" NUMBER(1,0) NOT NULL ENABLE,                                     
	"IS_STATEFUL" NUMBER(1,0) NOT NULL ENABLE,                                     
	"REQUESTS_RECOVERY" NUMBER(1,0) NOT NULL ENABLE,                               
	"JOB_DATA" BLOB,                                                               
	 PRIMARY KEY ("JOB_NAME", "JOB_GROUP")                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("JOB_DATA") STORE AS BASICFILE (                                          
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_FIRED_TRIGGERS"                            
   (	"ENTRY_ID" VARCHAR2(95 CHAR) NOT NULL ENABLE,                              
	"TRIGGER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                             
	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"INSTANCE_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"FIRED_TIME" NUMBER(19,0) NOT NULL ENABLE,                                     
	"STATE" VARCHAR2(16 CHAR) NOT NULL ENABLE,                                     
	"IS_VOLATILE" NUMBER(1,0) NOT NULL ENABLE,                                     
	"JOB_NAME" VARCHAR2(200 CHAR),                                                 
	"JOB_GROUP" VARCHAR2(200 CHAR),                                                
	"IS_STATEFUL" NUMBER(1,0),                                                     
	"REQUESTS_RECOVERY" NUMBER(1,0),                                               
	"PRIORITY" NUMBER(10,0) NOT NULL ENABLE,                                       
	 PRIMARY KEY ("ENTRY_ID")                                                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_CRON_TRIGGERS"                             
   (	"TRIGGER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                         
	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"CRON_EXPRESSION" VARCHAR2(200 CHAR) NOT NULL ENABLE,                          
	"TIME_ZONE_ID" VARCHAR2(80 CHAR),                                              
	 PRIMARY KEY ("TRIGGER_NAME", "TRIGGER_GROUP")                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "EAM_FK_QCT_QT" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP")      
	  REFERENCES "HYPERIC_OWNER"."QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP") 
ENABLE                                                                          
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_CALENDARS"                                 
   (	"CALENDAR_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                        
	"CALENDAR" BLOB NOT NULL ENABLE,                                               
	 PRIMARY KEY ("CALENDAR_NAME")                                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("CALENDAR") STORE AS BASICFILE (                                          
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."QRTZ_BLOB_TRIGGERS"                             
   (	"TRIGGER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                         
	"TRIGGER_GROUP" VARCHAR2(200 CHAR) NOT NULL ENABLE,                            
	"BLOB_DATA" BLOB,                                                              
	 PRIMARY KEY ("TRIGGER_NAME", "TRIGGER_GROUP")                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "EAM_FK_QBT_QT" FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP")      
	  REFERENCES "HYPERIC_OWNER"."QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP") 
ENABLE                                                                          
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("BLOB_DATA") STORE AS BASICFILE (                                         
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_COMPAT"                          
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_8D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_8D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_7D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_7D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_6D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_6D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_5D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_5D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_4D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_4D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_3D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_3D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_2D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_2D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_1D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_1D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_0D_1S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_METRIC_DATA_0D_0S"                           
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."HQ_AVAIL_DATA_RLE"                              
   (	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                             
	"STARTIME" NUMBER(19,0) NOT NULL ENABLE,                                       
	"ENDTIME" NUMBER(19,0) DEFAULT 9223372036854775807 NOT NULL ENABLE,            
	"AVAILVAL" FLOAT(126) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("MEASUREMENT_ID", "STARTIME")                                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK6E8F9E9CB6E3839C" FOREIGN KEY ("MEASUREMENT_ID")                
	  REFERENCES "HYPERIC_OWNER"."EAM_MEASUREMENT" ("ID") ON DELETE CASCADE ENABLE 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_VIRTUAL"                                    
   (	"RESOURCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PROCESS_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	"PHYSICAL_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("RESOURCE_ID")                                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK94039BDDFC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ON DELETE CASCADE ENABLE    
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UPDATE_STATUS"                              
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"REPORT" VARCHAR2(4000 CHAR),                                                  
	"UPMODE" NUMBER(10,0) NOT NULL ENABLE,                                         
	"IGNORED" NUMBER(1,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_VIEW_RESOURCE"                           
   (	"VIEW_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("VIEW_ID")                                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKA416A54BF6253048" FOREIGN KEY ("VIEW_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_VIEW" ("ID") ON DELETE CASCADE ENABLE     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_VIEW_MASTHEAD"                           
   (	"VIEW_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("VIEW_ID")                                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKC9583392F6253048" FOREIGN KEY ("VIEW_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_VIEW" ("ID") ON DELETE CASCADE ENABLE     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_VIEW_ADMIN"                              
   (	"VIEW_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("VIEW_ID")                                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK7815EB12F6253048" FOREIGN KEY ("VIEW_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_VIEW" ("ID") ON DELETE CASCADE ENABLE     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_VIEW"                                    
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PATH" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"DESCRIPTION" VARCHAR2(255 CHAR) NOT NULL ENABLE,                              
	"ATTACH_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"UI_PLUGIN_ID" NUMBER(10,0) NOT NULL ENABLE,                                   
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("PATH")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK5FD54E62B5F36A31" FOREIGN KEY ("UI_PLUGIN_ID")                  
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_PLUGIN" ("ID") ENABLE                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_PLUGIN"                                  
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"PLUGIN_VERSION" VARCHAR2(30 CHAR) NOT NULL ENABLE,                            
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_ATTACH_RSRC"                             
   (	"ATTACH_ID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"RESOURCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"CATEGORY" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                 
	 PRIMARY KEY ("ATTACH_ID")                                                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD9F7A78FD494BCA6" FOREIGN KEY ("ATTACH_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_ATTACHMENT" ("ID") ON DELETE CASCADE ENABL
E,                                                                              
	 CONSTRAINT "FKD9F7A78FFC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_ATTACH_MAST"                             
   (	"ATTACH_ID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"CATEGORY" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                 
	 PRIMARY KEY ("ATTACH_ID")                                                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD9F51E52D494BCA6" FOREIGN KEY ("ATTACH_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_ATTACHMENT" ("ID") ON DELETE CASCADE ENABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_ATTACH_ADMIN"                            
   (	"ATTACH_ID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"CATEGORY" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                 
	 PRIMARY KEY ("ATTACH_ID")                                                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK6406D772D494BCA6" FOREIGN KEY ("ATTACH_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_ATTACHMENT" ("ID") ON DELETE CASCADE ENABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_UI_ATTACHMENT"                              
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"ATTACH_TIME" NUMBER(19,0) NOT NULL ENABLE,                                    
	"VIEW_ID" NUMBER(10,0) NOT NULL ENABLE,                                        
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK2807DF20F6253048" FOREIGN KEY ("VIEW_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_UI_VIEW" ("ID") ENABLE                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SUBJECT_ROLE_MAP"                           
   (	"ROLE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"SUBJECT_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	 PRIMARY KEY ("SUBJECT_ID", "ROLE_ID")                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK320F6314E82FBC" FOREIGN KEY ("SUBJECT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE,                      
	 CONSTRAINT "FK320F631499D737AE" FOREIGN KEY ("ROLE_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_ROLE" ("ID") ENABLE                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SUBJECT"                                    
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"DSN" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                      
	"SORT_NAME" VARCHAR2(100 CHAR),                                                
	"FIRST_NAME" VARCHAR2(100 CHAR),                                               
	"LAST_NAME" VARCHAR2(100 CHAR),                                                
	"EMAIL_ADDRESS" VARCHAR2(100 CHAR),                                            
	"SMS_ADDRESS" VARCHAR2(100 CHAR),                                              
	"PHONE_NUMBER" VARCHAR2(100 CHAR),                                             
	"DEPARTMENT" VARCHAR2(100 CHAR),                                               
	"FACTIVE" NUMBER(1,0) NOT NULL ENABLE,                                         
	"FSYSTEM" NUMBER(1,0) NOT NULL ENABLE,                                         
	"HTML_EMAIL" NUMBER(1,0) NOT NULL ENABLE,                                      
	"RESOURCE_ID" NUMBER(10,0),                                                    
	"PREF_CRISPO_ID" NUMBER(10,0),                                                 
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME", "DSN")                                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK8E4D1FE6E3C7CB1" FOREIGN KEY ("PREF_CRISPO_ID")                 
	  REFERENCES "HYPERIC_OWNER"."EAM_CRISPO" ("ID") ENABLE,                       
	 CONSTRAINT "FK8E4D1FEFC176AE" FOREIGN KEY ("RESOURCE_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_STAT_ERRORS"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"COUNT" NUMBER(10,0) NOT NULL ENABLE,                                          
	"ERROR_ID" NUMBER(10,0),                                                       
	"REQSTAT_ID" NUMBER(10,0),                                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK6F2383A8237D366C" FOREIGN KEY ("ERROR_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_ERROR_CODE" ("ID") ON DELETE CASCADE ENABLE, 
                                                                                
	 CONSTRAINT "FK6F2383A82DE89070" FOREIGN KEY ("REQSTAT_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_REQUEST_STAT" ("ID") ON DELETE CASCADE ENABLE
                                                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SRN"                                        
   (	"INSTANCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                
	"APPDEF_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"SRN" NUMBER(10,0) NOT NULL ENABLE,                                            
	 PRIMARY KEY ("INSTANCE_ID", "APPDEF_TYPE")                                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SERVICE_TYPE"                               
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(500 CHAR) NOT NULL ENABLE,                                     
	"SORT_NAME" VARCHAR2(500 CHAR),                                                
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(200 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"PLUGIN" VARCHAR2(250 CHAR),                                                   
	"FINTERNAL" NUMBER(1,0),                                                       
	"SERVER_TYPE_ID" NUMBER(10,0),                                                 
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKB0B418F239B1D30D" FOREIGN KEY ("SERVER_TYPE_ID")                
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVER_TYPE" ("ID") ON DELETE CASCADE ENABLE 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SERVICE_REQUEST"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"SERVICEID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"URL" VARCHAR2(767 CHAR) NOT NULL ENABLE,                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SERVICE_DEP_MAP"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"APPSERVICE_ID" NUMBER(10,0),                                                  
	"DEPENDENT_SERVICE_ID" NUMBER(10,0),                                           
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("APPSERVICE_ID", "DEPENDENT_SERVICE_ID")                              
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKBDAB4434642E0910" FOREIGN KEY ("DEPENDENT_SERVICE_ID")          
	  REFERENCES "HYPERIC_OWNER"."EAM_APP_SERVICE" ("ID") ENABLE,                  
	 CONSTRAINT "FKBDAB443476C4C8B1" FOREIGN KEY ("APPSERVICE_ID")                 
	  REFERENCES "HYPERIC_OWNER"."EAM_APP_SERVICE" ("ID") ON DELETE CASCADE ENABLE 
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SERVICE"                                    
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(200 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"MODIFIED_BY" VARCHAR2(100 CHAR),                                              
	"LOCATION" VARCHAR2(100 CHAR),                                                 
	"AUTODISCOVERY_ZOMBIE" NUMBER(1,0),                                            
	"SERVICE_RT" NUMBER(1,0),                                                      
	"ENDUSER_RT" NUMBER(1,0),                                                      
	"PARENT_SERVICE_ID" NUMBER(10,0),                                              
	"SERVER_ID" NUMBER(10,0),                                                      
	"AUTOINVENTORYIDENTIFIER" VARCHAR2(500 CHAR),                                  
	"SERVICE_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                                
	"CONFIG_RESPONSE_ID" NUMBER(10,0),                                             
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("ID", "PARENT_SERVICE_ID")                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKEE7E438762B21414" FOREIGN KEY ("CONFIG_RESPONSE_ID")            
	  REFERENCES "HYPERIC_OWNER"."EAM_CONFIG_RESPONSE" ("ID") ENABLE,              
	 CONSTRAINT "FKEE7E4387EA5FF386" FOREIGN KEY ("SERVER_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVER" ("ID") ON DELETE CASCADE ENABLE,     
	 CONSTRAINT "FKEE7E438784174123" FOREIGN KEY ("PARENT_SERVICE_ID")             
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVICE" ("ID") ENABLE,                      
	 CONSTRAINT "FKEE7E4387B648CF19" FOREIGN KEY ("SERVICE_TYPE_ID")               
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVICE_TYPE" ("ID") ON DELETE CASCADE ENABLE
,                                                                               
	 CONSTRAINT "FKEE7E4387FC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SERVER_TYPE"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                     
	"SORT_NAME" VARCHAR2(200 CHAR),                                                
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(200 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"PLUGIN" VARCHAR2(250 CHAR),                                                   
	"FVIRTUAL" NUMBER(1,0),                                                        
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_SERVER"                                     
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(300 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"MODIFIED_BY" VARCHAR2(100 CHAR),                                              
	"LOCATION" VARCHAR2(100 CHAR),                                                 
	"PLATFORM_ID" NUMBER(10,0),                                                    
	"AUTOINVENTORYIDENTIFIER" VARCHAR2(250 CHAR),                                  
	"RUNTIMEAUTODISCOVERY" NUMBER(1,0),                                            
	"WASAUTODISCOVERED" NUMBER(1,0),                                               
	"SERVICESAUTOMANAGED" NUMBER(1,0),                                             
	"AUTODISCOVERY_ZOMBIE" NUMBER(1,0),                                            
	"INSTALLPATH" VARCHAR2(200 CHAR),                                              
	"SERVER_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"CONFIG_RESPONSE_ID" NUMBER(10,0),                                             
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("PLATFORM_ID", "AUTOINVENTORYIDENTIFIER")                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKEEEB4C1162B21414" FOREIGN KEY ("CONFIG_RESPONSE_ID")            
	  REFERENCES "HYPERIC_OWNER"."EAM_CONFIG_RESPONSE" ("ID") ENABLE,              
	 CONSTRAINT "FKEEEB4C1139B1D30D" FOREIGN KEY ("SERVER_TYPE_ID")                
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVER_TYPE" ("ID") ON DELETE CASCADE ENABLE,
                                                                                
	 CONSTRAINT "FKEEEB4C11FC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FKEEEB4C116796AA86" FOREIGN KEY ("PLATFORM_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_PLATFORM" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ROLE_RESOURCE_GROUP_MAP"                    
   (	"ROLE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"RESOURCE_GROUP_ID" NUMBER(10,0) NOT NULL ENABLE,                              
	 PRIMARY KEY ("RESOURCE_GROUP_ID", "ROLE_ID")                                  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK7D6EFC699D737AE" FOREIGN KEY ("ROLE_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_ROLE" ("ID") ENABLE,                         
	 CONSTRAINT "FK7D6EFC66DA1B7C9" FOREIGN KEY ("RESOURCE_GROUP_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_GROUP" ("ID") ENABLE                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ROLE_OPERATION_MAP"                         
   (	"ROLE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"OPERATION_ID" NUMBER(10,0) NOT NULL ENABLE,                                   
	 PRIMARY KEY ("ROLE_ID", "OPERATION_ID")                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKDFBEA0999D737AE" FOREIGN KEY ("ROLE_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_ROLE" ("ID") ENABLE,                         
	 CONSTRAINT "FKDFBEA09C848F326" FOREIGN KEY ("OPERATION_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_OPERATION" ("ID") ENABLE                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ROLE_CALENDAR"                              
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"ROLE_ID" NUMBER(10,0) NOT NULL ENABLE,                                        
	"CALENDAR_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"CALTYPE" NUMBER(10,0) NOT NULL ENABLE,                                        
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("ROLE_ID", "CALENDAR_ID", "CALTYPE")                                  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD703BC5999D737AE" FOREIGN KEY ("ROLE_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_ROLE" ("ID") ON DELETE CASCADE ENABLE,       
	 CONSTRAINT "FKD703BC59F8214D4D" FOREIGN KEY ("CALENDAR_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_CALENDAR" ("ID") ENABLE                      
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ROLE"                                       
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"SORT_NAME" VARCHAR2(100 CHAR),                                                
	"DESCRIPTION" VARCHAR2(100 CHAR),                                              
	"FSYSTEM" NUMBER(1,0),                                                         
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKF6EC7CC4FC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RES_GRP_RES_MAP"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"RESOURCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"RESOURCE_GROUP_ID" NUMBER(10,0) NOT NULL ENABLE,                              
	"ENTRY_TIME" NUMBER(19,0) NOT NULL ENABLE,                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("RESOURCE_ID", "RESOURCE_GROUP_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK1C83536FC176AE" FOREIGN KEY ("RESOURCE_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FK1C835366DA1B7C9" FOREIGN KEY ("RESOURCE_GROUP_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_GROUP" ("ID") ENABLE                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RESOURCE_TYPE"                              
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"RESOURCE_ID" NUMBER(10,0),                                                    
	"FSYSTEM" NUMBER(1,0),                                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("RESOURCE_ID")                                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD203D83DFC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RESOURCE_RELATION"                          
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"IS_HIER" NUMBER(1,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RESOURCE_GROUP"                             
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"DESCRIPTION" VARCHAR2(100 CHAR),                                              
	"LOCATION" VARCHAR2(100 CHAR),                                                 
	"FSYSTEM" NUMBER(1,0),                                                         
	"HAS_OR_CRITERIA" NUMBER(1,0) NOT NULL ENABLE,                                 
	"GROUPTYPE" NUMBER(10,0) DEFAULT 11,                                           
	"CLUSTER_ID" NUMBER(10,0) DEFAULT -1,                                          
	"CTIME" NUMBER(19,0) DEFAULT 0,                                                
	"MTIME" NUMBER(19,0) DEFAULT 0,                                                
	"MODIFIED_BY" VARCHAR2(100 CHAR),                                              
	"RESOURCE_PROTOTYPE" NUMBER(10,0),                                             
	"RESOURCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK6DBCCDBCFC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FK6DBCCDBC190495F3" FOREIGN KEY ("RESOURCE_PROTOTYPE")            
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RESOURCE_EDGE"                              
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"FROM_ID" NUMBER(10,0) NOT NULL ENABLE,                                        
	"TO_ID" NUMBER(10,0) NOT NULL ENABLE,                                          
	"REL_ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"DISTANCE" NUMBER(10,0) NOT NULL ENABLE,                                       
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("FROM_ID", "TO_ID", "REL_ID", "DISTANCE")                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD1FCB6C0CCC27921" FOREIGN KEY ("TO_ID")                         
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ON DELETE CASCADE ENABLE,   
	 CONSTRAINT "FKD1FCB6C04405AE5F" FOREIGN KEY ("REL_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_RELATION" ("ID") ENABLE,            
	 CONSTRAINT "FKD1FCB6C0A2BF2D92" FOREIGN KEY ("FROM_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ON DELETE CASCADE ENABLE    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RESOURCE_AUX_LOGS"                          
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"AUX_LOG_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	"APPDEF_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"APPDEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"DEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK859D15ED997CFC6" FOREIGN KEY ("AUX_LOG_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_AUX_LOGS" ("ID") ENABLE,              
	 CONSTRAINT "FK859D15ED706267A5" FOREIGN KEY ("DEF_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_DEFS" ("ID") ENABLE                   
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_RESOURCE"                                   
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"RESOURCE_TYPE_ID" NUMBER(10,0),                                               
	"INSTANCE_ID" NUMBER(10,0),                                                    
	"SUBJECT_ID" NUMBER(10,0),                                                     
	"PROTO_ID" NUMBER(10,0) NOT NULL ENABLE,                                       
	"NAME" VARCHAR2(500 CHAR),                                                     
	"SORT_NAME" VARCHAR2(500 CHAR),                                                
	"FSYSTEM" NUMBER(1,0),                                                         
	"MTIME" NUMBER(19,0) DEFAULT 0,                                                
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK7AC0E15C8B366A94" FOREIGN KEY ("PROTO_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FK7AC0E15CE82FBC" FOREIGN KEY ("SUBJECT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE,                      
	 CONSTRAINT "FK7AC0E15C9E309B2B" FOREIGN KEY ("RESOURCE_TYPE_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_TYPE" ("ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_REQUEST_STAT"                               
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"IPADDR" VARCHAR2(20 CHAR) NOT NULL ENABLE,                                    
	"MIN" FLOAT(126) NOT NULL ENABLE,                                              
	"MAX" FLOAT(126) NOT NULL ENABLE,                                              
	"TOTAL" FLOAT(126) NOT NULL ENABLE,                                            
	"COUNT" NUMBER(10,0) NOT NULL ENABLE,                                          
	"BEGINTIME" NUMBER(19,0) NOT NULL ENABLE,                                      
	"ENDTIME" NUMBER(19,0) NOT NULL ENABLE,                                        
	"SVCTYPE" NUMBER(10,0) NOT NULL ENABLE,                                        
	"SVCREQ_ID" NUMBER(10,0),                                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE8EBBC72154D0F55" FOREIGN KEY ("SVCREQ_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVICE_REQUEST" ("ID") ON DELETE CASCADE ENA
BLE                                                                             
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_REGISTERED_TRIGGER"                         
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"FREQUENCY" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                            
	"CLASSNAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                
	"CONFIG" BLOB,                                                                 
	"ALERT_DEFINITION_ID" NUMBER(10,0),                                            
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK4A8354A9B5AF9D12" FOREIGN KEY ("ALERT_DEFINITION_ID")           
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT_DEFINITION" ("ID") ON DELETE CASCADE EN
ABLE                                                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("CONFIG") STORE AS BASICFILE (                                            
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_PRINCIPAL"                                  
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PRINCIPAL" VARCHAR2(64 CHAR) NOT NULL ENABLE,                                 
	"PASSWORD" VARCHAR2(64 CHAR) NOT NULL ENABLE,                                  
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("PRINCIPAL")                                                          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_PLUGIN"                                     
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                     
	"VERSION" VARCHAR2(100 CHAR),                                                  
	"PATH" VARCHAR2(500 CHAR) NOT NULL ENABLE,                                     
	"MD5" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                      
	"CTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"MTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"DISABLED" NUMBER(1,0) NOT NULL ENABLE,                                        
	"DELETED" NUMBER(1,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_PLATFORM_TYPE"                              
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(80 CHAR) NOT NULL ENABLE,                                      
	"SORT_NAME" VARCHAR2(80 CHAR),                                                 
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(256 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"OS" VARCHAR2(80 CHAR),                                                        
	"OSVERSION" VARCHAR2(80 CHAR),                                                 
	"ARCH" VARCHAR2(80 CHAR),                                                      
	"PLUGIN" VARCHAR2(250 CHAR),                                                   
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_PLATFORM_SERVER_TYPE_MAP"                   
   (	"SERVER_TYPE_ID" NUMBER(10,0),                                             
	"PLATFORM_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                               
	 PRIMARY KEY ("SERVER_TYPE_ID", "PLATFORM_TYPE_ID")                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK4BE3F5B539B1D30D" FOREIGN KEY ("SERVER_TYPE_ID")                
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVER_TYPE" ("ID") ENABLE,                  
	 CONSTRAINT "FK4BE3F5B5E3E1026D" FOREIGN KEY ("PLATFORM_TYPE_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_PLATFORM_TYPE" ("ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_PLATFORM"                                   
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"FQDN" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"CERTDN" VARCHAR2(200 CHAR),                                                   
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(256 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"MODIFIED_BY" VARCHAR2(100 CHAR),                                              
	"LOCATION" VARCHAR2(100 CHAR),                                                 
	"COMMENT_TEXT" VARCHAR2(256 CHAR),                                             
	"CPU_COUNT" NUMBER(10,0),                                                      
	"PLATFORM_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                               
	"CONFIG_RESPONSE_ID" NUMBER(10,0),                                             
	"AGENT_ID" NUMBER(10,0),                                                       
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("FQDN")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKFED285C162B21414" FOREIGN KEY ("CONFIG_RESPONSE_ID")            
	  REFERENCES "HYPERIC_OWNER"."EAM_CONFIG_RESPONSE" ("ID") ENABLE,              
	 CONSTRAINT "FKFED285C1559691A3" FOREIGN KEY ("AGENT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_AGENT" ("ID") ENABLE,                        
	 CONSTRAINT "FKFED285C1FC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FKFED285C1E3E1026D" FOREIGN KEY ("PLATFORM_TYPE_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_PLATFORM_TYPE" ("ID") ON DELETE CASCADE ENABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_OPERATION"                                  
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"RESOURCE_TYPE_ID" NUMBER(10,0),                                               
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME", "RESOURCE_TYPE_ID")                                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKB6A961B99E309B2B" FOREIGN KEY ("RESOURCE_TYPE_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_TYPE" ("ID") ON DELETE CASCADE ENABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_NUMBERS"                                    
   (	"I" NUMBER(19,0) NOT NULL ENABLE,                                          
	 PRIMARY KEY ("I")                                                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MONITORABLE_TYPE"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"APPDEF_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"PLUGIN" VARCHAR2(250 CHAR) NOT NULL ENABLE,                                   
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_METRIC_PROB"                                
   (	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                             
	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                      
	"ADDITIONAL" NUMBER(10,0) NOT NULL ENABLE,                                     
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"TYPE" NUMBER(10,0) NOT NULL ENABLE,                                           
	 PRIMARY KEY ("MEASUREMENT_ID", "TIMESTAMP", "ADDITIONAL")                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_METRIC_AUX_LOGS"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"AUX_LOG_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	"METRIC_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"DEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE7D70B0BA1FCB528" FOREIGN KEY ("METRIC_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_MEASUREMENT" ("ID") ENABLE,                  
	 CONSTRAINT "FKE7D70B0B997CFC6" FOREIGN KEY ("AUX_LOG_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_AUX_LOGS" ("ID") ENABLE,              
	 CONSTRAINT "FKE7D70B0B706267A5" FOREIGN KEY ("DEF_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_DEFS" ("ID") ENABLE                   
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT_TEMPL"                          
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"ALIAS" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                    
	"UNITS" VARCHAR2(50 CHAR) NOT NULL ENABLE,                                     
	"COLLECTION_TYPE" NUMBER(10,0) DEFAULT 0 NOT NULL ENABLE,                      
	"DEFAULT_ON" NUMBER(1,0) NOT NULL ENABLE,                                      
	"DEFAULT_INTERVAL" NUMBER(19,0) DEFAULT 60000 NOT NULL ENABLE,                 
	"DESIGNATE" NUMBER(1,0) NOT NULL ENABLE,                                       
	"TEMPLATE" VARCHAR2(2048 CHAR) NOT NULL ENABLE,                                
	"PLUGIN" VARCHAR2(250 CHAR) NOT NULL ENABLE,                                   
	"CTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"MTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"MONITORABLE_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                            
	"CATEGORY_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK253D707EF33C225" FOREIGN KEY ("MONITORABLE_TYPE_ID")            
	  REFERENCES "HYPERIC_OWNER"."EAM_MONITORABLE_TYPE" ("ID") ENABLE,             
	 CONSTRAINT "FK253D70712A378D8" FOREIGN KEY ("CATEGORY_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_MEASUREMENT_CAT" ("ID") ENABLE               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT_DATA_6H"                        
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	"MINVALUE" NUMBER(24,5),                                                       
	"MAXVALUE" NUMBER(24,5),                                                       
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT_DATA_1H"                        
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	"MINVALUE" NUMBER(24,5),                                                       
	"MAXVALUE" NUMBER(24,5),                                                       
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT_DATA_1D"                        
   (	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                  
	"MEASUREMENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                 
	"VALUE" NUMBER(24,5),                                                          
	"MINVALUE" NUMBER(24,5),                                                       
	"MAXVALUE" NUMBER(24,5),                                                       
	 PRIMARY KEY ("TIMESTAMP", "MEASUREMENT_ID")                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AGENT"                                      
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"ADDRESS" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                  
	"PORT" NUMBER(10,0) NOT NULL ENABLE,                                           
	"AUTHTOKEN" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                
	"AGENTTOKEN" VARCHAR2(100 CHAR) NOT NULL ENABLE,                               
	"VERSION" VARCHAR2(50 CHAR),                                                   
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"UNIDIRECTIONAL" NUMBER(1,0) NOT NULL ENABLE,                                  
	"PLUGIN_INVENTORY_CHECKSUM" VARCHAR2(128 CHAR),                                
	"LAST_PLUGIN_INVENTORY_CHECKIN" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,        
	"AGENT_TYPE_ID" NUMBER(10,0),                                                  
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("AGENTTOKEN")                                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE5AFD057CCBE6E" FOREIGN KEY ("AGENT_TYPE_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_AGENT_TYPE" ("ID") ON DELETE CASCADE ENABLE  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AGENT_PLUGIN_STATUS"                        
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"AGENT_ID" NUMBER(10,0) NOT NULL ENABLE,                                       
	"FILE_NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,                                
	"PRODUCT_NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,                             
	"PLUGIN_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                              
	"MD5" VARCHAR2(100 CHAR),                                                      
	"LAST_CHECKIN" NUMBER(19,0) NOT NULL ENABLE,                                   
	"LAST_SYNC_STATUS" VARCHAR2(64 CHAR),                                          
	"LAST_SYNC_ATTEMPT" NUMBER(19,0),                                              
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK8C8FAC96559691A3" FOREIGN KEY ("AGENT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_AGENT" ("ID") ON DELETE CASCADE ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AGENT_TYPE"                                 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(80 CHAR),                                                      
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AIQ_IP"                                     
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"AIQ_PLATFORM_ID" NUMBER(10,0),                                                
	"ADDRESS" VARCHAR2(64 CHAR) NOT NULL ENABLE,                                   
	"NETMASK" VARCHAR2(64 CHAR),                                                   
	"MAC_ADDRESS" VARCHAR2(64 CHAR),                                               
	"QUEUESTATUS" NUMBER(10,0),                                                    
	"DIFF" NUMBER(19,0),                                                           
	"IGNORED" NUMBER(1,0),                                                         
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("AIQ_PLATFORM_ID", "ADDRESS")                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD06C1CCB1BFF8500" FOREIGN KEY ("AIQ_PLATFORM_ID")               
	  REFERENCES "HYPERIC_OWNER"."EAM_AIQ_PLATFORM" ("ID") ON DELETE CASCADE ENABLE
                                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AIQ_PLATFORM"                               
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"DESCRIPTION" VARCHAR2(300 CHAR),                                              
	"OS" VARCHAR2(80 CHAR),                                                        
	"OSVERSION" VARCHAR2(80 CHAR),                                                 
	"ARCH" VARCHAR2(80 CHAR),                                                      
	"FQDN" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                     
	"AGENTTOKEN" VARCHAR2(100 CHAR) NOT NULL ENABLE,                               
	"CERTDN" VARCHAR2(200 CHAR),                                                   
	"QUEUESTATUS" NUMBER(10,0),                                                    
	"DIFF" NUMBER(19,0),                                                           
	"IGNORED" NUMBER(1,0),                                                         
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"LASTAPPROVED" NUMBER(19,0),                                                   
	"LOCATION" VARCHAR2(100 CHAR),                                                 
	"CPU_SPEED" NUMBER(10,0),                                                      
	"CPU_COUNT" NUMBER(10,0),                                                      
	"RAM" NUMBER(10,0),                                                            
	"GATEWAY" VARCHAR2(64 CHAR),                                                   
	"DHCP_SERVER" VARCHAR2(64 CHAR),                                               
	"DNS_SERVER" VARCHAR2(64 CHAR),                                                
	"CUSTOM_PROPERTIES" BLOB,                                                      
	"PRODUCT_CONFIG" BLOB,                                                         
	"CONTROL_CONFIG" BLOB,                                                         
	"MEASUREMENT_CONFIG" BLOB,                                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("FQDN")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("CERTDN")                                                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("CUSTOM_PROPERTIES") STORE AS BASICFILE (                                 
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("PRODUCT_CONFIG") STORE AS BASICFILE (                                    
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("CONTROL_CONFIG") STORE AS BASICFILE (                                    
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("MEASUREMENT_CONFIG") STORE AS BASICFILE (                                
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AIQ_SERVER"                                 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"AIQ_PLATFORM_ID" NUMBER(10,0),                                                
	"AUTOINVENTORYIDENTIFIER" VARCHAR2(255 CHAR),                                  
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"DESCRIPTION" VARCHAR2(300 CHAR),                                              
	"ACTIVE" CHAR(1 CHAR) DEFAULT 't',                                             
	"SERVERTYPENAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                           
	"INSTALLPATH" VARCHAR2(255 CHAR),                                              
	"SERVICESAUTOMANAGED" NUMBER(1,0),                                             
	"CUSTOM_PROPERTIES" BLOB,                                                      
	"PRODUCT_CONFIG" BLOB,                                                         
	"CONTROL_CONFIG" BLOB,                                                         
	"RESPONSETIME_CONFIG" BLOB,                                                    
	"MEASUREMENT_CONFIG" BLOB,                                                     
	"QUEUESTATUS" NUMBER(10,0),                                                    
	"DIFF" NUMBER(19,0),                                                           
	"IGNORED" NUMBER(1,0),                                                         
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("AIQ_PLATFORM_ID", "AUTOINVENTORYIDENTIFIER")                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK60C6C4E71BFF8500" FOREIGN KEY ("AIQ_PLATFORM_ID")               
	  REFERENCES "HYPERIC_OWNER"."EAM_AIQ_PLATFORM" ("ID") ON DELETE CASCADE ENABLE
                                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("CUSTOM_PROPERTIES") STORE AS BASICFILE (                                 
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("PRODUCT_CONFIG") STORE AS BASICFILE (                                    
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("CONTROL_CONFIG") STORE AS BASICFILE (                                    
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("RESPONSETIME_CONFIG") STORE AS BASICFILE (                               
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("MEASUREMENT_CONFIG") STORE AS BASICFILE (                                
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AIQ_SERVICE"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"DESCRIPTION" VARCHAR2(300 CHAR),                                              
	"SERVICETYPENAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                          
	"QUEUESTATUS" NUMBER(10,0),                                                    
	"DIFF" NUMBER(19,0),                                                           
	"IGNORED" NUMBER(1,0),                                                         
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"CUSTOM_PROPERTIES" BLOB,                                                      
	"PRODUCT_CONFIG" BLOB,                                                         
	"CONTROL_CONFIG" BLOB,                                                         
	"MEASUREMENT_CONFIG" BLOB,                                                     
	"RESPONSETIME_CONFIG" BLOB,                                                    
	"SERVER_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKB811E571EA5FF386" FOREIGN KEY ("SERVER_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVER" ("ID") ENABLE                        
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("CUSTOM_PROPERTIES") STORE AS BASICFILE (                                 
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
 LOB ("PRODUCT_CONFIG") STORE AS BASICFILE (                                    
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
 LOB ("CONTROL_CONFIG") STORE AS BASICFILE (                                    
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
 LOB ("MEASUREMENT_CONFIG") STORE AS BASICFILE (                                
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
 LOB ("RESPONSETIME_CONFIG") STORE AS BASICFILE (                               
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ALERT"                                      
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"FIXED" NUMBER(1,0) NOT NULL ENABLE,                                           
	"ALERT_DEFINITION_ID" NUMBER(10,0) NOT NULL ENABLE,                            
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ALERT_ACTION_LOG"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                      
	"DETAIL" VARCHAR2(500 CHAR) NOT NULL ENABLE,                                   
	"ALERT_ID" NUMBER(10,0),                                                       
	"ALERT_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                     
	"ACTION_ID" NUMBER(10,0),                                                      
	"SUBJECT_ID" NUMBER(10,0),                                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK423FA3CC9C76C3BB" FOREIGN KEY ("ACTION_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_ACTION" ("ID") ON DELETE CASCADE ENABLE,     
	 CONSTRAINT "FK423FA3CCE82FBC" FOREIGN KEY ("SUBJECT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE,                      
	 CONSTRAINT "FK423FA3CC1AA4E259" FOREIGN KEY ("ALERT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT" ("ID") ON DELETE CASCADE ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ALERT_CONDITION"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"TYPE" NUMBER(10,0) NOT NULL ENABLE,                                           
	"REQUIRED" NUMBER(1,0) NOT NULL ENABLE,                                        
	"MEASUREMENT_ID" NUMBER(10,0),                                                 
	"NAME" VARCHAR2(100 CHAR),                                                     
	"COMPARATOR" VARCHAR2(2 CHAR),                                                 
	"THRESHOLD" FLOAT(126),                                                        
	"OPTION_STATUS" VARCHAR2(150 CHAR),                                            
	"ALERT_DEFINITION_ID" NUMBER(10,0),                                            
	"TRIGGER_ID" NUMBER(10,0),                                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE4028CAAB5AF9D12" FOREIGN KEY ("ALERT_DEFINITION_ID")           
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT_DEFINITION" ("ID") ON DELETE CASCADE EN
ABLE,                                                                           
	 CONSTRAINT "FKE4028CAAD448177" FOREIGN KEY ("TRIGGER_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_REGISTERED_TRIGGER" ("ID") ENABLE            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ALERT_CONDITION_LOG"                        
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VALUE" VARCHAR2(250 CHAR),                                                    
	"ALERT_ID" NUMBER(10,0),                                                       
	"CONDITION_ID" NUMBER(10,0),                                                   
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD1647E0F2EAA2A9F" FOREIGN KEY ("CONDITION_ID")                  
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT_CONDITION" ("ID") ON DELETE CASCADE ENA
BLE,                                                                            
	 CONSTRAINT "FKD1647E0F1AA4E259" FOREIGN KEY ("ALERT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT" ("ID") ON DELETE CASCADE ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ALERT_DEFINITION"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"CTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"MTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"PARENT_ID" NUMBER(10,0),                                                      
	"DESCRIPTION" VARCHAR2(250 CHAR),                                              
	"PRIORITY" NUMBER(10,0) NOT NULL ENABLE,                                       
	"ACTIVE" NUMBER(1,0) NOT NULL ENABLE,                                          
	"ENABLED" NUMBER(1,0) NOT NULL ENABLE,                                         
	"FREQUENCY_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                 
	"COUNT" NUMBER(19,0),                                                          
	"TRANGE" NUMBER(19,0),                                                         
	"WILL_RECOVER" NUMBER(1,0) NOT NULL ENABLE,                                    
	"NOTIFY_FILTERED" NUMBER(1,0) NOT NULL ENABLE,                                 
	"CONTROL_FILTERED" NUMBER(1,0) NOT NULL ENABLE,                                
	"DELETED" NUMBER(1,0) NOT NULL ENABLE,                                         
	"ESCALATION_ID" NUMBER(10,0),                                                  
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK975407845029EFD7" FOREIGN KEY ("ESCALATION_ID")                 
	  REFERENCES "HYPERIC_OWNER"."EAM_ESCALATION" ("ID") ENABLE,                   
	 CONSTRAINT "FK97540784FC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FK97540784CB32ABFE" FOREIGN KEY ("PARENT_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_ALERT_DEFINITION" ("ID") ON DELETE CASCADE EN
ABLE                                                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ALERT_DEF_STATE"                            
   (	"ALERT_DEFINITION_ID" NUMBER(10,0) NOT NULL ENABLE,                        
	"LAST_FIRED" NUMBER(19,0) NOT NULL ENABLE,                                     
	 PRIMARY KEY ("ALERT_DEFINITION_ID")                                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_APPLICATION"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(500 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"MODIFIED_BY" VARCHAR2(100 CHAR),                                              
	"LOCATION" VARCHAR2(100 CHAR),                                                 
	"ENG_CONTACT" VARCHAR2(100 CHAR),                                              
	"OPS_CONTACT" VARCHAR2(100 CHAR),                                              
	"BUS_CONTACT" VARCHAR2(100 CHAR),                                              
	"APPLICATION_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                            
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK6C0C122AAC031CF" FOREIGN KEY ("APPLICATION_TYPE_ID")            
	  REFERENCES "HYPERIC_OWNER"."EAM_APPLICATION_TYPE" ("ID") ON DELETE CASCADE EN
ABLE,                                                                           
	 CONSTRAINT "FK6C0C122FC176AE" FOREIGN KEY ("RESOURCE_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_APPLICATION_TYPE"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                     
	"SORT_NAME" VARCHAR2(200 CHAR),                                                
	"CID" NUMBER(10,0),                                                            
	"DESCRIPTION" VARCHAR2(200 CHAR),                                              
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_APP_SERVICE"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"SERVICE_ID" NUMBER(10,0),                                                     
	"GROUP_ID" NUMBER(10,0),                                                       
	"APPLICATION_ID" NUMBER(10,0),                                                 
	"ISGROUP" NUMBER(1,0) NOT NULL ENABLE,                                         
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"MODIFIED_BY" VARCHAR2(100 CHAR),                                              
	"FENTRY_POINT" NUMBER(1,0) NOT NULL ENABLE,                                    
	"SERVICE_TYPE_ID" NUMBER(10,0),                                                
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("SERVICE_ID", "GROUP_ID", "APPLICATION_ID")                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKD1CF8E4999EE4E8E" FOREIGN KEY ("APPLICATION_ID")                
	  REFERENCES "HYPERIC_OWNER"."EAM_APPLICATION" ("ID") ON DELETE CASCADE ENABLE,
                                                                                
	 CONSTRAINT "FKD1CF8E49B648CF19" FOREIGN KEY ("SERVICE_TYPE_ID")               
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVICE_TYPE" ("ID") ON DELETE CASCADE ENABLE
,                                                                               
	 CONSTRAINT "FKD1CF8E49CCE79AB8" FOREIGN KEY ("GROUP_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_GROUP" ("ID") ENABLE,               
	 CONSTRAINT "FKD1CF8E4967A1226E" FOREIGN KEY ("SERVICE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVICE" ("ID") ON DELETE CASCADE ENABLE     
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_APP_TYPE_SERVICE_TYPE_MAP"                  
   (	"SERVICE_TYPE_ID" NUMBER(10,0),                                            
	"APPLICATION_TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                            
	 PRIMARY KEY ("SERVICE_TYPE_ID", "APPLICATION_TYPE_ID")                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK5A2C503AAAC031CF" FOREIGN KEY ("APPLICATION_TYPE_ID")           
	  REFERENCES "HYPERIC_OWNER"."EAM_APPLICATION_TYPE" ("ID") ENABLE,             
	 CONSTRAINT "FK5A2C503AB648CF19" FOREIGN KEY ("SERVICE_TYPE_ID")               
	  REFERENCES "HYPERIC_OWNER"."EAM_SERVICE_TYPE" ("ID") ENABLE                  
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AUDIT"                                      
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"KLAZZ" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                    
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"START_TIME" NUMBER(19,0) NOT NULL ENABLE,                                     
	"END_TIME" NUMBER(19,0) NOT NULL ENABLE,                                       
	"NATURE" NUMBER(10,0) NOT NULL ENABLE,                                         
	"PURPOSE" NUMBER(10,0) NOT NULL ENABLE,                                        
	"IMPORTANCE" NUMBER(10,0) NOT NULL ENABLE,                                     
	"ORIGINAL" NUMBER(1,0) NOT NULL ENABLE,                                        
	"FIELD" VARCHAR2(100 CHAR),                                                    
	"OLD_VAL" VARCHAR2(1000 CHAR),                                                 
	"NEW_VAL" VARCHAR2(1000 CHAR),                                                 
	"MESSAGE" VARCHAR2(1000 CHAR) NOT NULL ENABLE,                                 
	"PARENT_ID" NUMBER(10,0),                                                      
	"RESOURCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"SUBJECT_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE5B6292DE82FBC" FOREIGN KEY ("SUBJECT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE,                      
	 CONSTRAINT "FKE5B6292DFC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FKE5B6292DC81F5938" FOREIGN KEY ("PARENT_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_AUDIT" ("ID") ON DELETE CASCADE ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AUTOINV_HISTORY"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"GROUP_ID" NUMBER(10,0),                                                       
	"BATCH_ID" NUMBER(10,0),                                                       
	"ENTITY_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"ENTITY_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"SUBJECT" VARCHAR2(32 CHAR) NOT NULL ENABLE,                                   
	"SCHEDULED" NUMBER(1,0) NOT NULL ENABLE,                                       
	"DATE_SCHEDULED" NUMBER(19,0) NOT NULL ENABLE,                                 
	"STARTTIME" NUMBER(19,0) NOT NULL ENABLE,                                      
	"STATUS" VARCHAR2(64 CHAR) NOT NULL ENABLE,                                    
	"ENDTIME" NUMBER(19,0) NOT NULL ENABLE,                                        
	"DURATION" NUMBER(19,0) NOT NULL ENABLE,                                       
	"SCANNAME" VARCHAR2(100 CHAR),                                                 
	"SCANDESC" VARCHAR2(200 CHAR),                                                 
	"DESCRIPTION" VARCHAR2(500 CHAR),                                              
	"MESSAGE" VARCHAR2(500 CHAR),                                                  
	"CONFIG" BLOB NOT NULL ENABLE,                                                 
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("CONFIG") STORE AS BASICFILE (                                            
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_AUTOINV_SCHEDULE"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"ENTITY_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"ENTITY_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"SUBJECT" VARCHAR2(32 CHAR) NOT NULL ENABLE,                                   
	"SCHEDULEVALUEBYTES" BLOB,                                                     
	"NEXTFIRETIME" NUMBER(19,0) NOT NULL ENABLE,                                   
	"TRIGGERNAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,                              
	"JOBNAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,                                  
	"JOB_ORDER_DATA" VARCHAR2(500 CHAR),                                           
	"SCANNAME" VARCHAR2(100 CHAR),                                                 
	"SCANDESC" VARCHAR2(200 CHAR),                                                 
	"CONFIG" BLOB,                                                                 
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("TRIGGERNAME")                                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("JOBNAME")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("SCANNAME")                                                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("SCHEDULEVALUEBYTES") STORE AS BASICFILE (                                
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
 LOB ("CONFIG") STORE AS BASICFILE (                                            
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CALENDAR"                                   
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CALENDAR_ENT"                               
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CALENDAR_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK84892E98F8214D4D" FOREIGN KEY ("CALENDAR_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_CALENDAR" ("ID") ENABLE                      
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CALENDAR_WEEK"                              
   (	"CALENDAR_WEEK_ID" NUMBER(10,0) NOT NULL ENABLE,                           
	"WEEKDAY" NUMBER(10,0) NOT NULL ENABLE,                                        
	"STARTTIME" NUMBER(10,0) NOT NULL ENABLE,                                      
	"ENDTIME" NUMBER(10,0) NOT NULL ENABLE,                                        
	 PRIMARY KEY ("CALENDAR_WEEK_ID")                                              
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKCA4AFC7CD1984A6" FOREIGN KEY ("CALENDAR_WEEK_ID")               
	  REFERENCES "HYPERIC_OWNER"."EAM_CALENDAR_ENT" ("ID") ENABLE                  
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CONFIG_PROPS"                               
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PREFIX" VARCHAR2(80 CHAR),                                                    
	"PROPKEY" VARCHAR2(80 CHAR),                                                   
	"PROPVALUE" VARCHAR2(300 CHAR),                                                
	"DEFAULT_PROPVALUE" VARCHAR2(300 CHAR),                                        
	"FREAD_ONLY" NUMBER(1,0),                                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("PREFIX", "PROPKEY")                                                  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CONFIG_RESPONSE"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PRODUCT_RESPONSE" BLOB,                                                       
	"CONTROL_RESPONSE" BLOB,                                                       
	"MEASUREMENT_RESPONSE" BLOB,                                                   
	"AUTOINVENTORY_RESPONSE" BLOB,                                                 
	"RESPONSE_TIME_RESPONSE" BLOB,                                                 
	"USERMANAGED" NUMBER(1,0) NOT NULL ENABLE,                                     
	"VALIDATIONERR" VARCHAR2(512 CHAR),                                            
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
 LOB ("PRODUCT_RESPONSE") STORE AS BASICFILE (                                  
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("CONTROL_RESPONSE") STORE AS BASICFILE (                                  
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("MEASUREMENT_RESPONSE") STORE AS BASICFILE (                              
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("AUTOINVENTORY_RESPONSE") STORE AS BASICFILE (                            
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("RESPONSE_TIME_RESPONSE") STORE AS BASICFILE (                            
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CONTROL_HISTORY"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"GROUP_ID" NUMBER(10,0),                                                       
	"BATCH_ID" NUMBER(10,0),                                                       
	"ENTITY_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"ENTITY_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"SUBJECT" VARCHAR2(32 CHAR) NOT NULL ENABLE,                                   
	"SCHEDULED" NUMBER(1,0) NOT NULL ENABLE,                                       
	"DATE_SCHEDULED" NUMBER(19,0) NOT NULL ENABLE,                                 
	"STARTTIME" NUMBER(19,0) NOT NULL ENABLE,                                      
	"STATUS" VARCHAR2(64 CHAR) NOT NULL ENABLE,                                    
	"ENDTIME" NUMBER(19,0) NOT NULL ENABLE,                                        
	"DESCRIPTION" VARCHAR2(500 CHAR),                                              
	"MESSAGE" VARCHAR2(500 CHAR),                                                  
	"ACTION" VARCHAR2(32 CHAR) NOT NULL ENABLE,                                    
	"ARGS" VARCHAR2(500 CHAR),                                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CONTROL_SCHEDULE"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"ENTITY_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"ENTITY_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"SUBJECT" VARCHAR2(32 CHAR) NOT NULL ENABLE,                                   
	"SCHEDULEVALUEBYTES" BLOB NOT NULL ENABLE,                                     
	"NEXTFIRETIME" NUMBER(19,0) NOT NULL ENABLE,                                   
	"TRIGGERNAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,                              
	"JOBNAME" VARCHAR2(128 CHAR) NOT NULL ENABLE,                                  
	"JOB_ORDER_DATA" VARCHAR2(500 CHAR),                                           
	"ACTION" VARCHAR2(32 CHAR) NOT NULL ENABLE,                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("TRIGGERNAME")                                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("JOBNAME")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
 LOB ("SCHEDULEVALUEBYTES") STORE AS BASICFILE (                                
  TABLESPACE "TRANSMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION             
  NOCACHE NOLOGGING )                                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CPROP"                                      
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"APPDEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"KEYID" NUMBER(10,0) NOT NULL ENABLE,                                          
	"VALUE_IDX" NUMBER(10,0) NOT NULL ENABLE,                                      
	"PROPVALUE" VARCHAR2(1000 CHAR) NOT NULL ENABLE,                               
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("APPDEF_ID", "KEYID", "VALUE_IDX")                                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE5D04798CCF47F9F" FOREIGN KEY ("KEYID")                         
	  REFERENCES "HYPERIC_OWNER"."EAM_CPROP_KEY" ("ID") ENABLE                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CPROP_KEY"                                  
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"APPDEF_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                    
	"APPDEF_TYPEID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"PROPKEY" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                  
	"DESCRIPTION" VARCHAR2(200 CHAR) NOT NULL ENABLE,                              
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("APPDEF_TYPE", "APPDEF_TYPEID", "PROPKEY")                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CRISPO"                                     
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CRISPO_ARRAY"                               
   (	"OPT_ID" NUMBER(10,0) NOT NULL ENABLE,                                     
	"VAL" VARCHAR2(4000 CHAR) NOT NULL ENABLE,                                     
	"IDX" NUMBER(10,0) NOT NULL ENABLE,                                            
	 PRIMARY KEY ("OPT_ID", "IDX")                                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKEE7DCB20EF4E2527" FOREIGN KEY ("OPT_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_CRISPO_OPT" ("ID") ENABLE                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CRISPO_OPT"                                 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PROPKEY" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                  
	"VAL" VARCHAR2(4000 CHAR),                                                     
	"CRISPO_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKC161913A6364EFCD" FOREIGN KEY ("CRISPO_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_CRISPO" ("ID") ENABLE                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_CRITERIA"                                   
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"LIST_INDEX" NUMBER(10,0) NOT NULL ENABLE,                                     
	"RESOURCE_GROUP_ID" NUMBER(10,0) NOT NULL ENABLE,                              
	"KLAZZ" VARCHAR2(256 CHAR) NOT NULL ENABLE,                                    
	"STRING_PROP" VARCHAR2(1024 CHAR),                                             
	"DATE_PROP" NUMBER(19,0),                                                      
	"RESOURCE_ID_PROP" NUMBER(10,0),                                               
	"NUMERIC_PROP" NUMBER(24,5),                                                   
	"ENUM_PROP" NUMBER(10,0),                                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK36EFCAD46A3B098" FOREIGN KEY ("RESOURCE_ID_PROP")               
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE,                     
	 CONSTRAINT "FK36EFCAD6DA1B7C9" FOREIGN KEY ("RESOURCE_GROUP_ID")              
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_GROUP" ("ID") ENABLE                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_DASH_CONFIG"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"CONFIG_TYPE" VARCHAR2(255 CHAR) NOT NULL ENABLE,                              
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"CRISPO_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"ROLE_ID" NUMBER(10,0),                                                        
	"USER_ID" NUMBER(10,0),                                                        
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("ROLE_ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("USER_ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK1EF56C816364EFCD" FOREIGN KEY ("CRISPO_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_CRISPO" ("ID") ENABLE,                       
	 CONSTRAINT "FK1EF56C8199D737AE" FOREIGN KEY ("ROLE_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_ROLE" ("ID") ENABLE,                         
	 CONSTRAINT "FK1EF56C811A5420BD" FOREIGN KEY ("USER_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ERROR_CODE"                                 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CODE" NUMBER(10,0) NOT NULL ENABLE,                                           
	"DESCRIPTION" VARCHAR2(64 CHAR) NOT NULL ENABLE,                               
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ESCALATION"                                 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE,                                     
	"DESCRIPTION" VARCHAR2(250 CHAR),                                              
	"ALLOW_PAUSE" NUMBER(1,0) NOT NULL ENABLE,                                     
	"MAX_WAIT_TIME" NUMBER(19,0) NOT NULL ENABLE,                                  
	"NOTIFY_ALL" NUMBER(1,0) NOT NULL ENABLE,                                      
	"CTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"MTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"FREPEAT" NUMBER(1,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ESCALATION_ACTION"                          
   (	"ESCALATION_ID" NUMBER(10,0) NOT NULL ENABLE,                              
	"WAIT_TIME" NUMBER(19,0) NOT NULL ENABLE,                                      
	"ACTION_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"IDX" NUMBER(10,0) NOT NULL ENABLE,                                            
	 PRIMARY KEY ("ESCALATION_ID", "IDX")                                          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK846DE1929C76C3BB" FOREIGN KEY ("ACTION_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_ACTION" ("ID") ENABLE,                       
	 CONSTRAINT "FK846DE1925029EFD7" FOREIGN KEY ("ESCALATION_ID")                 
	  REFERENCES "HYPERIC_OWNER"."EAM_ESCALATION" ("ID") ENABLE                    
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_ESCALATION_STATE"                           
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NEXT_ACTION_IDX" NUMBER(10,0) NOT NULL ENABLE,                                
	"NEXT_ACTION_TIME" NUMBER(19,0) NOT NULL ENABLE,                               
	"ESCALATION_ID" NUMBER(10,0) NOT NULL ENABLE,                                  
	"ALERT_DEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                   
	"ALERT_ID" NUMBER(10,0) NOT NULL ENABLE,                                       
	"ALERT_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                     
	"ACKNOWLEDGED_BY" NUMBER(10,0),                                                
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("ALERT_DEF_ID", "ALERT_TYPE")                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKAA7401955029EFD7" FOREIGN KEY ("ESCALATION_ID")                 
	  REFERENCES "HYPERIC_OWNER"."EAM_ESCALATION" ("ID") ENABLE,                   
	 CONSTRAINT "FKAA7401958C8D4D5C" FOREIGN KEY ("ACKNOWLEDGED_BY")               
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE                       
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_EVENT_LOG"                                  
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"DETAIL" VARCHAR2(4000 CHAR) NOT NULL ENABLE,                                  
	"TYPE" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                      
	"RESOURCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"SUBJECT" VARCHAR2(100 CHAR),                                                  
	"STATUS" VARCHAR2(100 CHAR),                                                   
	"INSTANCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK55818051FC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_EXEC_STRATEGIES"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"DEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"CONFIG_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"PARTITION" NUMBER(10,0) NOT NULL ENABLE,                                      
	"TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                                        
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKDC5C7EB11DAB49E3" FOREIGN KEY ("CONFIG_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_CRISPO" ("ID") ENABLE,                       
	 CONSTRAINT "FKDC5C7EB127E934B3" FOREIGN KEY ("TYPE_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_EXEC_STRATEGY_TYPES" ("ID") ENABLE,          
	 CONSTRAINT "FKDC5C7EB1706267A5" FOREIGN KEY ("DEF_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_DEFS" ("ID") ENABLE                   
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_EXEC_STRATEGY_TYPES"                        
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"TYPE_CLASS" VARCHAR2(255 CHAR) NOT NULL ENABLE,                               
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_GALERT_ACTION_LOG"                          
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                      
	"DETAIL" VARCHAR2(1024 CHAR) NOT NULL ENABLE,                                  
	"GALERT_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"ALERT_TYPE" NUMBER(10,0) NOT NULL ENABLE,                                     
	"ACTION_ID" NUMBER(10,0),                                                      
	"SUBJECT_ID" NUMBER(10,0),                                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKEF4421379C76C3BB" FOREIGN KEY ("ACTION_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_ACTION" ("ID") ENABLE,                       
	 CONSTRAINT "FKEF442137E82FBC" FOREIGN KEY ("SUBJECT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_SUBJECT" ("ID") ENABLE,                      
	 CONSTRAINT "FKEF442137C7D09794" FOREIGN KEY ("GALERT_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_LOGS" ("ID") ON DELETE CASCADE ENABLE 
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_GALERT_AUX_LOGS"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                      
	"AUXTYPE" NUMBER(10,0) NOT NULL ENABLE,                                        
	"DESCRIPTION" VARCHAR2(255 CHAR) NOT NULL ENABLE,                              
	"GALERT_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"PARENT" NUMBER(10,0),                                                         
	"DEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FKE2089906C7D09794" FOREIGN KEY ("GALERT_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_LOGS" ("ID") ON DELETE CASCADE ENABLE,
                                                                                
	 CONSTRAINT "FKE2089906706267A5" FOREIGN KEY ("DEF_ID")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_DEFS" ("ID") ENABLE,                  
	 CONSTRAINT "FKE20899066993629F" FOREIGN KEY ("PARENT")                        
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_AUX_LOGS" ("ID") ON DELETE CASCADE ENA
BLE                                                                             
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_GALERT_DEFS"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,                                     
	"DESCR" VARCHAR2(255 CHAR),                                                    
	"SEVERITY" NUMBER(10,0) NOT NULL ENABLE,                                       
	"ENABLED" NUMBER(1,0) NOT NULL ENABLE,                                         
	"CTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"MTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"DELETED" NUMBER(1,0) NOT NULL ENABLE,                                         
	"LAST_FIRED" NUMBER(19,0),                                                     
	"GROUP_ID" NUMBER(10,0) NOT NULL ENABLE,                                       
	"ESCALATION_ID" NUMBER(10,0),                                                  
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK64F3DAA5029EFD7" FOREIGN KEY ("ESCALATION_ID")                  
	  REFERENCES "HYPERIC_OWNER"."EAM_ESCALATION" ("ID") ENABLE,                   
	 CONSTRAINT "FK64F3DAACCE79AB8" FOREIGN KEY ("GROUP_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE_GROUP" ("ID") ENABLE                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_GALERT_LOGS"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"TIMESTAMP" NUMBER(19,0) NOT NULL ENABLE,                                      
	"FIXED" NUMBER(1,0) NOT NULL ENABLE,                                           
	"DEF_ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"SHORT_REASON" VARCHAR2(256 CHAR) NOT NULL ENABLE,                             
	"LONG_REASON" VARCHAR2(2048 CHAR) NOT NULL ENABLE,                             
	"PARTITION" NUMBER(10,0) NOT NULL ENABLE,                                      
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK653064B706267A5" FOREIGN KEY ("DEF_ID")                         
	  REFERENCES "HYPERIC_OWNER"."EAM_GALERT_DEFS" ("ID") ENABLE                   
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_GTRIGGERS"                                  
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"CONFIG_ID" NUMBER(10,0) NOT NULL ENABLE,                                      
	"TYPE_ID" NUMBER(10,0) NOT NULL ENABLE,                                        
	"STRAT_ID" NUMBER(10,0) NOT NULL ENABLE,                                       
	"LIDX" NUMBER(10,0) NOT NULL ENABLE,                                           
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK54AE97741DAB49E3" FOREIGN KEY ("CONFIG_ID")                     
	  REFERENCES "HYPERIC_OWNER"."EAM_CRISPO" ("ID") ENABLE,                       
	 CONSTRAINT "FK54AE97747D9B78AF" FOREIGN KEY ("STRAT_ID")                      
	  REFERENCES "HYPERIC_OWNER"."EAM_EXEC_STRATEGIES" ("ID") ENABLE,              
	 CONSTRAINT "FK54AE9774CE0FF839" FOREIGN KEY ("TYPE_ID")                       
	  REFERENCES "HYPERIC_OWNER"."EAM_GTRIGGER_TYPES" ("ID") ENABLE                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_GTRIGGER_TYPES"                             
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"TYPE_CLASS" VARCHAR2(255 CHAR) NOT NULL ENABLE,                               
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_IP"                                         
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"PLATFORM_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"ADDRESS" VARCHAR2(64 CHAR) NOT NULL ENABLE,                                   
	"NETMASK" VARCHAR2(64 CHAR),                                                   
	"MAC_ADDRESS" VARCHAR2(64 CHAR),                                               
	"CTIME" NUMBER(19,0),                                                          
	"MTIME" NUMBER(19,0),                                                          
	"CID" NUMBER(10,0),                                                            
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("PLATFORM_ID", "ADDRESS")                                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK7976C8F56796AA86" FOREIGN KEY ("PLATFORM_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_PLATFORM" ("ID") ON DELETE CASCADE ENABLE    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT"                                
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"INSTANCE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"TEMPLATE_ID" NUMBER(10,0) NOT NULL ENABLE,                                    
	"MTIME" NUMBER(19,0) NOT NULL ENABLE,                                          
	"ENABLED" NUMBER(1,0) NOT NULL ENABLE,                                         
	"COLL_INTERVAL" NUMBER(19,0) NOT NULL ENABLE,                                  
	"DSN" VARCHAR2(2048 CHAR) NOT NULL ENABLE,                                     
	"RESOURCE_ID" NUMBER(10,0),                                                    
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("INSTANCE_ID", "TEMPLATE_ID")                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK3E0F978EC37F24B8" FOREIGN KEY ("TEMPLATE_ID")                   
	  REFERENCES "HYPERIC_OWNER"."EAM_MEASUREMENT_TEMPL" ("ID") ENABLE,            
	 CONSTRAINT "FK3E0F978EFC176AE" FOREIGN KEY ("RESOURCE_ID")                    
	  REFERENCES "HYPERIC_OWNER"."EAM_RESOURCE" ("ID") ENABLE                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT_BL"                             
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"MEASUREMENT_ID" NUMBER(10,0),                                                 
	"COMPUTE_TIME" NUMBER(19,0) NOT NULL ENABLE,                                   
	"USER_ENTERED" NUMBER(1,0) NOT NULL ENABLE,                                    
	"MEAN" FLOAT(126),                                                             
	"MIN_EXPECTED_VAL" FLOAT(126),                                                 
	"MAX_EXPECTED_VAL" FLOAT(126),                                                 
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS NO
COMPRESS LOGGING                                                                
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK1877029BB6E3839C" FOREIGN KEY ("MEASUREMENT_ID")                
	  REFERENCES "HYPERIC_OWNER"."EAM_MEASUREMENT" ("ID") ON DELETE CASCADE ENABLE 
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "HYPERIC_OWNER"."EAM_MEASUREMENT_CAT"                            
   (	"ID" NUMBER(10,0) NOT NULL ENABLE,                                         
	"VERSION_COL" NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,                          
	"NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE,                                     
	 PRIMARY KEY ("ID")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 UNIQUE ("NAME")                                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "HYPERIC_OWNER"."EAM_MEASUREMENT_DATA" ("TIMESTAM
P", "MEASUREMENT_ID", "VALUE") AS                                               
  SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_0D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_0D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_1D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_1D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_2D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_2D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_3D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_3D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_4D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_4D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_5D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_5D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_6D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_6D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_7D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_7D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_8D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_8D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_COMPAT        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "HYPERIC_OWNER"."HQ_METRIC_DATA" ("TIMESTAMP", "M
EASUREMENT_ID", "VALUE") AS                                                     
  SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_0D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_0D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_1D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_1D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_2D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_2D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_3D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_3D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_4D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_4D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_5D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_5D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_6D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_6D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_7D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_7D_1S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_8D_0S UNION AL
L SELECT "TIMESTAMP","MEASUREMENT_ID","VALUE" FROM HQ_METRIC_DATA_8D_1S         
                                                                                
                                                                                
