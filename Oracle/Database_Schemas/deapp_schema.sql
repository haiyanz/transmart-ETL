                                                                                
  CREATE OR REPLACE FUNCTION "DEAPP"."NUMBER_PARSER" (                          
     numbers_to_parse IN varchar2                                               
)                                                                               
--Custom Collection type returned                                               
RETURN NUMBER_TABLE                                                             
                                                                                
IS                                                                              
   start_pos NUMBER;                                                            
   end_pos   NUMBER;                                                            
   string_length INTEGER;                                                       
   string_tokens VARCHAR2(32676);                                               
   counter INTEGER;                                                             
   token_value VARCHAR2(32676);                                                 
                                                                                
   list_values NUMBER_TABLE;                                                    
                                                                                
BEGIN                                                                           
  ------------------------------------------------------------------------------
-                                                                               
   -- Populates a temp_token table with parsed values for any comma separated li
st.                                                                             
   -- Requires a type so that multiple records can exist for different uses.    
   -- KCR@20090106 - First rev.                                                 
   -- Copyright c 2009 Recombinant Data Corp.                                   
   -----------------------------------------------------------------------------
--                                                                              
                                                                                
  --Add a delimiter to the end of the string so we dont lose last value         
  string_tokens := numbers_to_parse || ',';                                     
                                                                                
  --Initialize the collection                                                   
  list_values := NUMBER_TABLE() ;                                               
                                                                                
  --get length of string                                                        
  string_length := length(string_tokens);                                       
                                                                                
  --set start and end for first token                                           
  start_pos := 1;                                                               
  end_pos   := instr(string_tokens,',',1,1);                                    
  counter := 1;                                                                 
  LOOP                                                                          
    --Get substring                                                             
    token_value := to_number(substr(string_tokens, start_pos, end_pos - start_po
s));                                                                            
                                                                                
    --add values to collection                                                  
   list_values.EXTEND;                                                          
   list_values(list_Values.LAST):= token_value;                                 
                                                                                
    --Check to see if we are done                                               
    IF end_pos = string_length                                                  
    THEN                                                                        
      EXIT;                                                                     
    ELSE                                                                        
      -- Increment Start Pos and End Pos                                        
      start_pos := end_pos + 1;                                                 
      --increment counter                                                       
      counter := counter + 1;                                                   
      end_pos := instr(string_tokens, ',',1, counter);                          
                                                                                
    END IF;                                                                     
                                                                                
  END LOOP;                                                                     
                                                                                
  return list_values;                                                           
  --on an invalid value (Can't convert to number, just return the table of numbe
rs.                                                                             
  EXCEPTION WHEN OTHERS THEN                                                    
    return list_values;                                                         
                                                                                
                                                                                
END number_parser;                                                              
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "DEAPP"."TEXT_PARSER" (                            
		 text_to_parse IN VARCHAR2                                                    
)                                                                               
--Custom Collection type returned                                               
RETURN varchar_table                                                            
                                                                                
IS                                                                              
   start_pos NUMBER;                                                            
   end_pos   NUMBER;                                                            
   string_length INTEGER;                                                       
   string_tokens VARCHAR2(32676);                                               
   counter INTEGER;                                                             
   token_value VARCHAR2(100);                                                   
                                                                                
   list_values varchar_table;                                                   
                                                                                
BEGIN                                                                           
  ------------------------------------------------------------------------------
-                                                                               
   -- Populates a temp_token table with parsed values for any comma separated li
st.                                                                             
   -- Requires a type so that multiple records can exist for different uses.    
   -- KCR@20090106 - First rev.                                                 
   -- Copyright c 2009 Recombinant Data Corp.                                   
   -----------------------------------------------------------------------------
--                                                                              
                                                                                
  --Add a delimiter to the end of the string so we dont lose last value         
  string_tokens := text_to_parse || ',';                                        
                                                                                
  --Initialize the collection                                                   
  list_values := varchar_table() ;                                              
                                                                                
  --get length of string                                                        
  string_length := length(string_tokens);                                       
                                                                                
  --set start and end for first token                                           
  start_pos := 1;                                                               
  end_pos   := instr(string_tokens,',',1,1);                                    
  counter := 1;                                                                 
  LOOP                                                                          
    --Get substring                                                             
    token_value := substr(string_tokens, start_pos, end_pos - start_pos);       
                                                                                
    --add values to collection                                                  
   list_values.EXTEND;                                                          
   list_values(list_Values.LAST):= token_value;                                 
                                                                                
    --Check to see if we are done                                               
    IF end_pos = string_length                                                  
    THEN                                                                        
      EXIT;                                                                     
    ELSE                                                                        
      -- Increment Start Pos and End Pos                                        
      start_pos := end_pos + 1;                                                 
      --increment counter                                                       
      counter := counter + 1;                                                   
      end_pos := instr(string_tokens, ',',1, counter);                          
                                                                                
    END IF;                                                                     
  END LOOP;                                                                     
                                                                                
  return list_values;                                                           
                                                                                
END text_parser;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."DEXTPN_PARENT_NODE_U" ON "DEAPP"."DE_XTRIAL_PAREN
T_NAMES" ("ACROSS_PATH")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."U_SNP_PROBE_NAME" ON "DEAPP"."DE_SNP_PROBE" ("PRO
BE_NAME")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 83886080 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."U_SNP_INFO_NAME" ON "DEAPP"."DE_SNP_INFO" ("NAME"
)                                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 100663296 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."T_S_I_RS_IDX" ON "DEAPP"."TEST_SNP_INFO" ("RS_ID")      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021224" ON "DEAPP"."DE_SNP_PROBE_SORTED_DEF
" ("SNP_PROBE_SORTED_DEF_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021223" ON "DEAPP"."DE_SNP_DATA_BY_PROBE" (
"SNP_DATA_BY_PROBE_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021222" ON "DEAPP"."DE_SNP_DATA_BY_PATIENT"
 ("SNP_DATA_BY_PATIENT_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021119" ON "DEAPP"."DE_XTRIAL_PARENT_NAMES"
 ("PARENT_CD")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021117" ON "DEAPP"."DE_XTRIAL_CHILD_MAP" ("
CONCEPT_CD")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021116" ON "DEAPP"."DE_SUBJECT_SNP_DATASET"
 ("SUBJECT_SNP_DATASET_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021115" ON "DEAPP"."DE_SNP_SUBJECT_SORTED_D
EF" ("SNP_SUBJECT_SORTED_DEF_ID")                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021114" ON "DEAPP"."DE_SNP_PROBE" ("SNP_PRO
BE_ID")                                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 22020096 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021112" ON "DEAPP"."DE_SNP_INFO" ("SNP_INFO
_ID")                                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 22020096 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."SYS_C0021110" ON "DEAPP"."DE_SNP_DATA_DATASET_LOC
" ("SNP_DATA_DATASET_LOC_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."SNP_NAME_IDX1" ON "DEAPP"."DE_SNP_GENE_MAP" ("SNP_NAME")
                                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."SNP_HG19_MV_IDX2" ON "DEAPP"."DE_SNP_INFO_HG19_MV" ("CHR
OM", "POS")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 10                                                                   
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."IDX_VCF_SNPID" ON "DEAPP"."DE_RC_SNP_INFO" ("SNP_INFO_ID
")                                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255                                            
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "HG18"                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "HG19"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "HGXX"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" )                                                           
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."IDX_VCF_RSID" ON "DEAPP"."DE_RC_SNP_INFO" ("RS_ID")     
  PCTFREE 10 INITRANS 2 MAXTRANS 255                                            
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "HG18"                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "HG19"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "HGXX"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" )                                                           
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."IDX_VCF_POS" ON "DEAPP"."DE_RC_SNP_INFO" ("POS")        
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) LOCAL       
 (PARTITION "HG18"                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HG19"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HGXX"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" )                                                          
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."IDX_SNP_CALLS_2" ON "DEAPP"."DE_SNP_CALLS_BY_GSM" ("PATI
ENT_NUM", "SNP_NAME")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE BITMAP INDEX "DEAPP"."IDX_SNP_CALLS_1" ON "DEAPP"."DE_SNP_CALLS_BY_GSM"
 ("PATIENT_NUM", "GSM_NUM")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."IDX_RC_SNP_INFO_POS" ON "DEAPP"."DE_RC_SNP_INFO_ALL" ("P
OS")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255                                            
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "HG18"                                                              
PCTFREE 10 INITRANS 2 MAXTRANS 255                                              
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"                                                             
 ( SUBPARTITION "HG18_CHR1"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR2"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR3"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR4"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR5"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR6"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR7"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR8"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR9"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR10"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR11"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR12"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR13"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR14"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR15"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR16"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR17"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR18"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR19"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR20"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR21"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHR22"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHRX"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHRY"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHRM"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG18_CHRO"                                                      
   TABLESPACE "INDX" ) ,                                                        
 PARTITION "HG19"                                                               
PCTFREE 10 INITRANS 2 MAXTRANS 255                                              
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"                                                             
 ( SUBPARTITION "HG19_CHR1"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR2"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR3"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR4"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR5"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR6"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR7"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR8"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR9"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR10"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR11"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR12"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR13"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR14"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR15"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR16"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR17"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR18"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR19"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR20"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR21"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHR22"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHRX"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHRY"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHRM"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HG19_CHRO"                                                      
   TABLESPACE "INDX" ) ,                                                        
 PARTITION "HGXX"                                                               
PCTFREE 10 INITRANS 2 MAXTRANS 255                                              
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"                                                             
 ( SUBPARTITION "HGXX_CHR1"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR2"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR3"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR4"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR5"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR6"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR7"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR8"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR9"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR10"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR11"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR12"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR13"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR14"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR15"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR16"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR17"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR18"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR19"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR20"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR21"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHR22"                                                     
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHRX"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHRY"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHRM"                                                      
   TABLESPACE "INDX" ,                                                          
  SUBPARTITION "HGXX_CHRO"                                                      
   TABLESPACE "INDX" ) )                                                        
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."IDX_DE_RC_SNP_INFO_RSID" ON "DEAPP"."DE_RC_SNP_INFO_ALL"
 ("RS_ID")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."ENTREZ_IDX1" ON "DEAPP"."DE_SNP_GENE_MAP" ("ENTREZ_GENE_
ID")                                                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_SUBJECT_SMPL_MPNG_IDX3" ON "DEAPP"."DE_SUBJECT_SAMPLE
_MAPPING" ("ASSAY_ID")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_SUBJECT_SMPL_MPNG_IDX2" ON "DEAPP"."DE_SUBJECT_SAMPLE
_MAPPING" ("PATIENT_ID", "TIMEPOINT_CD", "PLATFORM_CD", "ASSAY_ID", "TRIAL_NAME"
)                                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_SUBJECT_SMPL_MPNG_IDX1" ON "DEAPP"."DE_SUBJECT_SAMPLE
_MAPPING" ("TIMEPOINT", "PATIENT_ID", "TRIAL_NAME")                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_SNP_INFO_HG19_MV_INDEX1" ON "DEAPP"."DE_SNP_INFO_HG19
_MV" ("RS_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_SNP_GM_SNP_G_IDX" ON "DEAPP"."DE_SNP_GENE_MAP" ("SNP_
NAME", "GENE_NAME")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_RSNP_CHROM_IDX" ON "DEAPP"."DE_RC_SNP_INFO" ("CHROM")
                                                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255                                            
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) LOCAL       
 (PARTITION "HG18"                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HG19"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HGXX"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" )                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_RSNP_CHROMPOS_IDX" ON "DEAPP"."DE_RC_SNP_INFO" ("CHRO
M", "POS")                                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255                                            
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) LOCAL       
 (PARTITION "HG18"                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HG19"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HGXX"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" )                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."DE_PATHWAY_PK" ON "DEAPP"."DE_PATHWAY" ("ID")    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "DEAPP"."DE_PATHWAY_GENE_PK" ON "DEAPP"."DE_PATHWAY_GENE" 
("ID")                                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_MRNA_ANNOTATION_INDEX1" ON "DEAPP"."DE_MRNA_ANNOTATIO
N" ("PROBESET_ID")                                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE BITMAP INDEX "DEAPP"."DE_MICROARRAY_DATA_IDX4" ON "DEAPP"."DE_SUBJECT_M
ICROARRAY_DATA" ("PROBESET_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "A:A"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "GSE4382:STD"                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:STD"                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:MIRNA"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "B0151006:PFIZER"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDD"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDC"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" )                                                           
                                                                                
                                                                                
                                                                                
  CREATE BITMAP INDEX "DEAPP"."DE_MICROARRAY_DATA_IDX3" ON "DEAPP"."DE_SUBJECT_M
ICROARRAY_DATA" ("ASSAY_ID")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "A:A"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "GSE4382:STD"                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:STD"                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:MIRNA"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "B0151006:PFIZER"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDD"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDC"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" )                                                           
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_MICROARRAY_DATA_IDX2" ON "DEAPP"."DE_SUBJECT_MICROARR
AY_DATA" ("ASSAY_ID", "PROBESET_ID")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "A:A"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "GSE4382:STD"                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:STD"                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:MIRNA"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "B0151006:PFIZER"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDD"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDC"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ) COMPRESS 2                                                
                                                                                
                                                                                
                                                                                
  CREATE INDEX "DEAPP"."DE_MICROARRAY_DATA_IDX1" ON "DEAPP"."DE_SUBJECT_MICROARR
AY_DATA" ("TRIAL_NAME", "ASSAY_ID", "PROBESET_ID")                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "INDX"  LOCAL                                                      
 (PARTITION "A:A"                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "GSE4382:STD"                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:STD"                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "A90000001:MIRNA"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "B0151006:PFIZER"                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDD"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ,                                                           
 PARTITION "BOLD:STDC"                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255  NOLOGGING                                 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX" ) COMPRESS 3                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "DEAPP"."DUMP_TABLE_TO_CSV" ( p_tname in varchar2,
                                                                                
                                                   p_dir   in varchar2,         
                                                   p_filename in varchar2 )     
    is                                                                          
        l_output        utl_file.file_type;                                     
        l_theCursor     integer default dbms_sql.open_cursor;                   
        l_columnValue   varchar2(4000);                                         
        l_status        integer;                                                
        l_query         varchar2(1000)                                          
                       default 'select * from ' || p_tname;                     
       l_colCnt        number := 0;                                             
       l_separator     varchar2(1);                                             
       l_descTbl       dbms_sql.desc_tab;                                       
   begin                                                                        
       l_output := utl_file.fopen( p_dir, p_filename, 'w' );                    
       execute immediate 'alter session set nls_date_format=''dd-mon-yyyy hh24:m
i:ss''                                                                          
';                                                                              
                                                                                
       dbms_sql.parse(  l_theCursor,  l_query, dbms_sql.native );               
       dbms_sql.describe_columns( l_theCursor, l_colCnt, l_descTbl );           
                                                                                
      for i in 1 .. l_colCnt loop                                               
           utl_file.put( l_output, l_separator || '"' || l_descTbl(i).col_name |
| '"'                                                                           
);                                                                              
           dbms_sql.define_column( l_theCursor, i, l_columnValue, 4000 );       
          l_separator := ',';                                                   
       end loop;                                                                
       utl_file.new_line( l_output );                                           
                                                                                
       l_status := dbms_sql.execute(l_theCursor);                               
                                                                                
       while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop                      
           l_separator := '';                                                   
           for i in 1 .. l_colCnt loop                                          
               dbms_sql.column_value( l_theCursor, i, l_columnValue );          
               utl_file.put( l_output, l_separator || l_columnValue );          
               l_separator := ',';                                              
           end loop;                                                            
           utl_file.new_line( l_output );                                       
       end loop;                                                                
       dbms_sql.close_cursor(l_theCursor);                                      
       utl_file.fclose( l_output );                                             
                                                                                
       execute immediate 'alter session set nls_date_format=''dd-MON-yy'' ';    
   exception                                                                    
       when others then                                                         
           execute immediate 'alter session set nls_date_format=''dd-MON-yy'' ';
                                                                                
           raise;                                                               
   end;                                                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "DEAPP"."UTIL_GRANT_ALL"                          
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "DEAPP"."DE_CONTEXT_SEQ"  MINVALUE 1 MAXVALUE 99999999999999
99999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "DEAPP"."SEQ_DATA_ID"  MINVALUE 1 MAXVALUE 99999999999999999
99999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE               
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "DEAPP"."SEQ_ASSAY_ID"  MINVALUE 1 MAXVALUE 9999999999999999
999999999999 INCREMENT BY 1 START WITH 22586 CACHE 20 NOORDER  NOCYCLE          
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "DEAPP"."DE_PARENT_CD_SEQ"  MINVALUE 1 MAXVALUE 999999999999
9999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DEAPP_ANNOTATION"                                       
   (	"ANNOTATION_TYPE" VARCHAR2(50),                                            
	"ANNOTATION_VALUE" VARCHAR2(100),                                              
	"GENE_ID" NUMBER,                                                              
	"GENE_SYMBOL" VARCHAR2(200)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."TEST_SNP_INFO"                                          
   (	"SNP_INFO_ID" NUMBER(22,0),                                                
	"RS_ID" NVARCHAR2(50),                                                         
	"CHROM" VARCHAR2(4),                                                           
	"POS" NUMBER(10,0),                                                            
	"HG_VERSION" VARCHAR2(10)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."HAPLOVIEW_DATA"                                         
   (	"I2B2_ID" NUMBER(20,0),                                                    
	"JNJ_ID" VARCHAR2(30),                                                         
	"FATHER_ID" NUMBER(5,0),                                                       
	"MOTHER_ID" NUMBER(5,0),                                                       
	"SEX" NUMBER(1,0),                                                             
	"AFFECTION_STATUS" NUMBER(1,0),                                                
	"CHROMOSOME" VARCHAR2(10),                                                     
	"GENE" VARCHAR2(50),                                                           
	"RELEASE" NUMBER(4,0),                                                         
	"RELEASE_DATE" DATE,                                                           
	"TRIAL_NAME" VARCHAR2(50),                                                     
	"SNP_DATA" CLOB                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
 LOB ("SNP_DATA") STORE AS BASICFILE (                                          
  TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION                 
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_XTRIAL_PARENT_NAMES"                                 
   (	"PARENT_CD" NUMBER NOT NULL ENABLE,                                        
	"ACROSS_PATH" VARCHAR2(500),                                                   
	"MANUALLY_CREATED" NUMBER,                                                     
	 CONSTRAINT "DEXTPN_PARENT_NODE_U" UNIQUE ("ACROSS_PATH")                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE,                                                   
	 PRIMARY KEY ("PARENT_CD")                                                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_XTRIAL_CHILD_MAP"                                    
   (	"CONCEPT_CD" VARCHAR2(50) NOT NULL ENABLE,                                 
	"PARENT_CD" NUMBER NOT NULL ENABLE,                                            
	"MANUALLY_MAPPED" NUMBER,                                                      
	"STUDY_ID" VARCHAR2(50),                                                       
	 PRIMARY KEY ("CONCEPT_CD")                                                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE,                                                   
	 CONSTRAINT "DEXCM_PARENT_CD_FK" FOREIGN KEY ("PARENT_CD")                     
	  REFERENCES "DEAPP"."DE_XTRIAL_PARENT_NAMES" ("PARENT_CD") DISABLE            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_SNP_DATASET"                                 
   (	"SUBJECT_SNP_DATASET_ID" NUMBER(22,0),                                     
	"DATASET_NAME" VARCHAR2(255),                                                  
	"CONCEPT_CD" VARCHAR2(255),                                                    
	"PLATFORM_NAME" VARCHAR2(255),                                                 
	"TRIAL_NAME" VARCHAR2(255),                                                    
	"PATIENT_NUM" NUMBER,                                                          
	"TIMEPOINT" VARCHAR2(255),                                                     
	"SUBJECT_ID" VARCHAR2(255),                                                    
	"SAMPLE_TYPE" VARCHAR2(255),                                                   
	"PAIRED_DATASET_ID" NUMBER(22,0),                                              
	"PATIENT_GENDER" VARCHAR2(1),                                                  
	 PRIMARY KEY ("SUBJECT_SNP_DATASET_ID")                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_SAMPLE_MAPPING"                              
   (	"PATIENT_ID" NUMBER(18,0),                                                 
	"SITE_ID" NVARCHAR2(100),                                                      
	"SUBJECT_ID" NVARCHAR2(100),                                                   
	"SUBJECT_TYPE" NVARCHAR2(100),                                                 
	"CONCEPT_CODE" VARCHAR2(1000 CHAR),                                            
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_UID" VARCHAR2(50),                                                    
	"SAMPLE_TYPE" VARCHAR2(100),                                                   
	"ASSAY_UID" NVARCHAR2(100),                                                    
	"TRIAL_NAME" VARCHAR2(30),                                                     
	"TIMEPOINT" VARCHAR2(100),                                                     
	"TIMEPOINT_CD" VARCHAR2(50),                                                   
	"SAMPLE_TYPE_CD" VARCHAR2(50),                                                 
	"TISSUE_TYPE_CD" VARCHAR2(50),                                                 
	"PLATFORM" VARCHAR2(50),                                                       
	"PLATFORM_CD" VARCHAR2(50),                                                    
	"TISSUE_TYPE" VARCHAR2(100),                                                   
	"DATA_UID" VARCHAR2(100),                                                      
	"GPL_ID" VARCHAR2(20),                                                         
	"RBM_PANEL" VARCHAR2(50),                                                      
	"SAMPLE_ID" NUMBER(22,0),                                                      
	"SAMPLE_CD" VARCHAR2(200),                                                     
	"CATEGORY_CD" VARCHAR2(1000),                                                  
	"SOURCE_CD" VARCHAR2(50),                                                      
	"OMIC_SOURCE_STUDY" VARCHAR2(200),                                             
	"OMIC_PATIENT_ID" NUMBER(18,0)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_RBM_DATA"                                    
   (	"TRIAL_NAME" VARCHAR2(15),                                                 
	"ANTIGEN_NAME" VARCHAR2(100),                                                  
	"N_VALUE" NUMBER,                                                              
	"PATIENT_ID" NUMBER(38,0),                                                     
	"GENE_SYMBOL" VARCHAR2(100),                                                   
	"GENE_ID" NUMBER(10,0),                                                        
	"ASSAY_ID" NUMBER,                                                             
	"NORMALIZED_VALUE" NUMBER(18,5),                                               
	"CONCEPT_CD" NVARCHAR2(100),                                                   
	"TIMEPOINT" VARCHAR2(100),                                                     
	"DATA_UID" VARCHAR2(100),                                                      
	"VALUE" NUMBER,                                                                
	"LOG_INTENSITY" NUMBER,                                                        
	"MEAN_INTENSITY" NUMBER,                                                       
	"STDDEV_INTENSITY" NUMBER,                                                     
	"MEDIAN_INTENSITY" NUMBER,                                                     
	"ZSCORE" NUMBER,                                                               
	"RBM_PANEL" VARCHAR2(50)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_PROTEIN_DATA"                                
   (	"TRIAL_NAME" VARCHAR2(15),                                                 
	"COMPONENT" VARCHAR2(15),                                                      
	"INTENSITY" NUMBER,                                                            
	"PATIENT_ID" NUMBER(38,0),                                                     
	"SUBJECT_ID" VARCHAR2(10),                                                     
	"GENE_SYMBOL" VARCHAR2(100),                                                   
	"GENE_ID" NUMBER(10,0),                                                        
	"ASSAY_ID" NUMBER,                                                             
	"TIMEPOINT" VARCHAR2(20),                                                      
	"N_VALUE" NUMBER,                                                              
	"MEAN_INTENSITY" NUMBER,                                                       
	"STDDEV_INTENSITY" NUMBER,                                                     
	"MEDIAN_INTENSITY" NUMBER,                                                     
	"ZSCORE" NUMBER                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_MICROARRAY_MED"                              
   (	"PROBESET" VARCHAR2(50),                                                   
	"RAW_INTENSITY" NUMBER,                                                        
	"LOG_INTENSITY" NUMBER,                                                        
	"GENE_SYMBOL" VARCHAR2(50),                                                    
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(18,0),                                                     
	"SUBJECT_ID" VARCHAR2(20),                                                     
	"TRIAL_NAME" VARCHAR2(15),                                                     
	"TIMEPOINT" VARCHAR2(30),                                                      
	"PVALUE" FLOAT(126),                                                           
	"REFSEQ" VARCHAR2(50),                                                         
	"MEAN_INTENSITY" NUMBER,                                                       
	"STDDEV_INTENSITY" NUMBER,                                                     
	"MEDIAN_INTENSITY" NUMBER,                                                     
	"ZSCORE" NUMBER                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_MICROARRAY_LOGS"                             
   (	"PROBESET" VARCHAR2(50),                                                   
	"RAW_INTENSITY" NUMBER,                                                        
	"PVALUE" FLOAT(126),                                                           
	"REFSEQ" VARCHAR2(50),                                                         
	"GENE_SYMBOL" VARCHAR2(50),                                                    
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(18,0),                                                     
	"SUBJECT_ID" VARCHAR2(20),                                                     
	"TRIAL_NAME" VARCHAR2(15),                                                     
	"TIMEPOINT" VARCHAR2(30),                                                      
	"LOG_INTENSITY" NUMBER                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_MICROARRAY_DATA_OLD"                         
   (	"TRIAL_NAME" VARCHAR2(50),                                                 
	"PROBESET_ID" NUMBER(22,0),                                                    
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(18,0),                                                     
	"RAW_INTENSITY" NUMBER(18,4),                                                  
	"LOG_INTENSITY" NUMBER(18,4),                                                  
	"ZSCORE" NUMBER(18,4),                                                         
	"RAW_INTENSITY_4" NUMBER(18,4)                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SUBJECT_MICROARRAY_DATA"                             
   (	"TRIAL_SOURCE" VARCHAR2(200),                                              
	"TRIAL_NAME" VARCHAR2(50),                                                     
	"PROBESET_ID" NUMBER(22,0),                                                    
	"ASSAY_ID" NUMBER(18,0),                                                       
	"PATIENT_ID" NUMBER(18,0),                                                     
	"RAW_INTENSITY" NUMBER(18,4),                                                  
	"LOG_INTENSITY" NUMBER(18,4),                                                  
	"ZSCORE" NUMBER(18,4)                                                          
   ) PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS BASIC  NOLOGGING     
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "DEAPP"                                                            
  PARTITION BY LIST ("TRIAL_SOURCE")                                            
 (PARTITION "A:A"  VALUES ('A:A')                                               
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC ,                                           
 PARTITION "GSE4382:STD"  VALUES ('GSE4382:STD')                                
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC ,                                           
 PARTITION "A90000001:STD"  VALUES ('A90000001:STD')                            
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC ,                                           
 PARTITION "A90000001:MIRNA"  VALUES ('A90000001:MIRNA')                        
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC ,                                           
 PARTITION "B0151006:PFIZER"  VALUES ('B0151006:PFIZER')                        
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC ,                                           
 PARTITION "BOLD:STDD"  VALUES ('BOLD:STDD')                                    
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC ,                                           
 PARTITION "BOLD:STDC"  VALUES ('BOLD:STDC')                                    
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                       
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" COMPRESS BASIC )                                           
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_SUBJECT_SORTED_DEF"                              
   (	"SNP_SUBJECT_SORTED_DEF_ID" NUMBER(22,0),                                  
	"TRIAL_NAME" VARCHAR2(255),                                                    
	"PATIENT_POSITION" NUMBER(5,0),                                                
	"PATIENT_NUM" NUMBER,                                                          
	"SUBJECT_ID" VARCHAR2(255),                                                    
	 PRIMARY KEY ("SNP_SUBJECT_SORTED_DEF_ID")                                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_PROBE_SORTED_DEF"                                
   (	"SNP_PROBE_SORTED_DEF_ID" NUMBER(22,0),                                    
	"PLATFORM_NAME" VARCHAR2(255),                                                 
	"NUM_PROBE" NUMBER,                                                            
	"CHROM" VARCHAR2(16),                                                          
	"PROBE_DEF" CLOB,                                                              
	"SNP_ID_DEF" CLOB,                                                             
	 PRIMARY KEY ("SNP_PROBE_SORTED_DEF_ID")                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
 LOB ("PROBE_DEF") STORE AS BASICFILE (                                         
  TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION                 
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("SNP_ID_DEF") STORE AS BASICFILE (                                        
  TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION                 
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_PROBE"                                           
   (	"SNP_PROBE_ID" NUMBER(22,0),                                               
	"PROBE_NAME" VARCHAR2(255),                                                    
	"SNP_ID" NUMBER(22,0),                                                         
	"SNP_NAME" VARCHAR2(255),                                                      
	"VENDOR_NAME" VARCHAR2(255),                                                   
	 CONSTRAINT "U_SNP_PROBE_NAME" UNIQUE ("PROBE_NAME")                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 83886080 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 PRIMARY KEY ("SNP_PROBE_ID")                                                  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 22020096 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"  ENABLE,                                               
	 CONSTRAINT "FK_SNP_PROBE_SNP_ID" FOREIGN KEY ("SNP_ID")                       
	  REFERENCES "DEAPP"."DE_SNP_INFO" ("SNP_INFO_ID") DISABLE                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 83886080 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_INFO_HG19_MV"                                    
   (	"RS_ID" NVARCHAR2(50),                                                     
	"CHROM" VARCHAR2(4),                                                           
	"POS" NUMBER(10,0),                                                            
	"RSGENE" NVARCHAR2(200)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
  CACHE PARALLEL 10                                                             
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_INFO"                                            
   (	"SNP_INFO_ID" NUMBER(22,0),                                                
	"NAME" VARCHAR2(255),                                                          
	"CHROM" VARCHAR2(16),                                                          
	"CHROM_POS" NUMBER,                                                            
	 CONSTRAINT "U_SNP_INFO_NAME" UNIQUE ("NAME")                                  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 100663296 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE,                                                   
	 PRIMARY KEY ("SNP_INFO_ID")                                                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 22020096 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 75497472 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE ROW MOVEMENT                                       
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_GENE_MAP"                                        
   (	"SNP_ID" NUMBER(22,0),                                                     
	"SNP_NAME" NVARCHAR2(50),                                                      
	"ENTREZ_GENE_ID" NUMBER,                                                       
	"GENE_NAME" NVARCHAR2(200)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_DATA_DATASET_LOC"                                
   (	"SNP_DATA_DATASET_LOC_ID" NUMBER(22,0),                                    
	"TRIAL_NAME" VARCHAR2(255),                                                    
	"SNP_DATASET_ID" NUMBER(22,0),                                                 
	"LOCATION" NUMBER,                                                             
	 PRIMARY KEY ("SNP_DATA_DATASET_LOC_ID")                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE,                                                   
	 CONSTRAINT "FK_SNP_LOC_DATASET_ID" FOREIGN KEY ("SNP_DATASET_ID")             
	  REFERENCES "DEAPP"."DE_SUBJECT_SNP_DATASET" ("SUBJECT_SNP_DATASET_ID") ENABLE
                                                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_DATA_BY_PROBE"                                   
   (	"SNP_DATA_BY_PROBE_ID" NUMBER(22,0),                                       
	"PROBE_ID" NUMBER(22,0),                                                       
	"PROBE_NAME" VARCHAR2(255),                                                    
	"SNP_ID" NUMBER(22,0),                                                         
	"SNP_NAME" VARCHAR2(255),                                                      
	"TRIAL_NAME" VARCHAR2(255),                                                    
	"DATA_BY_PROBE" CLOB,                                                          
	 PRIMARY KEY ("SNP_DATA_BY_PROBE_ID")                                          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE,                                                   
	 CONSTRAINT "FK_SNP_BY_PROBE_SNP_ID" FOREIGN KEY ("SNP_ID")                    
	  REFERENCES "DEAPP"."DE_SNP_INFO" ("SNP_INFO_ID") DISABLE                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 83886080 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
 LOB ("DATA_BY_PROBE") STORE AS BASICFILE (                                     
  TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION                 
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_DATA_BY_PATIENT"                                 
   (	"SNP_DATA_BY_PATIENT_ID" NUMBER(22,0),                                     
	"SNP_DATASET_ID" NUMBER(22,0),                                                 
	"TRIAL_NAME" VARCHAR2(255),                                                    
	"PATIENT_NUM" NUMBER,                                                          
	"CHROM" VARCHAR2(16),                                                          
	"DATA_BY_PATIENT_CHR" CLOB,                                                    
	"PED_BY_PATIENT_CHR" CLOB,                                                     
	 PRIMARY KEY ("SNP_DATA_BY_PATIENT_ID")                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE,                                                   
	 CONSTRAINT "FK_SNP_DATASET_ID" FOREIGN KEY ("SNP_DATASET_ID")                 
	  REFERENCES "DEAPP"."DE_SUBJECT_SNP_DATASET" ("SUBJECT_SNP_DATASET_ID") DISABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
 LOB ("DATA_BY_PATIENT_CHR") STORE AS BASICFILE (                               
  TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION                 
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("PED_BY_PATIENT_CHR") STORE AS BASICFILE (                                
  TABLESPACE "DEAPP" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION                 
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_COPY_NUMBER"                                     
   (	"PATIENT_NUM" NUMBER(20,0),                                                
	"SNP_NAME" VARCHAR2(50),                                                       
	"CHROM" VARCHAR2(2),                                                           
	"CHROM_POS" NUMBER(20,0),                                                      
	"COPY_NUMBER" NUMBER(2,0)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SNP_CALLS_BY_GSM"                                    
   (	"GSM_NUM" VARCHAR2(20),                                                    
	"PATIENT_NUM" NUMBER(20,0),                                                    
	"SNP_NAME" VARCHAR2(100),                                                      
	"SNP_CALLS" VARCHAR2(4)                                                        
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_SAVED_COMPARISON"                                    
   (	"COMPARISON_ID" NUMBER NOT NULL ENABLE,                                    
	"QUERY_ID1" NUMBER,                                                            
	"QUERY_ID2" NUMBER                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_RC_SNP_INFO_ALL"                                     
   (	"SNP_INFO_ID" NUMBER(22,0),                                                
	"RS_ID" VARCHAR2(100),                                                         
	"CHROM" VARCHAR2(4),                                                           
	"POS" NUMBER(10,0),                                                            
	"REF" VARCHAR2(3000),                                                          
	"ALT" VARCHAR2(3000),                                                          
	"GENE_INFO" VARCHAR2(1000),                                                    
	"VARIATION_CLASS" VARCHAR2(10),                                                
	"STRAND" VARCHAR2(1),                                                          
	"CLINSIG" VARCHAR2(100),                                                       
	"DISEASE" VARCHAR2(500),                                                       
	"GMAF" NUMBER(10,0),                                                           
	"GENE_BIOTYPE" VARCHAR2(100),                                                  
	"IMPACT" VARCHAR2(50),                                                         
	"TRANSCRIPT_ID" VARCHAR2(100),                                                 
	"FUNCTIONAL_CLASS" VARCHAR2(100),                                              
	"EFFECT" VARCHAR2(100),                                                        
	"EXON_ID" VARCHAR2(100),                                                       
	"AMINO_ACID_CHANGE" VARCHAR2(50),                                              
	"CODON_CHANGE" VARCHAR2(100),                                                  
	"HG_VERSION" VARCHAR2(10)                                                      
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "DEAPP"                                                            
  PARTITION BY LIST ("HG_VERSION")                                              
  SUBPARTITION BY LIST ("CHROM")                                                
  SUBPARTITION TEMPLATE (                                                       
    SUBPARTITION "CHR1" VALUES ( '1' ),                                         
    SUBPARTITION "CHR2" VALUES ( '2' ),                                         
    SUBPARTITION "CHR3" VALUES ( '3' ),                                         
    SUBPARTITION "CHR4" VALUES ( '4' ),                                         
    SUBPARTITION "CHR5" VALUES ( '5' ),                                         
    SUBPARTITION "CHR6" VALUES ( '6' ),                                         
    SUBPARTITION "CHR7" VALUES ( '7' ),                                         
    SUBPARTITION "CHR8" VALUES ( '8' ),                                         
    SUBPARTITION "CHR9" VALUES ( '9' ),                                         
    SUBPARTITION "CHR10" VALUES ( '10' ),                                       
    SUBPARTITION "CHR11" VALUES ( '11' ),                                       
    SUBPARTITION "CHR12" VALUES ( '12' ),                                       
    SUBPARTITION "CHR13" VALUES ( '13' ),                                       
    SUBPARTITION "CHR14" VALUES ( '14' ),                                       
    SUBPARTITION "CHR15" VALUES ( '15' ),                                       
    SUBPARTITION "CHR16" VALUES ( '16' ),                                       
    SUBPARTITION "CHR17" VALUES ( '17' ),                                       
    SUBPARTITION "CHR18" VALUES ( '18' ),                                       
    SUBPARTITION "CHR19" VALUES ( '19' ),                                       
    SUBPARTITION "CHR20" VALUES ( '20' ),                                       
    SUBPARTITION "CHR21" VALUES ( '21' ),                                       
    SUBPARTITION "CHR22" VALUES ( '22' ),                                       
    SUBPARTITION "CHRX" VALUES ( 'X' ),                                         
    SUBPARTITION "CHRY" VALUES ( 'Y' ),                                         
    SUBPARTITION "CHRM" VALUES ( 'M' ),                                         
    SUBPARTITION "CHRO" VALUES ( default ) )                                    
 (PARTITION "HG18"  VALUES ('18')                                               
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255                                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HG19"  VALUES ('19')                                                
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255                                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "DEAPP" ,                                                          
 PARTITION "HGXX"  VALUES (default)                                             
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255                                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "DEAPP" )  ENABLE ROW MOVEMENT                                     
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_RC_SNP_INFO"                                         
   (	"SNP_INFO_ID" NUMBER(22,0),                                                
	"RS_ID" NVARCHAR2(50),                                                         
	"CHROM" VARCHAR2(4),                                                           
	"POS" NUMBER(10,0),                                                            
	"HG_VERSION" VARCHAR2(10)                                                      
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                   
  STORAGE(                                                                      
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)             
  TABLESPACE "DEAPP"                                                            
  PARTITION BY LIST ("HG_VERSION")                                              
 (PARTITION "HG18"  VALUES ('18')                                               
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" NOCOMPRESS ,                                               
 PARTITION "HG19"  VALUES ('19')                                                
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" NOCOMPRESS ,                                               
 PARTITION "HGXX"  VALUES (default)                                             
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOLOGGING                      
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP" NOCOMPRESS )                                               
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_PATHWAY_GENE"                                        
   (	"ID" NUMBER(18,0) NOT NULL ENABLE,                                         
	"PATHWAY_ID" NUMBER(18,0),                                                     
	"GENE_SYMBOL" NVARCHAR2(200),                                                  
	"GENE_ID" NVARCHAR2(200),                                                      
	 CONSTRAINT "DE_PATHWAY_GENE_PK" PRIMARY KEY ("ID")                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 917504 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_PATHWAY"                                             
   (	"NAME" NVARCHAR2(300),                                                     
	"DESCRIPTION" NVARCHAR2(510),                                                  
	"ID" NUMBER(18,0) NOT NULL ENABLE,                                             
	"TYPE" NVARCHAR2(100),                                                         
	"SOURCE" NVARCHAR2(100),                                                       
	"EXTERNALID" NVARCHAR2(100),                                                   
	"PATHWAY_UID" VARCHAR2(200),                                                   
	"USER_ID" NUMBER(18,0),                                                        
	 CONSTRAINT "DE_PATHWAY_PK" PRIMARY KEY ("ID")                                 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"  ENABLE                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_MRNA_ANNOTATION"                                     
   (	"GPL_ID" VARCHAR2(100),                                                    
	"PROBE_ID" VARCHAR2(100),                                                      
	"GENE_SYMBOL" VARCHAR2(100),                                                   
	"PROBESET_ID" NUMBER(38,0),                                                    
	"GENE_ID" NUMBER(18,0),                                                        
	"ORGANISM" VARCHAR2(200)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_GPL_INFO"                                            
   (	"PLATFORM" VARCHAR2(50),                                                   
	"TITLE" VARCHAR2(500),                                                         
	"ORGANISM" VARCHAR2(100),                                                      
	"ANNOTATION_DATE" TIMESTAMP (6),                                               
	"MARKER_TYPE" VARCHAR2(100),                                                   
	"RELEASE_NBR" VARCHAR2(200)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_CONCEPT_CONTEXT"                                     
   (	"DE_CONTEXT_ID" NUMBER,                                                    
	"CONCEPT_CD" VARCHAR2(50)                                                      
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE TABLE "DEAPP"."DE_CONTEXT"                                             
   (	"DE_CONTEXT_ID" NUMBER,                                                    
	"DE_CONTEXT_NAME" VARCHAR2(100) NOT NULL ENABLE                                
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  TABLESPACE "DEAPP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."DE_CONTEXT_TRIGGER"                        
before                                                                          
  insert on DEAPP.DE_CONTEXT for each row                                       
begin                                                                           
   select DEAPP.de_context_seq.nextval into :new.DE_CONTEXT_ID from dual;       
end;                                                                            
                                                                                
                                                                                
ALTER TRIGGER "DEAPP"."DE_CONTEXT_TRIGGER" ENABLE                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_SNP_SUBJECT_SORTED_DEF_ID"             
before insert on DE_SNP_SUBJECT_SORTED_DEF                                      
for each row                                                                    
begin                                                                           
if inserting then                                                               
if :NEW.SNP_SUBJECT_SORTED_DEF_ID is null then                                  
select BIOMART.SEQ_BIO_DATA_ID.nextval into :NEW.SNP_SUBJECT_SORTED_DEF_ID from 
dual;                                                                           
end if;                                                                         
end if;                                                                         
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_SNP_SUBJECT_SORTED_DEF_ID" ENABLE                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_SNP_DATA_DATASET_LOC_ID"               
before insert on DE_SNP_DATA_DATASET_LOC                                        
for each row                                                                    
begin                                                                           
   if inserting then                                                            
      if :NEW.SNP_DATA_DATASET_LOC_ID is null then                              
         select BIOMART.SEQ_BIO_DATA_ID.nextval into :NEW.SNP_DATA_DATASET_LOC_I
D from dual;                                                                    
      end if;                                                                   
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_SNP_DATA_DATASET_LOC_ID" ENABLE                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_SNP_DATA_BY_PPROBE_ID"                 
before insert on DE_SNP_DATA_BY_PROBE                                           
for each row                                                                    
begin                                                                           
   if inserting then                                                            
      if :NEW.SNP_DATA_BY_PROBE_ID is null then                                 
         select BIOMART.SEQ_BIO_DATA_ID.nextval into :NEW.SNP_DATA_BY_PROBE_ID f
rom dual;                                                                       
      end if;                                                                   
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_SNP_DATA_BY_PPROBE_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_SNP_DATA_BY_PATIENT_ID"                
before insert on DE_SNP_DATA_BY_PATIENT                                         
for each row                                                                    
begin                                                                           
   if inserting then                                                            
      if :NEW.SNP_DATA_BY_PATIENT_ID is null then                               
         select BIOMART.SEQ_BIO_DATA_ID.nextval into :NEW.SNP_DATA_BY_PATIENT_ID
 from dual;                                                                     
      end if;                                                                   
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_SNP_DATA_BY_PATIENT_ID" ENABLE                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_SUBJECT_SORTED_DEF_ID"              
before insert on DE_SNP_SUBJECT_SORTED_DEF                                      
for each row                                                                    
begin                                                                           
if inserting then                                                               
if :NEW.SNP_SUBJECT_SORTED_DEF_ID is null then                                  
select BIOMART.SEQ_BIO_DATA_ID.nextval into :NEW.SNP_SUBJECT_SORTED_DEF_ID from 
dual;                                                                           
end if;                                                                         
end if;                                                                         
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_SUBJECT_SORTED_DEF_ID" ENABLE                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_SUBJECT_SNP_DATASET_ID"             
before insert on DE_SUBJECT_SNP_DATASET                                         
for each row                                                                    
begin                                                                           
   if inserting then                                                            
      if :NEW.SUBJECT_SNP_DATASET_ID is null then                               
         select BIOMART.SEQ_BIO_DATA_ID.nextval into :NEW.SUBJECT_SNP_DATASET_ID
 from dual;                                                                     
      end if;                                                                   
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_SUBJECT_SNP_DATASET_ID" ENABLE                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_SNP_PROBE_SORTED_DEF_ID"            
before insert on DE_SNP_PROBE_SORTED_DEF                                        
for each row                                                                    
begin                                                                           
   if inserting then                                                            
      if :NEW.SNP_PROBE_SORTED_DEF_ID is null then                              
         select biomart.SEQ_bio_DATA_ID.nextval into :NEW.SNP_PROBE_SORTED_DEF_I
D from dual;                                                                    
      end if;                                                                   
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_SNP_PROBE_SORTED_DEF_ID" ENABLE                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_SNP_PROBE_ID"                       
BEFORE                                                                          
  INSERT ON DE_SNP_PROBE FOR EACH ROW                                           
BEGIN                                                                           
  IF inserting THEN                                                             
    IF :NEW.SNP_PROBE_ID IS NULL THEN                                           
        SELECT biomart.SEQ_BIO_DATA_ID.nextval INTO :NEW.SNP_PROBE_ID FROM dual;
                                                                                
    END IF;                                                                     
  END IF;                                                                       
END;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_SNP_PROBE_ID" ENABLE                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_SNP_INFO_ID"                        
BEFORE                                                                          
  INSERT ON DE_SNP_INFO FOR EACH ROW                                            
BEGIN                                                                           
  IF inserting THEN                                                             
    IF :NEW.SNP_INFO_ID IS NULL THEN                                            
        SELECT biomart.SEQ_BIO_DATA_ID.nextval INTO :NEW.SNP_INFO_ID FROM dual; 
    END IF;                                                                     
  END IF;                                                                       
END;                                                                            
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_SNP_INFO_ID" ENABLE                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_PATHWAY_ID"                         
before                                                                          
  insert on "DE_PATHWAY"  for each row                                          
begin                                                                           
     if inserting then                                                          
  	    if :NEW."ID" is null then                                                
  		    select SEQ_DATA_ID.nextval into :NEW."ID" from dual;                    
		end if;                                                                       
	end if;                                                                        
end;                                                                            
                                                                                
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_PATHWAY_ID" ENABLE                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_PATHWAY_GENE_ID"                    
before                                                                          
	insert on "DE_PATHWAY_GENE"  for each row                                      
begin                                                                           
	if inserting then                                                              
		if :NEW."ID" is null then                                                     
			select SEQ_DATA_ID.nextval into :NEW."ID" from dual;                         
		end if;                                                                       
	end if; end;                                                                   
                                                                                
                                                                                
ALTER TRIGGER "DEAPP"."TRG_DE_PATHWAY_GENE_ID" ENABLE                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "DEAPP"."DE_PARENT_CD_TRG"                          
BEFORE INSERT ON deapp.de_xtrial_parent_names                                   
FOR EACH ROW                                                                    
      WHEN (                                                                    
new.parent_cd is null                                                           
      ) BEGIN                                                                   
  SELECT de_parent_cd_seq.nextval                                               
  INTO :new.parent_cd                                                           
  FROM DUAL;                                                                    
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "DEAPP"."DE_PARENT_CD_TRG" ENABLE                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "DEAPP"."SEARCH_BIO_MKR_CORREL_VIEW" ("DOMAIN_OBJ
ECT_ID", "ASSO_BIO_MARKER_ID", "CORREL_TYPE", "VALUE_METRIC", "MV_ID") AS       
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
                                                                                
                                                                                
                                                                                
                                                                                
