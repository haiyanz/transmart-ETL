                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIOMARKER_GENE_UID" (                   
  GENE_ID VARCHAR2                                                              
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'GENE:' || nvl(GENE_ID, 'ERROR');                                      
END biomarker_gene_uid;                                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."TEA_NPV_PRECOMPUTE" (                   
  foldChg IN NUMBER,                                                            
  mu IN NUMBER,                                                                 
  sigma IN NUMBER                                                               
) RETURN NUMBER AS                                                              
                                                                                
 -------------------------------------------------------------------------------
                                                                                
  -- used for gene signature TEA algorithm which precomputes normalized p-values
                                                                                
  -- based on fold change ratio from analysis_data records                      
  -- JWS@20090601 - First rev.                                                  
  -- param foldChg: input is fold change ratio from from analysis_data table    
  -- param mu: mean of all analsyis_data records for a given analysis           
  -- param sigma: std dev of all analsyis_data records for a given analysis     
  ------------------------------------------------------------------------------
-                                                                               
  npv number;                                                                   
  outlier_cutoff number:=1.0e-5;                                                
                                                                                
BEGIN                                                                           
  -- normalized p-value                                                         
  npv:= 1.0 - cum_normal_dist(abs(foldChg),mu,sigma);                           
                                                                                
  -- cap outliers to minimum value                                              
  IF npv<outlier_cutoff THEN npv:= outlier_cutoff; END IF;                      
                                                                                
  RETURN npv;                                                                   
                                                                                
END TEA_NPV_PRECOMPUTE;                                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."TAB_TO_STRING" (p_varchar2_tab  IN  t_va
rchar2_tab,                                                                     
                                          p_delimiter     IN  VARCHAR2 DEFAULT '
,') RETURN VARCHAR2 IS                                                          
  l_string     VARCHAR2(32767);                                                 
BEGIN                                                                           
  FOR i IN p_varchar2_tab.FIRST .. p_varchar2_tab.LAST LOOP                     
    IF i != p_varchar2_tab.FIRST THEN                                           
      l_string := l_string || p_delimiter;                                      
    END IF;                                                                     
    l_string := l_string || p_varchar2_tab(i);                                  
  END LOOP;                                                                     
  RETURN l_string;                                                              
END tab_to_string;                                                              
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."STRING_AGG" (p_input VARCHAR2)          
RETURN VARCHAR2                                                                 
PARALLEL_ENABLE AGGREGATE USING t_string_agg;                                   
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."FRACT_ERROR_DIST"                       
( normInput IN NUMBER                                                           
) RETURN NUMBER AS                                                              
                                                                                
 -------------------------------------------------------------------------------
                                                                                
  -- implementation of fractional error distribution                            
  -- JWS@20090601 - First rev.                                                  
  ------------------------------------------------------------------------------
-                                                                               
  -- temp var                                                                   
  t1 NUMBER:= 1.0 / (1.0 + 0.5 * ABS(normInput));                               
                                                                                
  -- exponent input to next equation                                            
  exponent_input NUMBER:= -normInput*normInput - 1.26551223 +                   
                           t1*(1.00002368 + t1*(0.37409196 + t1*(0.09678418 + t1
*(-0.18628806 + t1*(0.27886807 + t1*(-1.13520398 + t1*(1.48851587 + t1*(-0.82215
223 + t1*(0.17087277)))))))));                                                  
  -- Horner's method                                                            
  ans NUMBER:= 1 - t1 * EXP(exponent_input);                                    
                                                                                
  fractError NUMBER;                                                            
                                                                                
BEGIN                                                                           
  -- handle sign                                                                
  IF normInput>0 THEN fractError:= ans; ELSE fractError:= -ans; END IF;         
  return fractError;                                                            
                                                                                
END FRACT_ERROR_DIST;                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."CUM_NORMAL_DIST" (                      
  foldChg IN NUMBER,                                                            
  mu IN NUMBER,                                                                 
  sigma IN NUMBER                                                               
) RETURN NUMBER AS                                                              
 -------------------------------------------------------------------------------
                                                                                
  -- implementation of a cumalative normal distribution                         
  -- JWS@20090601 - First rev.                                                  
  -- param foldChg: fold change ratio from from analysis_data table             
  -- param mu: mean of all analsyis_data records for a given analysis           
  -- param sigma: std dev of all analsyis_data records for a given analysis     
  ------------------------------------------------------------------------------
-                                                                               
                                                                                
  -- temporary vars                                                             
  t1 NUMBER;                                                                    
                                                                                
  -- fractional error dist input                                                
  fract_error_input NUMBER;                                                     
                                                                                
  -- return result (i.e. Prob [X<=x])                                           
  ans NUMBER;                                                                   
                                                                                
BEGIN                                                                           
  t1:= (foldChg-mu)/sigma;                                                      
  fract_error_input:= t1/SQRT(2);                                               
  ans:= 0.5 * (1.0 + fract_error_dist(fract_error_input));                      
  return ans;                                                                   
END CUM_NORMAL_DIST;                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_JUB_ONCOL_SUM_DATA_UID" (           
  RECORD_ID NUMBER,                                                             
  BIO_CURATION_NAME VARCHAR2                                                    
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'BJOS:' || nvl(TO_CHAR(RECORD_ID), 'ERROR') || ':' || nvl(BIO_CURATION_
NAME, 'ERROR');                                                                 
END BIO_JUB_ONCOL_SUM_DATA_UID;                                                 
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_JUB_ONCOL_DATA_UID" (               
  RECORD_ID NUMBER,                                                             
  BIO_CURATION_NAME VARCHAR2                                                    
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'BJOD:' || nvl(TO_CHAR(RECORD_ID), 'ERROR') || ':' || nvl(BIO_CURATION_
NAME, 'ERROR');                                                                 
END BIO_JUB_ONCOL_DATA_UID;                                                     
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_EXPERIMENT_UID" (                   
  PRIMARY_ID VARCHAR2                                                           
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'EXP:' || nvl(PRIMARY_ID, 'ERROR');                                    
END bio_experiment_uid;                                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_DISEASE_UID" (                      
  MESH_CODE VARCHAR2                                                            
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates bio_disease_uid.                                                   
                                                                                
  RETURN 'DIS:' || nvl(MESH_CODE, 'ERROR');                                     
END BIO_DISEASE_UID;                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_CURATION_DATASET_UID" (             
  BIO_CURATION_TYPE VARCHAR2                                                    
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'BCD:' || nvl(BIO_CURATION_TYPE, 'ERROR');                             
END BIO_CURATION_DATASET_UID;                                                   
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_COMPOUND_UID"                       
( CAS_REGISTRY IN VARCHAR2,                                                     
  JNJ_NUMBER IN VARCHAR2,                                                       
  CNTO_NUMBER IN VARCHAR2                                                       
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Function to create compound_uid.                                           
                                                                                
  RETURN 'COM:' || nvl(CAS_REGISTRY, nvl(JNJ_NUMBER, nvl(CNTO_NUMBER, 'ERROR')))
;                                                                               
END BIO_COMPOUND_UID;                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_ASY_ANALYSIS_PLTFM_UID" (           
  PLATFORM_NAME VARCHAR2                                                        
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'BAAP:' || nvl(PLATFORM_NAME, 'ERROR');                                
END bio_asy_analysis_pltfm_uid;                                                 
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_ASSAY_PLATFORM_UID" (               
  PLATFORM_NAME VARCHAR2                                                        
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'BAP:' || nvl(PLATFORM_NAME, 'ERROR');                                 
END bio_assay_platform_uid;                                                     
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIO_ASSAY_ANALYSIS_UID" (               
  ANALYSIS_NAME VARCHAR2                                                        
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'BAA:' || nvl(ANALYSIS_NAME, 'ERROR');                                 
END bio_assay_analysis_uid;                                                     
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FUNCTION "BIOMART"."BIOMARKER_PATHWAY_UID" (                
  P_SOURCE IN VARCHAR2 ,                                                        
  PATHWAY_ID  IN VARCHAR2                                                       
) RETURN VARCHAR2 AS                                                            
BEGIN                                                                           
  -- $Id$                                                                       
  -- Creates uid for bio_experiment.                                            
                                                                                
  RETURN 'PATHWAY:'|| P_SOURCE || ':' || nvl(PATHWAY_ID, 'ERROR');              
END biomarker_pathway_uid;                                                      
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAADT_F_IDX13" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_T
EA" ("BIO_ASSAY_FEATURE_GROUP_ID", "BIO_ASY_ANALYSIS_DATA_ID")                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."bio_marker_c_Mv_idx2" ON "BIOMART"."BIO_MARKER_CORREL_
MV" ("ASSO_BIO_MARKER_ID", "BIO_MARKER_ID")                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."bio_marker_c_Mv_idx1" ON "BIOMART"."BIO_MARKER_CORREL_
MV" ("BIO_MARKER_ID", "ASSO_BIO_MARKER_ID")                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."T_A_GE_T500_IDX" ON "BIOMART"."TMP_ANALYSIS_EQTL_TOP50
0" ("RS_ID")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."T_A_GAE_T500_IDX" ON "BIOMART"."TMP_ANALYSIS_EQTL_TOP5
00" ("BIO_ASSAY_ANALYSIS_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."TMP_A_D_TEA_R_INDEX1" ON "BIOMART"."TMP_ANALYSIS_DATA_
TEA_RANK" ("ANALYSIS_DATA_ID")                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."SYS_C0021247" ON "BIOMART"."FACETED_SEARCH" ("F
ACET_ID")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."SYS_C0021214" ON "BIOMART"."MESH_ALL" ("UI")   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."SYS_C0021213" ON "BIOMART"."MESH" ("UI")       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."SYS_C0021161" ON "BIOMART"."BIO_MARKER" ("ORGAN
ISM", "PRIMARY_EXTERNAL_ID")                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."PK_BAAD" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA"
 ("BIO_ASY_ANALYSIS_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 50331648 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."OBSERVATIONDIM_PK" ON "BIOMART"."BIO_OBSERVATIO
N" ("BIO_OBSERVATION_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."IDX_BAADT_IDX10" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA
_TEA" ("BIO_EXPERIMENT_TYPE", "BIO_ASY_ANALYSIS_DATA_ID")                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."IDX_BAADT_FG_AD" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA
_TEA" ("BIO_ASSAY_FEATURE_GROUP_ID", "BIO_ASSAY_ANALYSIS_ID")                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."B_ASY_GWAS_T50_IDX2" ON "BIOMART"."BIO_ASY_ANALYSIS_GW
AS_TOP50" ("ANALYSIS")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."B_ASY_GWAS_T50_IDX1" ON "BIOMART"."BIO_ASY_ANALYSIS_GW
AS_TOP50" ("BIO_ASSAY_ANALYSIS_ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."B_ASY_EQTL_T50_IDX2" ON "BIOMART"."BIO_ASY_ANALYSIS_EQ
TL_TOP50" ("ANALYSIS")                                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."B_ASY_EQTL_T50_IDX1" ON "BIOMART"."BIO_ASY_ANALYSIS_EQ
TL_TOP50" ("BIO_ASSAY_ANALYSIS_ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_TAXON_PK" ON "BIOMART"."BIO_TAXONOMY" ("BIO
_TAXONOMY_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_S_E_M_PK" ON "BIOMART"."BIO_STATS_EXP_MARKE
R" ("BIO_MARKER_ID", "BIO_EXPERIMENT_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_SUBJECT_PK" ON "BIOMART"."BIO_SUBJECT" ("BI
O_SUBJECT_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_STATS_EXP_MK_MK_IDX" ON "BIOMART"."BIO_STATS_EXP_M
ARKER" ("BIO_MARKER_ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_STATS_EXP_MK_EXP_IDX" ON "BIOMART"."BIO_STATS_EXP_
MARKER" ("BIO_EXPERIMENT_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_SAMPLE_PK" ON "BIOMART"."BIO_SAMPLE" ("BIO_
SAMPLE_ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_PATIENT_PK" ON "BIOMART"."BIO_PATIENT" ("BI
O_PATIENT_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_PATIENT_EVENT_PK" ON "BIOMART"."BIO_PATIENT
_EVENT" ("BIO_PATIENT_EVENT_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_PATIENT_EVENT_ATTR_PK" ON "BIOMART"."BIO_PA
TIENT_EVENT_ATTR" ("BIO_PATIENT_ATTRIBUTE_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_MKR_TYPE_IDX" ON "BIOMART"."BIO_MARKER" ("BIO_MARK
ER_TYPE")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_MKR_SRC_EXT_ID_IDX" ON "BIOMART"."BIO_MARKER" ("PR
IMARY_SOURCE_CODE", "PRIMARY_EXTERNAL_ID")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_MKR_EXT_ID" ON "BIOMART"."BIO_MARKER" ("PRIMARY_EX
TERNAL_ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_MARKER_PK" ON "BIOMART"."BIO_MARKER" ("BIO_
MARKER_ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_MARKER_EXP_AYLS_MV_INDEX1" ON "BIOMART"."BIO_MARKE
R_EXP_ANALYSIS_MV" ("BIO_MARKER_ID")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_SUM_DATA_PK" ON "BIOMART"."BIO_LIT_SUM_
DATA" ("BIO_LIT_SUM_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_REF_DATA_PK" ON "BIOMART"."BIO_LIT_REF_
DATA" ("BIO_LIT_REF_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_PE_DATA_PK" ON "BIOMART"."BIO_LIT_PE_DA
TA" ("BIO_LIT_PE_DATA_ID")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_MODEL_DATA_PK" ON "BIOMART"."BIO_LIT_MO
DEL_DATA" ("BIO_LIT_MODEL_DATA_ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_INT_DATA_PK" ON "BIOMART"."BIO_LIT_INT_
DATA" ("BIO_LIT_INT_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_INH_DATA_PK" ON "BIOMART"."BIO_LIT_INH_
DATA" ("BIO_LIT_INH_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_AMD_DATA_PK" ON "BIOMART"."BIO_LIT_AMD_
DATA" ("BIO_LIT_AMD_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_LIT_ALT_DATA_PK" ON "BIOMART"."BIO_LIT_ALT_
DATA" ("BIO_LIT_ALT_DATA_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_EXP_TYPE_IDX" ON "BIOMART"."BIO_EXPERIMENT" ("BIO_
EXPERIMENT_TYPE")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_EXP_ACEN_IDX" ON "BIOMART"."BIO_EXPERIMENT" ("ACCE
SSION")                                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_EXPERIMENT_PK" ON "BIOMART"."BIO_EXPERIMENT
" ("BIO_EXPERIMENT_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_D_O_M_MARKER2_PK" ON "BIOMART"."BIO_DATA_OM
IC_MARKER" ("BIO_MARKER_ID", "BIO_DATA_ID")                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 46137344 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_D_FG_M_MARKER2_PK" ON "BIOMART"."BIO_ASSAY_
DATA_ANNOTATION" ("BIO_MARKER_ID", "BIO_ASSAY_FEATURE_GROUP_ID")                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_D_E_C_DID_CT_IDX" ON "BIOMART"."BIO_DATA_EXT_CODE"
 ("BIO_DATA_ID", "CODE_TYPE")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_DT_DIS_DID_IDX" ON "BIOMART"."BIO_DATA_DISEASE" ("
BIO_DATA_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DISEASE_PK" ON "BIOMART"."BIO_DISEASE" ("BI
O_DISEASE_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_DD_IDX2" ON "BIOMART"."BIO_DATA_DISEASE" ("BIO_DIS
EASE_ID")                                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_UID_UK" ON "BIOMART"."BIO_DATA_UID" ("
UNIQUE_ID")                                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_UID_PK" ON "BIOMART"."BIO_DATA_UID" ("
BIO_DATA_ID")                                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 589824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_PLATFORM_PK" ON "BIOMART"."BIO_DATA_PL
ATFORM" ("BIO_DATA_ID", "BIO_ASSAY_PLATFORM_ID")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_DATA_O_M_DID_IDX" ON "BIOMART"."BIO_DATA_OMIC_MARK
ER" ("BIO_DATA_ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 24117248 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_OBSERVATION_PK" ON "BIOMART"."BIO_DATA
_OBSERVATION" ("BIO_DATA_ID", "BIO_OBSERVATION_ID")                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_LITERATURE_PK" ON "BIOMART"."BIO_DATA_
LITERATURE" ("BIO_DATA_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_DATA_E_C_T_IDX" ON "BIOMART"."BIO_DATA_EXT_CODE" (
"CODE_TYPE")                                                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_DATA_E_C_C_IDX" ON "BIOMART"."BIO_DATA_EXT_CODE" (
"CODE")                                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_EXT_CODE_PK" ON "BIOMART"."BIO_DATA_EX
T_CODE" ("BIO_DATA_EXT_CODE_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_DISEASE_PK" ON "BIOMART"."BIO_DATA_DIS
EASE" ("BIO_DATA_ID", "BIO_DISEASE_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_CORREL_DESCR_PK" ON "BIOMART"."BIO_DAT
A_CORREL_DESCR" ("BIO_DATA_CORREL_DESCR_ID")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_CORRELATION_PK" ON "BIOMART"."BIO_DATA
_CORRELATION" ("BIO_DATA_CORREL_ID")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_COMPOUND_PK" ON "BIOMART"."BIO_DATA_CO
MPOUND" ("BIO_DATA_ID", "BIO_COMPOUND_ID")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_DATA_ATTRIBUTE_PK" ON "BIOMART"."BIO_DATA_A
TTRIBUTE" ("BIO_DATA_ATTRIBUTE_ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CURATION_DATASET_PK" ON "BIOMART"."BIO_CURA
TION_DATASET" ("BIO_CURATION_DATASET_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CURATED_DATA_PK" ON "BIOMART"."BIO_CURATED_
DATA" ("BIO_DATA_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CONTENT_REPOSITORY_PK" ON "BIOMART"."BIO_CO
NTENT_REPOSITORY" ("BIO_CONTENT_REPO_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CONTENT_REFERENCE_PK" ON "BIOMART"."BIO_CON
TENT_REFERENCE" ("BIO_CONTENT_REFERENCE_ID")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CONTENT_PK" ON "BIOMART"."BIO_CONTENT" ("BI
O_FILE_CONTENT_ID")                                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CONCEPT_CODE_UK" ON "BIOMART"."BIO_CONCEPT_
CODE" ("BIO_CONCEPT_CODE", "CODE_TYPE_NAME")                                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_CONCEPT_CODE_TYPE_INDEX" ON "BIOMART"."BIO_CONCEPT
_CODE" ("CODE_TYPE_NAME")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CONCEPT_CODE_PK" ON "BIOMART"."BIO_CONCEPT_
CODE" ("BIO_CONCEPT_CODE_ID")                                                   
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_COMPOUND_PK" ON "BIOMART"."BIO_COMPOUND" ("
BIO_COMPOUND_ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CLINICAL_TRIAL_PK" ON "BIOMART"."BIO_CLINIC
AL_TRIAL" ("BIO_EXPERIMENT_ID")                                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CLINC_TRIAL_TIME_PT_PK" ON "BIOMART"."BIO_C
LINC_TRIAL_TIME_PT" ("BIO_CLINC_TRIAL_TM_PT_ID")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CLINC_TRIAL_PT_GROUP_PK" ON "BIOMART"."BIO_
CLINC_TRIAL_PT_GROUP" ("BIO_CLINICAL_TRIAL_P_GROUP_ID")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CLINC_TRIAL_ATTR_PK" ON "BIOMART"."BIO_CLIN
C_TRIAL_ATTR" ("BIO_CLINC_TRIAL_ATTR_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CGDCP_DATA_PK" ON "BIOMART"."BIO_CGDCP_DATA
" ("BIO_DATA_ID")                                                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_CELL_LINE_NAME_IDX" ON "BIOMART"."BIO_CELL_LINE" (
"CELL_LINE_NAME", "BIO_CELL_LINE_ID")                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_CELL_LINE_DICT_PK" ON "BIOMART"."BIO_CELL_L
INE" ("BIO_CELL_LINE_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A__D_S_F_G_IDX" ON "BIOMART"."BIO_ASY_DATA_STATS_A
LL" ("FEATURE_GROUP_NAME")                                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A__D_S_EXP_IDX" ON "BIOMART"."BIO_ASY_DATA_STATS_A
LL" ("BIO_EXPERIMENT_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A__D_S_DS_IDX" ON "BIOMART"."BIO_ASY_DATA_STATS_AL
L" ("BIO_ASSAY_DATASET_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A_O_FG_ID_IDX" ON "BIOMART"."BIO_ASSAY_DATA_ANNOTA
TION" ("BIO_ASSAY_FEATURE_GROUP_ID")                                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 5242880 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A_D_S_F_G_S_IDX" ON "BIOMART"."BIO_ASSAY_DATA_STAT
S" ("FEATURE_GROUP_NAME", "BIO_ASSAY_DATA_STATS_ID")                            
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A_D_S_FGI_S_IDX" ON "BIOMART"."BIO_ASSAY_DATA_STAT
S" ("BIO_ASSAY_FEATURE_GROUP_ID", "BIO_ASSAY_DATA_STATS_ID")                    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A_D_S_EXP__S_IDX" ON "BIOMART"."BIO_ASSAY_DATA_STA
TS" ("BIO_EXPERIMENT_ID")                                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_A_D_S_DS__S_IDX" ON "BIOMART"."BIO_ASSAY_DATA_STAT
S" ("BIO_ASSAY_DATASET_ID")                                                     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_ASY_GWAS_RS2_IDX" ON "BIOMART"."BIO_ASSAY_ANALYSIS
_GWAS" ("BIO_ASSAY_ANALYSIS_ID", "RS_ID")                                       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASY_FEATURE_GRP_PK" ON "BIOMART"."BIO_ASSAY
_FEATURE_GROUP" ("BIO_ASSAY_FEATURE_GROUP_ID")                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 17825792 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_ASY_FEATURE_GRP_NAME_IDX" ON "BIOMART"."BIO_ASSAY_
FEATURE_GROUP" ("FEATURE_GROUP_NAME", "BIO_ASSAY_FEATURE_GROUP_ID")             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS COMPRESS 1    
  STORAGE(INITIAL 37748736 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASY_DT_STATS_S_PK" ON "BIOMART"."BIO_ASSAY_
DATA_STATS" ("BIO_ASSAY_DATA_STATS_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASY_DT_STATS_PK" ON "BIOMART"."BIO_ASY_DATA
_STATS_ALL" ("BIO_ASSAY_DATA_STATS_ID")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASY_ANALYSIS_PLTFM_PK" ON "BIOMART"."BIO_AS
Y_ANALYSIS_PLTFM" ("BIO_ASY_ANALYSIS_PLTFM_ID")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASY_ANALYSIS_DATASET_PK" ON "BIOMART"."BIO_
ASY_ANALYSIS_DATASET" ("BIO_ASSAY_DATASET_ID", "BIO_ASSAY_ANALYSIS_ID")         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_SAMPLE_PK" ON "BIOMART"."BIO_ASSAY_SA
MPLE" ("BIO_ASSAY_ID", "BIO_SAMPLE_ID", "BIO_CLINIC_TRIAL_TIMEPOINT_ID")        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_PLATFORM_PK" ON "BIOMART"."BIO_ASSAY_
PLATFORM" ("BIO_ASSAY_PLATFORM_ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_PK" ON "BIOMART"."BIO_ASSAY" ("BIO_AS
SAY_ID")                                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_DATA_PK" ON "BIOMART"."BIO_ASSAY_DATA
" ("BIO_ASSAY_DATA_ID")                                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_DATASET_PK" ON "BIOMART"."BIO_ASSAY_D
ATASET" ("BIO_ASSAY_DATASET_ID")                                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_PK" ON "BIOMART"."BIO_ASSAY_
ANALYSIS" ("BIO_ASSAY_ANALYSIS_ID")                                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_GWAS_PK" ON "BIOMART"."BIO_A
SSAY_ANALYSIS_GWAS" ("BIO_ASY_ANALYSIS_GWAS_ID")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_GWAS_IDX2" ON "BIOMART"."BIO_ASSAY_
ANALYSIS_GWAS" ("RS_ID")                                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_GWAS_IDX1" ON "BIOMART"."BIO_ASSAY_
ANALYSIS_GWAS" ("BIO_ASSAY_ANALYSIS_ID")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_EXT_IDX1" ON "BIOMART"."BIO_ASSAY_A
NALYSIS_EXT" ("BIO_ASSAY_ANALYSIS_ID")                                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_EQTL_PK" ON "BIOMART"."BIO_A
SSAY_ANALYSIS_EQTL" ("BIO_ASY_ANALYSIS_EQTL_ID")                                
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BIO_ASSAY_ANALYSIS_EQTL_IDX1" ON "BIOMART"."BIO_ASSAY_
ANALYSIS_EQTL" ("BIO_ASSAY_ANALYSIS_ID")                                        
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_AD_HOC_PROPERTY_PK" ON "BIOMART"."BIO_AD_HO
C_PROPERTY" ("AD_HOC_PROPERTY_ID")                                              
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAADT_IDEX12" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_TE
A" ("FEATURE_GROUP_NAME", "BIO_ASY_ANALYSIS_DATA_ID")                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAADT_IDX11" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_TEA
" ("BIO_EXPERIMENT_ID", "BIO_ASSAY_ANALYSIS_ID", "BIO_ASY_ANALYSIS_DATA_ID")    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAADT_IDX17" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_TEA
" ("BIO_ASSAY_ANALYSIS_ID", "TEA_RANK")                                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 1900544 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAADT_IDX6" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_TEA"
 ("BIO_EXPERIMENT_ID", "BIO_ASSAY_ANALYSIS_ID")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAADT_IDX7" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_TEA"
 ("BIO_ASSAY_ANALYSIS_ID", "BIO_ASY_ANALYSIS_DATA_ID")                          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_FGN_IDX" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" (
"FEATURE_GROUP_NAME")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 60817408 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_IDX11" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("B
IO_EXPERIMENT_ID", "BIO_ASSAY_ANALYSIS_ID", "BIO_ASY_ANALYSIS_DATA_ID")         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 100663296 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_IDX12" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("B
IO_EXPERIMENT_ID", "BIO_ASSAY_ANALYSIS_ID", "BIO_ASSAY_FEATURE_GROUP_ID")       
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 92274688 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_IDX14" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("B
IO_ASSAY_FEATURE_GROUP_ID", "BIO_ASY_ANALYSIS_DATA_ID")                         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 67108864 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_IDX4" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("BI
O_ASSAY_PLATFORM_ID")                                                           
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 52428800 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_IDX6" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("BI
O_EXPERIMENT_ID", "BIO_ASSAY_ANALYSIS_ID")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 75497472 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAAD_IDX7" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("BI
O_ASSAY_ANALYSIS_ID", "BIO_ASY_ANALYSIS_DATA_ID")                               
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 83886080 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BAD_IDX13" ON "BIOMART"."BIO_ASSAY_ANALYSIS_DATA" ("BI
O_ASSAY_ANALYSIS_ID", "BIO_ASSAY_FEATURE_GROUP_ID")                             
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 67108864 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 8                                                                    
                                                                                
                                                                                
                                                                                
  CREATE INDEX "BIOMART"."BDC_INDEX1" ON "BIOMART"."BIO_DATA_CORRELATION" ("ASSO
_BIO_DATA_ID")                                                                  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
                                                                                
                                                                                
                                                                                
  CREATE UNIQUE INDEX "BIOMART"."BIO_AA_DATA_T_PK" ON "BIOMART"."BIO_ASSAY_ANALY
SIS_DATA_TEA" ("BIO_ASY_ANALYSIS_DATA_ID")                                      
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"                                                             
  PARALLEL 3                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "BIOMART"."UTIL_GRANT_ALL"                        
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
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "BIOMART"."BIO_ASSAY_DATA_STATS_SEQ"  MINVALUE 1 MAXVALUE 99
99999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "BIOMART"."T1"  MINVALUE 1 MAXVALUE 999999999999999999999999
9999 INCREMENT BY 1 START WITH 681 CACHE 20 NOORDER  NOCYCLE                    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "BIOMART"."SEQ_CLINICAL_TRIAL_DESIGN_ID"  MINVALUE 1 MAXVALU
E 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOC
YCLE                                                                            
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "BIOMART"."SEQ_BIO_DATA_ID"  MINVALUE 1 MAXVALUE 99999999999
99999999999999999 INCREMENT BY 1 START WITH 474774370 CACHE 20 NOORDER  NOCYCLE 
                                                                                
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "BIOMART"."SEQ_BIO_DATA_FACT_ID"  MINVALUE 1 MAXVALUE 999999
9999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE    
                                                                                
                                                                                
                                                                                
   CREATE SEQUENCE  "BIOMART"."HIBERNATE_SEQUENCE"  MINVALUE 1 MAXVALUE 99999999
99999999999999999999 INCREMENT BY 1 START WITH 307 CACHE 20 NOORDER  NOCYCLE    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_AD_HOC_PROPERTY"                                  
   (	"AD_HOC_PROPERTY_ID" NUMBER(22,0) NOT NULL ENABLE,                         
	"BIO_DATA_ID" NUMBER(22,0) NOT NULL ENABLE,                                    
	"PROPERTY_KEY" NVARCHAR2(50),                                                  
	"PROPERTY_VALUE" NVARCHAR2(2000)                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."TMP_ANALYSIS_GWAS_TOP500"                             
   (	"BIO_ASY_ANALYSIS_GWAS_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"P_VALUE" BINARY_DOUBLE,                                                       
	"LOG_P_VALUE" BINARY_DOUBLE,                                                   
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000),                                                     
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"RNUM" NUMBER                                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."TMP_ANALYSIS_EQTL_TOP500"                             
   (	"BIO_ASY_ANALYSIS_EQTL_ID" NUMBER(22,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(22,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"P_VALUE" BINARY_DOUBLE,                                                       
	"LOG_P_VALUE" BINARY_DOUBLE,                                                   
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000),                                                     
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"GENE" VARCHAR2(50),                                                           
	"CIS_TRANS" VARCHAR2(10),                                                      
	"DISTANCE_FROM_GENE" VARCHAR2(10),                                             
	"RNUM" NUMBER                                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."TMP_ANALYSIS_DATA_TEA_RANK"                           
   (	"ANALYSIS_DATA_ID" NUMBER NOT NULL ENABLE,                                 
	"ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                                    
	"RANK1" NUMBER                                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."TMP_ANALYSIS_COUNT_EQTL"                              
   (	"TOTAL" NUMBER,                                                            
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(22,0) NOT NULL ENABLE                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."TMP_ANALYSIS_COUNT"                                   
   (	"TOTAL" NUMBER,                                                            
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."MESH_ENTRY_ALL"                                       
   (	"MH" VARCHAR2(200),                                                        
	"ENTRY" VARCHAR2(200)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."MESH_ENTRY"                                           
   (	"MH" VARCHAR2(200),                                                        
	"ENTRY" VARCHAR2(200)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."MESH_ALL"                                             
   (	"UI" VARCHAR2(20),                                                         
	"MH" VARCHAR2(200),                                                            
	 PRIMARY KEY ("UI")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."MESH"                                                 
   (	"UI" VARCHAR2(20),                                                         
	"MH" VARCHAR2(200),                                                            
	 PRIMARY KEY ("UI")                                                            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."FACETED_SEARCH"                                       
   (	"ANALYSIS_ID" NUMBER(18,0),                                                
	"STUDY" NUMBER(18,0),                                                          
	"STUDY_ID" NUMBER(18,0),                                                       
	"DISEASE" NVARCHAR2(510),                                                      
	"ANALYSES" NVARCHAR2(200),                                                     
	"DATA_TYPE" VARCHAR2(50),                                                      
	"PLATFORM" VARCHAR2(20),                                                       
	"OBSERVATION" NVARCHAR2(200),                                                  
	"FACET_ID" NUMBER(10,0),                                                       
	 PRIMARY KEY ("FACET_ID")                                                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_STUDY"                                            
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"REF_ARTICLE_PROTOCOL_ID" VARCHAR2(4000),                                      
	"REF_ARTICLE_PMID" VARCHAR2(4000),                                             
	"REF_PROTOCOL_ID" VARCHAR2(4000)                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_SEC_ENDPTS"                                       
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"SECONDARY_TYPE" VARCHAR2(4000),                                               
	"SECONDARY_TYPE_DEFINITION" VARCHAR2(4000),                                    
	"SECONDARY_TYPE_TIME_PERIOD" VARCHAR2(4000),                                   
	"SECONDARY_TYPE_CHANGE" VARCHAR2(4000),                                        
	"SECONDARY_TYPE_P_VALUE" VARCHAR2(4000),                                       
	"ID" NUMBER(18,0)                                                              
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_PRIMARY_ENDPTS"                                   
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"PRIMARY_TYPE" VARCHAR2(4000),                                                 
	"PRIMARY_TYPE_DEFINITION" VARCHAR2(4000),                                      
	"PRIMARY_TYPE_TIME_PERIOD" VARCHAR2(4000),                                     
	"PRIMARY_TYPE_CHANGE" VARCHAR2(4000),                                          
	"PRIMARY_TYPE_P_VALUE" VARCHAR2(4000),                                         
	"ID" NUMBER(18,0)                                                              
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_INCLUSION_CRITERIA"                               
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"INHALED_STEROID_DOSE" VARCHAR2(4000),                                         
	"LABA" VARCHAR2(4000),                                                         
	"OCS" VARCHAR2(4000),                                                          
	"XOLAIR" VARCHAR2(4000),                                                       
	"LTRA_INHIBITORS" VARCHAR2(4000),                                              
	"ASTHMA_PHENOTYPE" VARCHAR2(4000),                                             
	"FEV1" VARCHAR2(4000)                                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_FULL"                                             
   (	"CLINICAL_TRIAL_DESIGN_ID" NUMBER,                                         
	"REF_ARTICLE_PROTOCOL_ID" VARCHAR2(4000),                                      
	"REF_RECORD_ID" VARCHAR2(4000),                                                
	"REF_BACK_REFERENCE" VARCHAR2(4000),                                           
	"REF_ARTICLE_PMID" VARCHAR2(4000),                                             
	"REF_PROTOCOL_ID" VARCHAR2(4000),                                              
	"REF_TITLE" VARCHAR2(4000),                                                    
	"STUDY_TYPE" VARCHAR2(4000),                                                   
	"COMMON_NAME" VARCHAR2(4000),                                                  
	"ICD10" VARCHAR2(4000),                                                        
	"MESH" VARCHAR2(4000),                                                         
	"DISEASE_TYPE" VARCHAR2(4000),                                                 
	"PHYSIOLOGY_NAME" VARCHAR2(4000),                                              
	"TRIAL_STATUS" VARCHAR2(4000),                                                 
	"TRIAL_PHASE" VARCHAR2(4000),                                                  
	"NATURE_OF_TRIAL" VARCHAR2(4000),                                              
	"RANDOMIZATION" VARCHAR2(4000),                                                
	"BLINDED_TRIAL" VARCHAR2(4000),                                                
	"TRIAL_TYPE" VARCHAR2(4000),                                                   
	"RUN_IN_PERIOD" VARCHAR2(4000),                                                
	"TREATMENT_PERIOD" VARCHAR2(4000),                                             
	"WASHOUT_PERIOD" VARCHAR2(4000),                                               
	"OPEN_LABEL_EXTENSION" VARCHAR2(4000),                                         
	"SPONSOR" VARCHAR2(4000),                                                      
	"TRIAL_NBR_OF_PATIENTS_STUDIED" VARCHAR2(4000),                                
	"SOURCE_TYPE" VARCHAR2(4000),                                                  
	"TRIAL_AGE" VARCHAR2(4000),                                                    
	"DISEASE_SEVERITY" VARCHAR2(4000),                                             
	"DIFFICULT_TO_TREAT" VARCHAR2(4000),                                           
	"ASTHMA_DIAGNOSIS" VARCHAR2(4000),                                             
	"INHALED_STEROID_DOSE" VARCHAR2(4000),                                         
	"LABA" VARCHAR2(4000),                                                         
	"OCS" VARCHAR2(4000),                                                          
	"XOLAIR" VARCHAR2(4000),                                                       
	"LTRA_INHIBITORS" VARCHAR2(4000),                                              
	"ASTHMA_PHENOTYPE" VARCHAR2(4000),                                             
	"FEV1" VARCHAR2(4000),                                                         
	"FEV1_REVERSIBILITY" VARCHAR2(4000),                                           
	"TLC" VARCHAR2(4000),                                                          
	"FEV1_FVC" VARCHAR2(4000),                                                     
	"FVC" VARCHAR2(4000),                                                          
	"DLCO" VARCHAR2(4000),                                                         
	"SGRQ" VARCHAR2(4000),                                                         
	"HRCT" VARCHAR2(4000),                                                         
	"BIOPSY" VARCHAR2(4000),                                                       
	"DYSPNEA_ON_EXERTION" VARCHAR2(4000),                                          
	"CONCOMITANT_MED" VARCHAR2(4000),                                              
	"TRIAL_SMOKERS_PCT" VARCHAR2(4000),                                            
	"TRIAL_FORMER_SMOKERS_PCT" VARCHAR2(4000),                                     
	"TRIAL_NEVER_SMOKERS_PCT" VARCHAR2(4000),                                      
	"TRIAL_PACK_YEARS" VARCHAR2(4000),                                             
	"EXCLUSION_CRITERIA" CLOB,                                                     
	"MINIMAL_SYMPTOMS" VARCHAR2(4000),                                             
	"RESCUE_MEDICATION_USE" VARCHAR2(4000),                                        
	"CONTROL_DETAILS" VARCHAR2(4000),                                              
	"BLINDING_PROCEDURE" VARCHAR2(4000),                                           
	"NUMBER_OF_ARMS" VARCHAR2(4000),                                               
	"DESCRIPTION" CLOB,                                                            
	"ARM" VARCHAR2(4000),                                                          
	"ARM_NBR_OF_PATIENTS_STUDIED" VARCHAR2(4000),                                  
	"ARM_CLASSIFICATION_TYPE" VARCHAR2(4000),                                      
	"ARM_CLASSIFICATION_VALUE" VARCHAR2(4000),                                     
	"ARM_ASTHMA_DURATION" VARCHAR2(4000),                                          
	"ARM_GEOGRAPHIC_REGION" VARCHAR2(4000),                                        
	"ARM_AGE" VARCHAR2(4000),                                                      
	"ARM_GENDER" VARCHAR2(4000),                                                   
	"ARM_SMOKERS_PCT" VARCHAR2(4000),                                              
	"ARM_FORMER_SMOKERS_PCT" VARCHAR2(4000),                                       
	"ARM_NEVER_SMOKERS_PCT" VARCHAR2(4000),                                        
	"ARM_PACK_YEARS" VARCHAR2(4000),                                               
	"MINORITY_PARTICIPATION" VARCHAR2(4000),                                       
	"BASELINE_SYMPTOM_SCORE" VARCHAR2(4000),                                       
	"BASELINE_RESCUE_MEDICATION_USE" VARCHAR2(4000),                               
	"CLINICAL_VARIABLE" VARCHAR2(4000),                                            
	"CLINICAL_VARIABLE_PCT" VARCHAR2(4000),                                        
	"CLINICAL_VARIABLE_VALUE" VARCHAR2(4000),                                      
	"PRIOR_MED_DRUG_NAME" VARCHAR2(4000),                                          
	"PRIOR_MED_PCT" VARCHAR2(4000),                                                
	"PRIOR_MED_VALUE" VARCHAR2(4000),                                              
	"BIOMARKER_NAME" VARCHAR2(4000),                                               
	"BIOMARKER_PCT" VARCHAR2(4000),                                                
	"BIOMARKER_VALUE" VARCHAR2(4000),                                              
	"CELLINFO_TYPE" VARCHAR2(4000),                                                
	"CELLINFO_COUNT" VARCHAR2(4000),                                               
	"CELLINFO_SOURCE" VARCHAR2(4000),                                              
	"PULMONARY_PATHOLOGY_NAME" VARCHAR2(4000),                                     
	"PULMPATH_PATIENT_PCT" VARCHAR2(4000),                                         
	"PULMPATH_VALUE_UNIT" VARCHAR2(4000),                                          
	"PULMPATH_METHOD" VARCHAR2(4000),                                              
	"RUNIN_OCS" VARCHAR2(4000),                                                    
	"RUNIN_ICS" VARCHAR2(4000),                                                    
	"RUNIN_LABA" VARCHAR2(4000),                                                   
	"RUNIN_LTRA" VARCHAR2(4000),                                                   
	"RUNIN_CORTICOSTEROIDS" VARCHAR2(4000),                                        
	"RUNIN_ANTI_FIBROTICS" VARCHAR2(4000),                                         
	"RUNIN_IMMUNOSUPPRESSIVE" VARCHAR2(4000),                                      
	"RUNIN_CYTOTOXIC" VARCHAR2(4000),                                              
	"RUNIN_DESCRIPTION" VARCHAR2(4000),                                            
	"TRTMT_OCS" VARCHAR2(4000),                                                    
	"TRTMT_ICS" VARCHAR2(4000),                                                    
	"TRTMT_LABA" VARCHAR2(4000),                                                   
	"TRTMT_LTRA" VARCHAR2(4000),                                                   
	"TRTMT_CORTICOSTEROIDS" VARCHAR2(4000),                                        
	"TRTMT_ANTI_FIBROTICS" VARCHAR2(4000),                                         
	"TRTMT_IMMUNOSUPPRESSIVE" VARCHAR2(4000),                                      
	"TRTMT_CYTOTOXIC" VARCHAR2(4000),                                              
	"TRTMT_DESCRIPTION" VARCHAR2(4000),                                            
	"DRUG_INHIBITOR_COMMON_NAME" VARCHAR2(4000),                                   
	"DRUG_INHIBITOR_STANDARD_NAME" VARCHAR2(4000),                                 
	"DRUG_INHIBITOR_CAS_ID" VARCHAR2(4000),                                        
	"DRUG_INHIBITOR_DOSE" VARCHAR2(4000),                                          
	"DRUG_INHIBITOR_ROUTE_OF_ADMIN" VARCHAR2(4000),                                
	"DRUG_INHIBITOR_TRTMT_REGIME" VARCHAR2(4000),                                  
	"COMPARATOR_NAME" VARCHAR2(4000),                                              
	"COMPARATOR_DOSE" VARCHAR2(4000),                                              
	"COMPARATOR_TIME_PERIOD" VARCHAR2(4000),                                       
	"COMPARATOR_ROUTE_OF_ADMIN" VARCHAR2(4000),                                    
	"TREATMENT_REGIME" VARCHAR2(4000),                                             
	"PLACEBO" VARCHAR2(4000),                                                      
	"EXPERIMENT_DESCRIPTION" VARCHAR2(4000),                                       
	"PRIMARY_ENDPOINT_TYPE" VARCHAR2(4000),                                        
	"PRIMARY_ENDPOINT_DEFINITION" VARCHAR2(4000),                                  
	"PRIMARY_ENDPOINT_CHANGE" VARCHAR2(4000),                                      
	"PRIMARY_ENDPOINT_TIME_PERIOD" VARCHAR2(4000),                                 
	"PRIMARY_ENDPOINT_STAT_TEST" VARCHAR2(4000),                                   
	"PRIMARY_ENDPOINT_P_VALUE" VARCHAR2(4000),                                     
	"SECONDARY_TYPE" VARCHAR2(4000),                                               
	"SECONDARY_TYPE_DEFINITION" VARCHAR2(4000),                                    
	"SECONDARY_TYPE_CHANGE" VARCHAR2(4000),                                        
	"SECONDARY_TYPE_TIME_PERIOD" VARCHAR2(4000),                                   
	"SECONDARY_TYPE_P_VALUE" VARCHAR2(4000),                                       
	"SECONDARY_TYPE_STAT_TEST" VARCHAR2(4000),                                     
	"CLINICAL_VARIABLE_NAME" VARCHAR2(4000),                                       
	"PCT_CHANGE_FROM_BASELINE" VARCHAR2(4000),                                     
	"ABS_CHANGE_FROM_BASELINE" VARCHAR2(4000),                                     
	"RATE_OF_CHANGE_FROM_BASELINE" VARCHAR2(4000),                                 
	"AVERAGE_OVER_TREATMENT_PERIOD" VARCHAR2(4000),                                
	"WITHIN_GROUP_CHANGES" VARCHAR2(4000),                                         
	"STAT_MEASURE_P_VALUE" VARCHAR2(4000),                                         
	"DEFINITION_OF_THE_EVENT" VARCHAR2(4000),                                      
	"NUMBER_OF_EVENTS" VARCHAR2(4000),                                             
	"EVENT_RATE" VARCHAR2(4000),                                                   
	"TIME_TO_EVENT" VARCHAR2(4000),                                                
	"EVENT_PCT_REDUCTION" VARCHAR2(4000),                                          
	"EVENT_P_VALUE" VARCHAR2(4000),                                                
	"EVENT_DESCRIPTION" VARCHAR2(4000),                                            
	"DISCONTINUATION_RATE" VARCHAR2(4000),                                         
	"RESPONSE_RATE" VARCHAR2(4000),                                                
	"DOWNSTREAM_SIGNALING_EFFECTS" VARCHAR2(4000),                                 
	"BENEFICIAL_EFFECTS" VARCHAR2(4000),                                           
	"ADVERSE_EFFECTS" VARCHAR2(4000),                                              
	"PK_PD_PARAMETER" VARCHAR2(4000),                                              
	"PK_PD_VALUE" VARCHAR2(4000),                                                  
	"EFFECT_DESCRIPTION" VARCHAR2(4000),                                           
	"BIOMOLECULE_NAME" VARCHAR2(4000),                                             
	"BIOMOLECULE_ID" VARCHAR2(4000),                                               
	"BIOMOLECULE_TYPE" VARCHAR2(4000),                                             
	"BIOMARKER" VARCHAR2(4000),                                                    
	"BIOMARKER_TYPE" VARCHAR2(4000),                                               
	"BASELINE_EXPR_PCT" VARCHAR2(4000),                                            
	"BASELINE_EXPR_NUMBER" VARCHAR2(4000),                                         
	"BASELINE_EXPR_VALUE_FOLD_MEAN" VARCHAR2(4000),                                
	"BASELINE_EXPR_SD" VARCHAR2(4000),                                             
	"BASELINE_EXPR_SEM" VARCHAR2(4000),                                            
	"BASELINE_EXPR_UNIT" VARCHAR2(4000),                                           
	"EXPR_AFTER_TRTMT_PCT" VARCHAR2(4000),                                         
	"EXPR_AFTER_TRTMT_NUMBER" VARCHAR2(4000),                                      
	"EXPR_AFTERTRTMT_VALUEFOLD_MEAN" VARCHAR2(4000),                               
	"EXPR_AFTER_TRTMT_SD" VARCHAR2(4000),                                          
	"EXPR_AFTER_TRTMT_SEM" VARCHAR2(4000),                                         
	"EXPR_AFTER_TRTMT_UNIT" VARCHAR2(4000),                                        
	"EXPR_CHG_SOURCE_TYPE" VARCHAR2(4000),                                         
	"EXPR_CHG_TECHNIQUE" VARCHAR2(4000),                                           
	"EXPR_CHG_DESCRIPTION" VARCHAR2(4000),                                         
	"CLINICAL_CORRELATION" VARCHAR2(4000),                                         
	"STATISTICAL_TEST" VARCHAR2(4000),                                             
	"STATISTICAL_COEFFICIENT_VALUE" VARCHAR2(4000),                                
	"STATISTICAL_TEST_P_VALUE" VARCHAR2(4000),                                     
	"STATISTICAL_TEST_DESCRIPTION" VARCHAR2(4000),                                 
	"DRUG_INHIBITOR_TIME_PERIOD" VARCHAR2(4000)                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("EXCLUSION_CRITERIA") STORE AS BASICFILE (                                
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("DESCRIPTION") STORE AS BASICFILE (                                       
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_DRUG_INHIB"                                       
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"DRUG_INHIBITOR_COMMON_NAME" VARCHAR2(4000),                                   
	"DRUG_INHIBITOR_STANDARD_NAME" VARCHAR2(4000),                                 
	"DRUG_INHIBITOR_CAS_ID" VARCHAR2(4000)                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_DISEASE"                                          
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"COMMON_NAME" VARCHAR2(4000),                                                  
	"ICD10" VARCHAR2(4000),                                                        
	"MESH" VARCHAR2(4000),                                                         
	"DISEASE_SEVERITY" VARCHAR2(4000)                                              
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_BIOMARKER"                                        
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"BIOMARKER_NAME" VARCHAR2(4000),                                               
	"BIOMARKER_PCT" VARCHAR2(4000),                                                
	"BIOMARKER_VALUE" VARCHAR2(4000)                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ANALYSIS_ATTRIBUTE"                               
   (	"STUDY_ID" VARCHAR2(255),                                                  
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"TERM_ID" NUMBER(22,0),                                                        
	"SOURCE_CD" VARCHAR2(255),                                                     
	"BIO_ANALYSIS_ATTRIBUTE_ID" NUMBER NOT NULL ENABLE                             
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE"                       
   (	"BIO_ANALYSIS_ATT_LINEAGE_ID" NUMBER NOT NULL ENABLE,                      
	"BIO_ANALYSIS_ATTRIBUTE_ID" NUMBER NOT NULL ENABLE,                            
	"ANCESTOR_TERM_ID" NUMBER NOT NULL ENABLE,                                     
	"ANCESTOR_SEARCH_KEYWORD_ID" NUMBER NOT NULL ENABLE,                           
	 CONSTRAINT "FK_BAAL_SEARCH_KEYWORD" FOREIGN KEY ("ANCESTOR_SEARCH_KEYWORD_ID")
                                                                                
	  REFERENCES "SEARCHAPP"."SEARCH_KEYWORD" ("SEARCH_KEYWORD_ID") ENABLE         
   ) SEGMENT CREATION DEFERRED                                                  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY"                                            
   (	"BIO_ASSAY_ID" NUMBER(18,0) NOT NULL ENABLE,                               
	"ETL_ID" NVARCHAR2(100) NOT NULL ENABLE,                                       
	"STUDY" NVARCHAR2(200),                                                        
	"PROTOCOL" NVARCHAR2(200),                                                     
	"DESCRIPTION" NCLOB,                                                           
	"SAMPLE_TYPE" NVARCHAR2(200),                                                  
	"EXPERIMENT_ID" NUMBER(18,0) NOT NULL ENABLE,                                  
	"TEST_DATE" DATE,                                                              
	"SAMPLE_RECEIVE_DATE" DATE,                                                    
	"REQUESTOR" NVARCHAR2(200),                                                    
	"BIO_ASSAY_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                               
	"BIO_ASSAY_PLATFORM_ID" NUMBER(18,0),                                          
	 CONSTRAINT "RBMORDERDIM_PK" PRIMARY KEY ("BIO_ASSAY_ID")                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "DATASET_EXPERIMENT_FK" FOREIGN KEY ("EXPERIMENT_ID")              
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") ENABLE,          
	 CONSTRAINT "BIO_ASY_ASY_PFM_FK" FOREIGN KEY ("BIO_ASSAY_PLATFORM_ID")         
	  REFERENCES "BIOMART"."BIO_ASSAY_PLATFORM" ("BIO_ASSAY_PLATFORM_ID") ENABLE   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("DESCRIPTION") STORE AS BASICFILE (                                       
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_ANALYSIS"                                   
   (	"ANALYSIS_NAME" NVARCHAR2(500),                                            
	"SHORT_DESCRIPTION" NVARCHAR2(1000),                                           
	"ANALYSIS_CREATE_DATE" DATE,                                                   
	"ANALYST_ID" NVARCHAR2(510),                                                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0),                                          
	"ANALYSIS_VERSION" NVARCHAR2(200),                                             
	"FOLD_CHANGE_CUTOFF" NUMBER(9,2),                                              
	"PVALUE_CUTOFF" NUMBER(9,2),                                                   
	"RVALUE_CUTOFF" NUMBER(9,2),                                                   
	"BIO_ASY_ANALYSIS_PLTFM_ID" NUMBER(18,0),                                      
	"BIO_SOURCE_IMPORT_ID" NUMBER(18,0),                                           
	"ANALYSIS_TYPE" NVARCHAR2(200),                                                
	"ANALYST_NAME" VARCHAR2(250),                                                  
	"ANALYSIS_METHOD_CD" VARCHAR2(50),                                             
	"BIO_ASSAY_DATA_TYPE" VARCHAR2(50),                                            
	"ETL_ID" VARCHAR2(100),                                                        
	"LONG_DESCRIPTION" VARCHAR2(4000),                                             
	"QA_CRITERIA" VARCHAR2(4000),                                                  
	"DATA_COUNT" NUMBER(18,0),                                                     
	"TEA_DATA_COUNT" NUMBER(18,0),                                                 
	"ETL_ID_SOURCE" NUMBER(18,0),                                                  
	 CONSTRAINT "BIO_DATA_ANL_PK" PRIMARY KEY ("BIO_ASSAY_ANALYSIS_ID")            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_ASSAY_ANS_PLTFM_FK" FOREIGN KEY ("BIO_ASY_ANALYSIS_PLTFM_ID") 
	  REFERENCES "BIOMART"."BIO_ASY_ANALYSIS_PLTFM" ("BIO_ASY_ANALYSIS_PLTFM_ID") E
NABLE                                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS BASIC NOLOGGING         
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA"                              
   (	"BIO_ASY_ANALYSIS_DATA_ID" NUMBER NOT NULL ENABLE,                         
	"FOLD_CHANGE_RATIO" NUMBER,                                                    
	"RAW_PVALUE" NUMBER(18,5),                                                     
	"ADJUSTED_PVALUE" NUMBER(18,5),                                                
	"R_VALUE" NUMBER(18,5),                                                        
	"RHO_VALUE" NUMBER(18,5),                                                      
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"ADJUSTED_P_VALUE_CODE" NVARCHAR2(100),                                        
	"FEATURE_GROUP_NAME" VARCHAR2(100) NOT NULL ENABLE,                            
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_ASSAY_PLATFORM_ID" NUMBER(18,0),                                          
	"ETL_ID" NVARCHAR2(100),                                                       
	"PREFERRED_PVALUE" NUMBER(18,5),                                               
	"CUT_VALUE" NUMBER(18,5),                                                      
	"RESULTS_VALUE" NVARCHAR2(100),                                                
	"NUMERIC_VALUE" NUMBER(18,5),                                                  
	"NUMERIC_VALUE_CODE" NVARCHAR2(50),                                            
	"TEA_NORMALIZED_PVALUE" NUMBER(18,5),                                          
	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0),                                     
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_DATA_N_FK2" FOREIGN KEY ("BIO_EXPERIMENT_ID")  
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") DISABLE,         
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_DATA_N_FK1" FOREIGN KEY ("BIO_ASSAY_ANALYSIS_ID
")                                                                              
	  REFERENCES "BIOMART"."BIO_ASSAY_ANALYSIS" ("BIO_ASSAY_ANALYSIS_ID") ENABLE,  
	 CONSTRAINT "BIO_ASY_AD_FG_FK" FOREIGN KEY ("BIO_ASSAY_FEATURE_GROUP_ID")      
	  REFERENCES "BIOMART"."BIO_ASSAY_FEATURE_GROUP" ("BIO_ASSAY_FEATURE_GROUP_ID")
 ENABLE,                                                                        
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_DATA_N_FK3" FOREIGN KEY ("BIO_ASSAY_PLATFORM_ID
")                                                                              
	  REFERENCES "BIOMART"."BIO_ASSAY_PLATFORM" ("BIO_ASSAY_PLATFORM_ID") DISABLE  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 150994944 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645     
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_DATA_TEA"                          
   (	"BIO_ASY_ANALYSIS_DATA_ID" NUMBER NOT NULL ENABLE,                         
	"FOLD_CHANGE_RATIO" NUMBER,                                                    
	"RAW_PVALUE" NUMBER(18,5),                                                     
	"ADJUSTED_PVALUE" NUMBER(18,5),                                                
	"R_VALUE" NUMBER(18,5),                                                        
	"RHO_VALUE" NUMBER(18,5),                                                      
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"ADJUSTED_P_VALUE_CODE" NVARCHAR2(100),                                        
	"FEATURE_GROUP_NAME" VARCHAR2(100) NOT NULL ENABLE,                            
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_ASSAY_PLATFORM_ID" NUMBER(18,0),                                          
	"ETL_ID" NVARCHAR2(100),                                                       
	"PREFERRED_PVALUE" NUMBER(18,5),                                               
	"CUT_VALUE" NUMBER(18,5),                                                      
	"RESULTS_VALUE" NVARCHAR2(100),                                                
	"NUMERIC_VALUE" NUMBER(18,5),                                                  
	"NUMERIC_VALUE_CODE" NVARCHAR2(50),                                            
	"TEA_NORMALIZED_PVALUE" NUMBER(18,5),                                          
	"BIO_EXPERIMENT_TYPE" VARCHAR2(50),                                            
	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0),                                     
	"TEA_RANK" NUMBER(18,0),                                                       
	 CONSTRAINT "BIO_AA_DATA_T_PK" PRIMARY KEY ("BIO_ASY_ANALYSIS_DATA_ID")        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_DATA_T_FK2" FOREIGN KEY ("BIO_EXPERIMENT_ID")  
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") DISABLE,         
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_DATA_T_FK1" FOREIGN KEY ("BIO_ASSAY_ANALYSIS_ID
")                                                                              
	  REFERENCES "BIOMART"."BIO_ASSAY_ANALYSIS" ("BIO_ASSAY_ANALYSIS_ID") ENABLE,  
	 CONSTRAINT "BIO_ASY_AD_TEA_FG_FK" FOREIGN KEY ("BIO_ASSAY_FEATURE_GROUP_ID")  
	  REFERENCES "BIOMART"."BIO_ASSAY_FEATURE_GROUP" ("BIO_ASSAY_FEATURE_GROUP_ID")
 ENABLE,                                                                        
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_DATA_T_FK3" FOREIGN KEY ("BIO_ASSAY_PLATFORM_ID
")                                                                              
	  REFERENCES "BIOMART"."BIO_ASSAY_PLATFORM" ("BIO_ASSAY_PLATFORM_ID") DISABLE  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 7340032 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_EQTL"                              
   (	"BIO_ASY_ANALYSIS_EQTL_ID" NUMBER(22,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(22,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"GENE" VARCHAR2(50),                                                           
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"P_VALUE" BINARY_DOUBLE,                                                       
	"LOG_P_VALUE" BINARY_DOUBLE,                                                   
	"CIS_TRANS" VARCHAR2(10),                                                      
	"DISTANCE_FROM_GENE" VARCHAR2(10),                                             
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  PARALLEL 4                                                                    
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_EXT"                               
   (	"BIO_ASSAY_ANALYSIS_EXT_ID" NUMBER(18,0) NOT NULL ENABLE,                  
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"VENDOR" VARCHAR2(500),                                                        
	"VENDOR_TYPE" VARCHAR2(500),                                                   
	"GENOME_VERSION" VARCHAR2(500),                                                
	"TISSUE" VARCHAR2(500),                                                        
	"CELL_TYPE" VARCHAR2(500),                                                     
	"POPULATION" VARCHAR2(500),                                                    
	"RESEARCH_UNIT" VARCHAR2(500),                                                 
	"SAMPLE_SIZE" VARCHAR2(500),                                                   
	"MODEL_NAME" VARCHAR2(100),                                                    
	"MODEL_DESC" VARCHAR2(4000)                                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_ANALYSIS_GWAS"                              
   (	"BIO_ASY_ANALYSIS_GWAS_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"RS_ID" NVARCHAR2(50),                                                         
	"P_VALUE_CHAR" VARCHAR2(100),                                                  
	"P_VALUE" BINARY_DOUBLE,                                                       
	"LOG_P_VALUE" BINARY_DOUBLE,                                                   
	"ETL_ID" NUMBER(18,0),                                                         
	"EXT_DATA" VARCHAR2(4000)                                                      
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  CACHE PARALLEL 4                                                              
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_DATA"                                       
   (	"BIO_SAMPLE_ID" NUMBER(18,0),                                              
	"BIO_ASSAY_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"LOG2_VALUE" NUMBER(18,5),                                                     
	"LOG10_VALUE" NUMBER(18,5),                                                    
	"NUMERIC_VALUE" NUMBER(18,0),                                                  
	"TEXT_VALUE" VARCHAR2(200),                                                    
	"FLOAT_VALUE" NUMBER(18,5),                                                    
	"FEATURE_GROUP_NAME" VARCHAR2(100) NOT NULL ENABLE,                            
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_ASSAY_DATASET_ID" NUMBER(18,0),                                           
	"BIO_ASSAY_ID" NUMBER(18,0),                                                   
	"ETL_ID" NUMBER,                                                               
	 CONSTRAINT "BIO_EXPERIMENT_DATA_FACT_PK" PRIMARY KEY ("BIO_ASSAY_DATA_ID")    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_ASY_EXP_FK" FOREIGN KEY ("BIO_EXPERIMENT_ID")                 
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") ENABLE,          
	 CONSTRAINT "BIO_EXP_DATA_FACT_SAMP_FK" FOREIGN KEY ("BIO_SAMPLE_ID")          
	  REFERENCES "BIOMART"."BIO_SAMPLE" ("BIO_SAMPLE_ID") ENABLE,                  
	 CONSTRAINT "BIO_ASY_DT_DS_FK" FOREIGN KEY ("BIO_ASSAY_DATASET_ID")            
	  REFERENCES "BIOMART"."BIO_ASSAY_DATASET" ("BIO_ASSAY_DATASET_ID") ENABLE     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_DATASET"                                    
   (	"BIO_ASSAY_DATASET_ID" NUMBER(18,0) NOT NULL ENABLE,                       
	"DATASET_NAME" NVARCHAR2(400),                                                 
	"DATASET_DESCRIPTION" NVARCHAR2(1000),                                         
	"DATASET_CRITERIA" NVARCHAR2(1000),                                            
	"CREATE_DATE" DATE,                                                            
	"BIO_EXPERIMENT_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"BIO_ASSAY_ID" NUMBER(18,0),                                                   
	"ETL_ID" NVARCHAR2(100),                                                       
	"ACCESSION" VARCHAR2(50),                                                      
	 CONSTRAINT "BIO_DATASET_PK" PRIMARY KEY ("BIO_ASSAY_DATASET_ID")              
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_DATASET_EXPERIMENT_FK" FOREIGN KEY ("BIO_EXPERIMENT_ID")      
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") ENABLE           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_DATA_ANNOTATION"                            
   (	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0),                                 
	"BIO_MARKER_ID" NUMBER(18,0) NOT NULL ENABLE,                                  
	"DATA_TABLE" CHAR(5)                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_DATA_STATS"                                 
   (	"BIO_ASSAY_DATA_STATS_ID" NUMBER(18,0),                                    
	"BIO_SAMPLE_COUNT" NUMBER(18,0),                                               
	"QUARTILE_1" NUMBER(18,5),                                                     
	"QUARTILE_2" NUMBER(18,5),                                                     
	"QUARTILE_3" NUMBER(18,5),                                                     
	"MAX_VALUE" NUMBER(18,5),                                                      
	"MIN_VALUE" NUMBER(18,5),                                                      
	"BIO_SAMPLE_ID" NUMBER(18,0),                                                  
	"FEATURE_GROUP_NAME" NVARCHAR2(120),                                           
	"VALUE_NORMALIZE_METHOD" NVARCHAR2(50),                                        
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"MEAN_VALUE" NUMBER(18,5),                                                     
	"STD_DEV_VALUE" NUMBER(18,5),                                                  
	"BIO_ASSAY_DATASET_ID" NUMBER(18,0),                                           
	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0) NOT NULL ENABLE,                     
	 CONSTRAINT "BIO_ASY_DT_STATS_S_PK" PRIMARY KEY ("BIO_ASSAY_DATA_STATS_ID")    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_ASY_DT_STAT_EXP_S_FK" FOREIGN KEY ("BIO_EXPERIMENT_ID")       
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") ENABLE,          
	 CONSTRAINT "BIO_ASY_DT_STATS_SMP_S_FK" FOREIGN KEY ("BIO_SAMPLE_ID")          
	  REFERENCES "BIOMART"."BIO_SAMPLE" ("BIO_SAMPLE_ID") ENABLE,                  
	 CONSTRAINT "BIO_ASY_DT_STATS_DS_S_FK" FOREIGN KEY ("BIO_ASSAY_DATASET_ID")    
	  REFERENCES "BIOMART"."BIO_ASSAY_DATASET" ("BIO_ASSAY_DATASET_ID") ENABLE,    
	 CONSTRAINT "BIO_ASY_DT_FG_FK" FOREIGN KEY ("BIO_ASSAY_FEATURE_GROUP_ID")      
	  REFERENCES "BIOMART"."BIO_ASSAY_FEATURE_GROUP" ("BIO_ASSAY_FEATURE_GROUP_ID")
 ENABLE                                                                         
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_FEATURE_GROUP"                              
   (	"BIO_ASSAY_FEATURE_GROUP_ID" NUMBER(18,0) NOT NULL ENABLE,                 
	"FEATURE_GROUP_NAME" VARCHAR2(100) NOT NULL ENABLE,                            
	"FEATURE_GROUP_TYPE" VARCHAR2(50) NOT NULL ENABLE,                             
	 CONSTRAINT "BIO_ASY_FEATURE_GRP_PK" PRIMARY KEY ("BIO_ASSAY_FEATURE_GROUP_ID")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 17825792 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 15728640 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_PLATFORM"                                   
   (	"BIO_ASSAY_PLATFORM_ID" NUMBER(18,0) NOT NULL ENABLE,                      
	"PLATFORM_NAME" NVARCHAR2(200),                                                
	"PLATFORM_VERSION" NVARCHAR2(200),                                             
	"PLATFORM_DESCRIPTION" NVARCHAR2(2000),                                        
	"PLATFORM_ARRAY" VARCHAR2(50),                                                 
	"PLATFORM_ACCESSION" VARCHAR2(20),                                             
	"PLATFORM_ORGANISM" VARCHAR2(200),                                             
	"PLATFORM_VENDOR" VARCHAR2(200),                                               
	"PLATFORM_TYPE" VARCHAR2(50),                                                  
	 CONSTRAINT "BIO_ASSAY_PLATFORM_PK" PRIMARY KEY ("BIO_ASSAY_PLATFORM_ID")      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASSAY_SAMPLE"                                     
   (	"BIO_ASSAY_ID" NUMBER(18,0) NOT NULL ENABLE,                               
	"BIO_SAMPLE_ID" NUMBER(18,0) NOT NULL ENABLE,                                  
	"BIO_CLINIC_TRIAL_TIMEPOINT_ID" NUMBER(18,0) NOT NULL ENABLE,                  
	 CONSTRAINT "BIO_ASSAY_SAMPLE_PK" PRIMARY KEY ("BIO_ASSAY_ID", "BIO_SAMPLE_ID",
 "BIO_CLINIC_TRIAL_TIMEPOINT_ID")                                               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_ASSAY_SAMPLE_BIO_ASSAY_FK" FOREIGN KEY ("BIO_ASSAY_ID")       
	  REFERENCES "BIOMART"."BIO_ASSAY" ("BIO_ASSAY_ID") ENABLE,                    
	 CONSTRAINT "BIO_ASSAY_SAMPLE_BIO_SAMPLE_FK" FOREIGN KEY ("BIO_SAMPLE_ID")     
	  REFERENCES "BIOMART"."BIO_SAMPLE" ("BIO_SAMPLE_ID") ENABLE                   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASY_ANALYSIS_DATASET"                             
   (	"BIO_ASSAY_DATASET_ID" NUMBER(18,0) NOT NULL ENABLE,                       
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	 CONSTRAINT "BIO_DATA_ANALYSIS_DATASET_PK" PRIMARY KEY ("BIO_ASSAY_DATASET_ID",
 "BIO_ASSAY_ANALYSIS_ID")                                                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_DATA_ANL_DS_ANL_FK" FOREIGN KEY ("BIO_ASSAY_ANALYSIS_ID")     
	  REFERENCES "BIOMART"."BIO_ASSAY_ANALYSIS" ("BIO_ASSAY_ANALYSIS_ID") ENABLE,  
	 CONSTRAINT "BIO_DATA_ANL_DS_FK" FOREIGN KEY ("BIO_ASSAY_DATASET_ID")          
	  REFERENCES "BIOMART"."BIO_ASSAY_DATASET" ("BIO_ASSAY_DATASET_ID") ENABLE     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASY_ANALYSIS_DATA_IDX"                            
   (	"BIO_ASY_ANALYSIS_DATA_IDX_ID" NUMBER(18,0),                               
	"EXT_TYPE" VARCHAR2(100),                                                      
	"FIELD_NAME" VARCHAR2(100),                                                    
	"FIELD_IDX" NUMBER(18,0),                                                      
	"DISPLAY_NAME" VARCHAR2(100),                                                  
	"DISPLAY_IDX" NUMBER(38,0)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "TRANSMART"                                                        
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASY_ANALYSIS_EQTL_TOP50"                          
   (	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0),                                      
	"ANALYSIS" NVARCHAR2(500),                                                     
	"CHROM" VARCHAR2(4),                                                           
	"POS" NUMBER(10,0),                                                            
	"RSGENE" NVARCHAR2(200),                                                       
	"RSID" NVARCHAR2(50),                                                          
	"PVALUE" BINARY_DOUBLE,                                                        
	"LOGPVALUE" BINARY_DOUBLE,                                                     
	"GENE" VARCHAR2(50),                                                           
	"EXTDATA" VARCHAR2(4000),                                                      
	"RNUM" NUMBER                                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASY_ANALYSIS_GWAS_TOP50"                          
   (	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0),                                      
	"ANALYSIS" NVARCHAR2(500),                                                     
	"CHROM" VARCHAR2(4),                                                           
	"POS" NUMBER(10,0),                                                            
	"RSGENE" NVARCHAR2(200),                                                       
	"RSID" NVARCHAR2(50),                                                          
	"PVALUE" BINARY_DOUBLE,                                                        
	"LOGPVALUE" BINARY_DOUBLE,                                                     
	"EXTDATA" VARCHAR2(4000),                                                      
	"RNUM" NUMBER                                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASY_ANALYSIS_PLTFM"                               
   (	"BIO_ASY_ANALYSIS_PLTFM_ID" NUMBER(18,0) NOT NULL ENABLE,                  
	"PLATFORM_NAME" NVARCHAR2(200),                                                
	"PLATFORM_VERSION" NVARCHAR2(200),                                             
	"PLATFORM_DESCRIPTION" NVARCHAR2(1000),                                        
	 CONSTRAINT "BIO_ASSAY_ANALYSIS_PLATFORM_PK" PRIMARY KEY ("BIO_ASY_ANALYSIS_PLT
FM_ID")                                                                         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_ASY_DATA_STATS_ALL"                               
   (	"BIO_ASSAY_DATA_STATS_ID" NUMBER(18,0),                                    
	"BIO_SAMPLE_COUNT" NUMBER(18,0),                                               
	"QUARTILE_1" NUMBER(18,5),                                                     
	"QUARTILE_2" NUMBER(18,5),                                                     
	"QUARTILE_3" NUMBER(18,5),                                                     
	"MAX_VALUE" NUMBER(18,5),                                                      
	"MIN_VALUE" NUMBER(18,5),                                                      
	"BIO_SAMPLE_ID" NUMBER(18,0),                                                  
	"FEATURE_GROUP_NAME" NVARCHAR2(120),                                           
	"VALUE_NORMALIZE_METHOD" NVARCHAR2(50),                                        
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"MEAN_VALUE" NUMBER(18,5),                                                     
	"STD_DEV_VALUE" NUMBER(18,5),                                                  
	"BIO_ASSAY_DATASET_ID" NUMBER(18,0),                                           
	 CONSTRAINT "BIO_ASY_DT_STATS_PK" PRIMARY KEY ("BIO_ASSAY_DATA_STATS_ID")      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_ASY_DT_STATS_SMP_FK" FOREIGN KEY ("BIO_SAMPLE_ID")            
	  REFERENCES "BIOMART"."BIO_SAMPLE" ("BIO_SAMPLE_ID") ENABLE                   
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CELL_LINE"                                        
   (	"DISEASE" NVARCHAR2(510),                                                  
	"PRIMARY_SITE" NVARCHAR2(510),                                                 
	"METASTATIC_SITE" NVARCHAR2(510),                                              
	"SPECIES" NVARCHAR2(510),                                                      
	"ATTC_NUMBER" NVARCHAR2(510),                                                  
	"CELL_LINE_NAME" NVARCHAR2(510),                                               
	"BIO_CELL_LINE_ID" NUMBER(18,0) NOT NULL ENABLE,                               
	"BIO_DISEASE_ID" NUMBER(18,0),                                                 
	"ORIGIN" NVARCHAR2(200),                                                       
	"DESCRIPTION" NVARCHAR2(500),                                                  
	"DISEASE_STAGE" NVARCHAR2(100),                                                
	"DISEASE_SUBTYPE" NVARCHAR2(200),                                              
	"ETL_REFERENCE_LINK" NVARCHAR2(300),                                           
	 CONSTRAINT "CELLLINEDICTIONARY_PK" PRIMARY KEY ("BIO_CELL_LINE_ID")           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "CD_DISEASE_FK" FOREIGN KEY ("BIO_DISEASE_ID")                     
	  REFERENCES "BIOMART"."BIO_DISEASE" ("BIO_DISEASE_ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CGDCP_DATA"                                       
   (	"EVIDENCE_CODE" NVARCHAR2(200),                                            
	"NEGATION_INDICATOR" CHAR(1 CHAR),                                             
	"CELL_LINE_ID" NUMBER(18,0),                                                   
	"NCI_DISEASE_CONCEPT_CODE" NVARCHAR2(200),                                     
	"NCI_ROLE_CODE" NVARCHAR2(200),                                                
	"NCI_DRUG_CONCEPT_CODE" NVARCHAR2(200),                                        
	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                    
	 CONSTRAINT "BIO_CANCER_GENE_CURATION_FACT_" PRIMARY KEY ("BIO_DATA_ID")       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CLINC_TRIAL_ATTR"                                 
   (	"BIO_CLINC_TRIAL_ATTR_ID" NUMBER(18,0) NOT NULL ENABLE,                    
	"PROPERTY_CODE" NVARCHAR2(200) NOT NULL ENABLE,                                
	"PROPERTY_VALUE" NVARCHAR2(200),                                               
	"BIO_EXPERIMENT_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	 CONSTRAINT "BIO_CLINICAL_TRIAL_PATIENT_GRP" PRIMARY KEY ("BIO_CLINC_TRIAL_ATTR
_ID")                                                                           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_CLINICAL_TRIAL_PROPERTY_BI" FOREIGN KEY ("BIO_EXPERIMENT_ID") 
	  REFERENCES "BIOMART"."BIO_CLINICAL_TRIAL" ("BIO_EXPERIMENT_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CLINC_TRIAL_PT_GROUP"                             
   (	"BIO_EXPERIMENT_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"BIO_CLINICAL_TRIAL_P_GROUP_ID" NUMBER(18,0) NOT NULL ENABLE,                  
	"NAME" NVARCHAR2(510),                                                         
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	"NUMBER_OF_PATIENTS" NUMBER(10,0),                                             
	"PATIENT_GROUP_TYPE_CODE" NVARCHAR2(200),                                      
	 CONSTRAINT "BIO_CLINICAL_TRIAL_PT_GROUP" PRIMARY KEY ("BIO_CLINICAL_TRIAL_P_GR
OUP_ID")                                                                        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_CLINC_TRL_PT_GRP_EXP_FK" FOREIGN KEY ("BIO_EXPERIMENT_ID")    
	  REFERENCES "BIOMART"."BIO_CLINICAL_TRIAL" ("BIO_EXPERIMENT_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CLINC_TRIAL_TIME_PT"                              
   (	"BIO_CLINC_TRIAL_TM_PT_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"TIME_POINT" NVARCHAR2(200),                                                   
	"TIME_POINT_CODE" NVARCHAR2(200),                                              
	"START_DATE" DATE,                                                             
	"END_DATE" DATE,                                                               
	"BIO_EXPERIMENT_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	 CONSTRAINT "BIO_CLINICAL_TRIAL_TIME_POINT_" PRIMARY KEY ("BIO_CLINC_TRIAL_TM_P
T_ID")                                                                          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_CLI_TRIAL_TIME_TRL_FK" FOREIGN KEY ("BIO_EXPERIMENT_ID")      
	  REFERENCES "BIOMART"."BIO_CLINICAL_TRIAL" ("BIO_EXPERIMENT_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CLINICAL_TRIAL"                                   
   (	"TRIAL_NUMBER" NVARCHAR2(510),                                             
	"STUDY_OWNER" NVARCHAR2(510),                                                  
	"STUDY_PHASE" VARCHAR2(100),                                                   
	"BLINDING_PROCEDURE" NVARCHAR2(1000),                                          
	"STUDYTYPE" NVARCHAR2(510),                                                    
	"DURATION_OF_STUDY_WEEKS" NUMBER(10,0),                                        
	"NUMBER_OF_PATIENTS" NUMBER(10,0),                                             
	"NUMBER_OF_SITES" NUMBER(10,0),                                                
	"ROUTE_OF_ADMINISTRATION" NVARCHAR2(510),                                      
	"DOSING_REGIMEN" VARCHAR2(3500),                                               
	"GROUP_ASSIGNMENT" NVARCHAR2(510),                                             
	"TYPE_OF_CONTROL" NVARCHAR2(510),                                              
	"COMPLETION_DATE" DATE,                                                        
	"PRIMARY_END_POINTS" VARCHAR2(2000),                                           
	"SECONDARY_END_POINTS" VARCHAR2(3500),                                         
	"INCLUSION_CRITERIA" NCLOB,                                                    
	"EXCLUSION_CRITERIA" NCLOB,                                                    
	"SUBJECTS" VARCHAR2(2000),                                                     
	"GENDER_RESTRICTION_MFB" NVARCHAR2(510),                                       
	"MIN_AGE" NUMBER(10,0),                                                        
	"MAX_AGE" NUMBER(10,0),                                                        
	"SECONDARY_IDS" NVARCHAR2(510),                                                
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"DEVELOPMENT_PARTNER" VARCHAR2(100),                                           
	"GEO_PLATFORM" VARCHAR2(30),                                                   
	"MAIN_FINDINGS" VARCHAR2(2000),                                                
	"PLATFORM_NAME" VARCHAR2(200),                                                 
	"SEARCH_AREA" VARCHAR2(100),                                                   
	 CONSTRAINT "CLINICALTRIALDIM_PK" PRIMARY KEY ("BIO_EXPERIMENT_ID")            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_CLINICAL_TRIAL_BIO_EXPERIM" FOREIGN KEY ("BIO_EXPERIMENT_ID") 
	  REFERENCES "BIOMART"."BIO_EXPERIMENT" ("BIO_EXPERIMENT_ID") ENABLE           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("INCLUSION_CRITERIA") STORE AS BASICFILE (                                
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
 LOB ("EXCLUSION_CRITERIA") STORE AS BASICFILE (                                
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CLINICAL_TRIAL_DESIGN"                            
   (	"REF_ID" VARCHAR2(4000),                                                   
	"REF_RECORD_ID" VARCHAR2(4000),                                                
	"REF_BACK_REFERENCE" VARCHAR2(4000),                                           
	"REF_ARTICLE_PMID" VARCHAR2(4000),                                             
	"REF_PROTOCOL_ID" VARCHAR2(4000),                                              
	"REF_TITLE" VARCHAR2(4000),                                                    
	"STUDY_TYPE" VARCHAR2(4000),                                                   
	"COMMON_NAME" VARCHAR2(4000),                                                  
	"ICD10" VARCHAR2(4000),                                                        
	"MESH" VARCHAR2(4000),                                                         
	"DISEASE_TYPE" VARCHAR2(4000),                                                 
	"PHYSIOLOGY_NAME" VARCHAR2(4000),                                              
	"TRIAL_STATUS" VARCHAR2(4000),                                                 
	"TRIAL_PHASE" VARCHAR2(4000),                                                  
	"NATURE_OF_TRIAL" VARCHAR2(4000),                                              
	"RANDOMIZATION" VARCHAR2(4000),                                                
	"BLINDED_TRIAL" VARCHAR2(4000),                                                
	"TRIAL_TYPE" VARCHAR2(4000),                                                   
	"RUN_N_PERIOD" VARCHAR2(4000),                                                 
	"TREATMENT_PERIOD" VARCHAR2(4000),                                             
	"WASHOUT_PERIOD" VARCHAR2(4000),                                               
	"OPEN_LABEL_EXTENSION" VARCHAR2(4000),                                         
	"SPONSOR" VARCHAR2(4000),                                                      
	"TRIAL_NBR_OF_PATIENTS_STUDIED" VARCHAR2(4000),                                
	"SOURCE_TYPE" VARCHAR2(4000),                                                  
	"TRIAL_AGE" VARCHAR2(4000),                                                    
	"DISEASE_SEVERITY" VARCHAR2(4000),                                             
	"DIFFICULT_TO_TREAT" VARCHAR2(4000),                                           
	"ASTHMA_DIAGNOSIS" VARCHAR2(4000),                                             
	"INHALED_STEROID_DOSE" VARCHAR2(4000),                                         
	"LABA" VARCHAR2(4000),                                                         
	"OCS" VARCHAR2(4000),                                                          
	"XOLAIR" VARCHAR2(4000),                                                       
	"LTRA_INHIBITORS" VARCHAR2(4000),                                              
	"ASTHMA_PHENOTYPE" VARCHAR2(4000),                                             
	"FEV1" VARCHAR2(4000),                                                         
	"FEV1_REVERSIBILITY" VARCHAR2(4000),                                           
	"TLC" VARCHAR2(4000),                                                          
	"FEV1_FVC" VARCHAR2(4000),                                                     
	"FVC" VARCHAR2(4000),                                                          
	"DLCO" VARCHAR2(4000),                                                         
	"SGRQ" VARCHAR2(4000),                                                         
	"HRCT" VARCHAR2(4000),                                                         
	"BIOPSY" VARCHAR2(4000),                                                       
	"DYSPNEA_ON_EXERTION" VARCHAR2(4000),                                          
	"CONCOMITANT_MED" VARCHAR2(4000),                                              
	"TRIAL_SMOKERS_PCT" VARCHAR2(4000),                                            
	"TRIAL_FORMER_SMOKERS_PCT" VARCHAR2(4000),                                     
	"TRIAL_NEVER_SMOKERS_PCT" VARCHAR2(4000),                                      
	"TRIAL_PACK_YEARS" VARCHAR2(4000),                                             
	"EXCLUSION_CRITERIA" VARCHAR2(4000),                                           
	"MINIMAL_SYMPTOMS" VARCHAR2(4000),                                             
	"RESCUE_MEDICATION_USE" VARCHAR2(4000),                                        
	"CONTROL_DETAILS" VARCHAR2(4000),                                              
	"BLINDING_PROCEDURE" VARCHAR2(4000),                                           
	"NUMBER_OF_ARMS" VARCHAR2(4000),                                               
	"DESCRIPTION" VARCHAR2(4000),                                                  
	"ARM" VARCHAR2(4000),                                                          
	"ARM_NBR_OF_PATIENTS_STUDIED" VARCHAR2(4000),                                  
	"ARM_CLASSIFICATION_TYPE" VARCHAR2(4000),                                      
	"ARM_CLASSIFICATION_VALUE" VARCHAR2(4000),                                     
	"ARM_ASTHMA_DURATION" VARCHAR2(4000),                                          
	"ARM_GEOGRAPHIC_REGION" VARCHAR2(4000),                                        
	"ARM_AGE" VARCHAR2(4000),                                                      
	"ARM_GENDER" VARCHAR2(4000),                                                   
	"ARM_SMOKERS_PCT" VARCHAR2(4000),                                              
	"ARM_FORMER_SMOKERS_PCT" VARCHAR2(4000),                                       
	"ARM_NEVER_SMOKERS_PCT" VARCHAR2(4000),                                        
	"ARM_PACK_YEARS" VARCHAR2(4000),                                               
	"MINORITY_PARTICIPATION" VARCHAR2(4000),                                       
	"BASELINE_SYMPTOM_SCORE" VARCHAR2(4000),                                       
	"BASELINE_RESCUE_MEDICATION_USE" VARCHAR2(4000),                               
	"CLINICAL_VARIABLE" VARCHAR2(4000),                                            
	"CLINICAL_VARIABLE_PCT" VARCHAR2(4000),                                        
	"CLINICAL_VARIABLE_VALUE" VARCHAR2(4000),                                      
	"PRIOR_MED_DRUG_NAME" VARCHAR2(4000),                                          
	"PRIOR_MED_PCT" VARCHAR2(4000),                                                
	"PRIOR_MED_VALUE" VARCHAR2(4000),                                              
	"BIOMARKER_NAME" VARCHAR2(4000),                                               
	"BIOMARKER_PCT" VARCHAR2(4000),                                                
	"BIOMARKERVALUE" VARCHAR2(4000),                                               
	"CELLINFO_TYPE" VARCHAR2(4000),                                                
	"CELLINFO_COUNT" VARCHAR2(4000),                                               
	"CELLINFO_SOURCE" VARCHAR2(4000),                                              
	"PULMONARY_PATHOLOGY_NAME" VARCHAR2(4000),                                     
	"PULMPATH_PATIENT_PCT" VARCHAR2(4000),                                         
	"PULMPATH_VALUE_UNIT" VARCHAR2(4000),                                          
	"PULMPATH_METHOD" VARCHAR2(4000),                                              
	"RUNIN_OCS" VARCHAR2(4000),                                                    
	"RUNIN_ICS" VARCHAR2(4000),                                                    
	"RUNIN_LABA" VARCHAR2(4000),                                                   
	"RUNIN_LTRA" VARCHAR2(4000),                                                   
	"RUNIN_CORTICOSTEROIDS" VARCHAR2(4000),                                        
	"RUNIN_ANTI_FIBROTICS" VARCHAR2(4000),                                         
	"RUNIN_IMMUNOSUPPRESSIVE" VARCHAR2(4000),                                      
	"RUNIN_CYTOTOXIC" VARCHAR2(4000),                                              
	"RUNIN_DESCRIPTION" VARCHAR2(4000),                                            
	"TRTMT_OCS" VARCHAR2(4000),                                                    
	"TRTMT_ICS" VARCHAR2(4000),                                                    
	"TRTMT_LABA" VARCHAR2(4000),                                                   
	"TRTMT_LTRA" VARCHAR2(4000),                                                   
	"TRTMT_CORTICOSTEROIDS" VARCHAR2(4000),                                        
	"TRTMT_ANTI_FIBROTICS" VARCHAR2(4000),                                         
	"TRTMT_IMMUNOSUPPRESSIVE" VARCHAR2(4000),                                      
	"TRTMT_CYTOTOXIC" VARCHAR2(4000),                                              
	"TRTMT_DESCRIPTION" VARCHAR2(4000),                                            
	"DRUG_INHIBITOR_COMMON_NAME" VARCHAR2(4000),                                   
	"DRUG_INHIBITOR_STANDARD_NAME" VARCHAR2(4000),                                 
	"DRUG_INHIBITOR_CAS_ID" VARCHAR2(4000),                                        
	"DRUG_INHIBITOR_DOSE" VARCHAR2(4000),                                          
	"DRUG_INHIBITOR_ROUTE_OF_ADMIN" VARCHAR2(4000),                                
	"DRUG_INHIBITOR_TRTMT_REGIME" VARCHAR2(4000),                                  
	"COMPARATOR_NAME" VARCHAR2(4000),                                              
	"COMPARATOR_DOSE" VARCHAR2(4000),                                              
	"COMPARATOR_TIME_PERIOD" VARCHAR2(4000),                                       
	"COMPARATOR_ROUTE_OF_ADMIN" VARCHAR2(4000),                                    
	"TREATMENT_REGIME" VARCHAR2(4000),                                             
	"PLACEBO" VARCHAR2(4000),                                                      
	"EXPERIMENT_DESCRIPTION" VARCHAR2(4000),                                       
	"PRIMARY_ENDPOINT_TYPE" VARCHAR2(4000),                                        
	"PRIMARY_ENDPOINT_DEFINITION" VARCHAR2(4000),                                  
	"PRIMARY_ENDPOINT_TIME_PERIOD" VARCHAR2(4000),                                 
	"PRIMARY_ENDPOINT_CHANGE" VARCHAR2(4000),                                      
	"PRIMARY_ENDPOINT_P_VALUE" VARCHAR2(4000),                                     
	"PRIMARY_ENDPOINT_STAT_TEST" VARCHAR2(4000),                                   
	"SECONDARY_TYPE" VARCHAR2(4000),                                               
	"SECONDARY_TYPE_DEFINITION" VARCHAR2(4000),                                    
	"SECONDARY_TYPE_TIME_PERIOD" VARCHAR2(4000),                                   
	"SECONDARY_TYPE_CHANGE" VARCHAR2(4000),                                        
	"SECONDARY_TYPE_P_VALUE" VARCHAR2(4000),                                       
	"SECONDARY_TYPE_STAT_TEST" VARCHAR2(4000),                                     
	"CLINICAL_VARIABLE_NAME" VARCHAR2(4000),                                       
	"PCT_CHANGE_FROM_BASELINE" VARCHAR2(4000),                                     
	"ABS_CHANGE_FROM_BASELINE" VARCHAR2(4000),                                     
	"RATE_OF_CHANGE_FROM_BASELINE" VARCHAR2(4000),                                 
	"AVERAGE_OVER_TREATMENT_PERIOD" VARCHAR2(4000),                                
	"WITHIN_GROUP_CHANGES" VARCHAR2(4000),                                         
	"STAT_MEASURE_P_VALUE" VARCHAR2(4000),                                         
	"DEFINITION_OF_THE_EVENT" VARCHAR2(4000),                                      
	"NUMBER_OF_EVENTS" VARCHAR2(4000),                                             
	"EVENT_RATE" VARCHAR2(4000),                                                   
	"TIME_TO_EVENT" VARCHAR2(4000),                                                
	"EVENT_PCT_REDUCTION" VARCHAR2(4000),                                          
	"EVENT_P_VALUE" VARCHAR2(4000),                                                
	"EVENT_DESCRIPTION" VARCHAR2(4000),                                            
	"DISCONTINUATION_RATE" VARCHAR2(4000),                                         
	"RESPONSE_RATE" VARCHAR2(4000),                                                
	"DOWNSTREAM_SIGNALING_EFFECTS" VARCHAR2(4000),                                 
	"BENEFICIAL_EFFECTS" VARCHAR2(4000),                                           
	"ADVERSE_EFFECTS" VARCHAR2(4000),                                              
	"PK_PD_PARAMETER" VARCHAR2(4000),                                              
	"PK_PD_VALUE" VARCHAR2(4000),                                                  
	"EFFECT_DESCRIPTION" VARCHAR2(4000),                                           
	"BIOMOLECULE_NAME" VARCHAR2(4000),                                             
	"BIOMOLECULE_ID" VARCHAR2(4000),                                               
	"BIOMOLECULE_TYPE" VARCHAR2(4000),                                             
	"BIOMARKER" VARCHAR2(4000),                                                    
	"BIOMARKER_TYPE" VARCHAR2(4000),                                               
	"BASELINE_EXPR_PCT" VARCHAR2(4000),                                            
	"BASELINE_EXPR_NUMBER" VARCHAR2(4000),                                         
	"BASELINE_EXPR_VALUE_FOLD_MEAN" VARCHAR2(4000),                                
	"BASELINE_EXPR_SD" VARCHAR2(4000),                                             
	"BASELINE_EXPR_SEM" VARCHAR2(4000),                                            
	"BASELINE_EXPR_UNIT" VARCHAR2(4000),                                           
	"EXPR_AFTER_TRTMT_PCT" VARCHAR2(4000),                                         
	"EXPR_AFTER_TRTMT_NUMBER" VARCHAR2(4000),                                      
	"EXPR_AFTERTRTMT_VALUEFOLD_MEAN" VARCHAR2(4000),                               
	"EXPR_AFTER_TRTMT_SD" VARCHAR2(4000),                                          
	"EXPR_AFTER_TRTMT_SEM" VARCHAR2(4000),                                         
	"EXPR_AFTER_TRTMT_UNIT" VARCHAR2(4000),                                        
	"EXPR_CHG_SOURCE_TYPE" VARCHAR2(4000),                                         
	"EXPR_CHG_TECHNIQUE" VARCHAR2(4000),                                           
	"EXPR_CHG_DESCRIPTION" VARCHAR2(4000),                                         
	"CLINICAL_CORRELATION" VARCHAR2(4000),                                         
	"STATISTICAL_TEST" VARCHAR2(4000),                                             
	"STATISTICAL_COEFFICIENT_VALUE" VARCHAR2(4000),                                
	"STATISTICAL_TEST_P_VALUE" VARCHAR2(4000),                                     
	"STATISTICAL_TEST_DESCRIPTION" VARCHAR2(4000)                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_COMPOUND"                                         
   (	"BIO_COMPOUND_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"CNTO_NUMBER" NVARCHAR2(200),                                                  
	"JNJ_NUMBER" NVARCHAR2(200),                                                   
	"CAS_REGISTRY" NVARCHAR2(400),                                                 
	"CODE_NAME" NVARCHAR2(300),                                                    
	"GENERIC_NAME" NVARCHAR2(200),                                                 
	"BRAND_NAME" NVARCHAR2(200),                                                   
	"CHEMICAL_NAME" NVARCHAR2(1000),                                               
	"MECHANISM" NVARCHAR2(400),                                                    
	"PRODUCT_CATEGORY" NVARCHAR2(200),                                             
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	"ETL_ID_RETIRED" NUMBER(18,0),                                                 
	"ETL_ID" VARCHAR2(50),                                                         
	"SOURCE_CD" NVARCHAR2(100),                                                    
	 CONSTRAINT "COMPOUNDDIM_PK" PRIMARY KEY ("BIO_COMPOUND_ID")                   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 327680 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CONCEPT_CODE"                                     
   (	"BIO_CONCEPT_CODE" NVARCHAR2(200),                                         
	"CODE_NAME" VARCHAR2(200),                                                     
	"CODE_DESCRIPTION" NVARCHAR2(1000),                                            
	"CODE_TYPE_NAME" NVARCHAR2(200),                                               
	"BIO_CONCEPT_CODE_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	 CONSTRAINT "BIO_CONCEPT_CODE_PK" PRIMARY KEY ("BIO_CONCEPT_CODE_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_CONCEPT_CODE_UK" UNIQUE ("BIO_CONCEPT_CODE", "CODE_TYPE_NAME")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CONTENT"                                          
   (	"BIO_FILE_CONTENT_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"FILE_NAME" NVARCHAR2(1000),                                                   
	"REPOSITORY_ID" NUMBER(18,0),                                                  
	"LOCATION" NVARCHAR2(400),                                                     
	"TITLE" NVARCHAR2(1000),                                                       
	"ABSTRACT" NVARCHAR2(2000),                                                    
	"FILE_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                                    
	"ETL_ID" NUMBER(18,0),                                                         
	"ETL_ID_C" VARCHAR2(30),                                                       
	"STUDY_NAME" VARCHAR2(30),                                                     
	"CEL_LOCATION" VARCHAR2(300),                                                  
	"CEL_FILE_SUFFIX" VARCHAR2(30),                                                
	 CONSTRAINT "EXTERNAL_FILE_PK" PRIMARY KEY ("BIO_FILE_CONTENT_ID")             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "EXT_FILE_CNT_CNT_REPO_FK" FOREIGN KEY ("REPOSITORY_ID")           
	  REFERENCES "BIOMART"."BIO_CONTENT_REPOSITORY" ("BIO_CONTENT_REPO_ID") ENABLE 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CONTENT_REFERENCE"                                
   (	"BIO_CONTENT_REFERENCE_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"BIO_CONTENT_ID" NUMBER(18,0) NOT NULL ENABLE,                                 
	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                    
	"CONTENT_REFERENCE_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                       
	"ETL_ID" NUMBER(18,0),                                                         
	"ETL_ID_C" VARCHAR2(30),                                                       
	 CONSTRAINT "BIO_CONTENT_REF_N_PK" PRIMARY KEY ("BIO_CONTENT_REFERENCE_ID")    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_CONTENT_REF_CONT_FK" FOREIGN KEY ("BIO_CONTENT_ID")           
	  REFERENCES "BIOMART"."BIO_CONTENT" ("BIO_FILE_CONTENT_ID") ENABLE            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CONTENT_REPOSITORY"                               
   (	"BIO_CONTENT_REPO_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"LOCATION" NVARCHAR2(510),                                                     
	"ACTIVE_Y_N" CHAR(1 CHAR),                                                     
	"REPOSITORY_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                              
	"LOCATION_TYPE" NVARCHAR2(200),                                                
	 CONSTRAINT "EXTERNAL_FILE_REPOSITORY_PK" PRIMARY KEY ("BIO_CONTENT_REPO_ID")  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CURATED_DATA"                                     
   (	"STATEMENT" NCLOB,                                                         
	"STATEMENT_STATUS" NVARCHAR2(200),                                             
	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                    
	"BIO_CURATION_DATASET_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"REFERENCE_ID" NUMBER(18,0),                                                   
	"DATA_TYPE" NVARCHAR2(200),                                                    
	 CONSTRAINT "BIO_EXTERNALANALYSIS_FACT_PK" PRIMARY KEY ("BIO_DATA_ID")         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_EXT_ANALYS_EXT_ANL_FK" FOREIGN KEY ("BIO_CURATION_DATASET_ID")
                                                                                
	  REFERENCES "BIOMART"."BIO_CURATION_DATASET" ("BIO_CURATION_DATASET_ID") ENABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("STATEMENT") STORE AS BASICFILE (                                         
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE LOGGING                                                               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_CURATION_DATASET"                                 
   (	"BIO_CURATION_DATASET_ID" NUMBER(18,0) NOT NULL ENABLE,                    
	"BIO_ASY_ANALYSIS_PLTFM_ID" NUMBER(18,0),                                      
	"BIO_SOURCE_IMPORT_ID" NUMBER(18,0),                                           
	"BIO_CURATION_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                            
	"CREATE_DATE" DATE,                                                            
	"CREATOR" NUMBER(18,0),                                                        
	"BIO_CURATION_NAME" VARCHAR2(500),                                             
	"DATA_TYPE" VARCHAR2(100),                                                     
	 CONSTRAINT "BIO_EXTERNAL_ANALYSIS_PK" PRIMARY KEY ("BIO_CURATION_DATASET_ID") 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_EXT_ANL_PLTFM_FK" FOREIGN KEY ("BIO_ASY_ANALYSIS_PLTFM_ID")   
	  REFERENCES "BIOMART"."BIO_ASY_ANALYSIS_PLTFM" ("BIO_ASY_ANALYSIS_PLTFM_ID") E
NABLE                                                                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_ATTRIBUTE"                                   
   (	"BIO_DATA_ATTRIBUTE_ID" NUMBER(18,0) NOT NULL ENABLE,                      
	"PROPERTY_CODE" NVARCHAR2(200) NOT NULL ENABLE,                                
	"PROPERTY_VALUE" NVARCHAR2(200),                                               
	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                    
	"PROPERTY_UNIT" NVARCHAR2(100),                                                
	 CONSTRAINT "BIO_DATA_ATTR_PK" PRIMARY KEY ("BIO_DATA_ATTRIBUTE_ID")           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_COMPOUND"                                    
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"BIO_COMPOUND_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"ETL_SOURCE" VARCHAR2(100),                                                    
	 CONSTRAINT "BIO_DATA_COMPOUND_PK" PRIMARY KEY ("BIO_DATA_ID", "BIO_COMPOUND_ID
")                                                                              
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_DF_CMP_FK" FOREIGN KEY ("BIO_COMPOUND_ID")                    
	  REFERENCES "BIOMART"."BIO_COMPOUND" ("BIO_COMPOUND_ID") ENABLE               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_CORRELATION"                                 
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"ASSO_BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                               
	"BIO_DATA_CORREL_DESCR_ID" NUMBER(18,0) NOT NULL ENABLE,                       
	"BIO_DATA_CORREL_ID" NUMBER(18,0) NOT NULL ENABLE,                             
	 CONSTRAINT "BIO_DATA_CORRELATION_PK" PRIMARY KEY ("BIO_DATA_CORREL_ID")       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 786432 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_MARKER_LINK_BIO_MARKER_REL" FOREIGN KEY ("BIO_DATA_CORREL_DESC
R_ID")                                                                          
	  REFERENCES "BIOMART"."BIO_DATA_CORREL_DESCR" ("BIO_DATA_CORREL_DESCR_ID") ENA
BLE                                                                             
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_CORREL_DESCR"                                
   (	"BIO_DATA_CORREL_DESCR_ID" NUMBER(18,0) NOT NULL ENABLE,                   
	"CORRELATION" NVARCHAR2(510),                                                  
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	"TYPE_NAME" NVARCHAR2(200),                                                    
	"STATUS" NVARCHAR2(200),                                                       
	"SOURCE" NVARCHAR2(100),                                                       
	"SOURCE_CODE" NVARCHAR2(200),                                                  
	 CONSTRAINT "BIO_MARKER_RELATIONSHIP_PK" PRIMARY KEY ("BIO_DATA_CORREL_DESCR_ID
")                                                                              
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_DISEASE"                                     
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"BIO_DISEASE_ID" NUMBER(18,0) NOT NULL ENABLE,                                 
	"ETL_SOURCE" VARCHAR2(100),                                                    
	 CONSTRAINT "BIO_DATA_DISEASE_PK" PRIMARY KEY ("BIO_DATA_ID", "BIO_DISEASE_ID")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_DF_DISEASE_FK" FOREIGN KEY ("BIO_DISEASE_ID")                 
	  REFERENCES "BIOMART"."BIO_DISEASE" ("BIO_DISEASE_ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_EXT_CODE"                                    
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"CODE" VARCHAR2(500) NOT NULL ENABLE,                                          
	"CODE_SOURCE" NVARCHAR2(200),                                                  
	"CODE_TYPE" NVARCHAR2(200),                                                    
	"BIO_DATA_TYPE" VARCHAR2(100),                                                 
	"BIO_DATA_EXT_CODE_ID" NUMBER(18,0) NOT NULL ENABLE,                           
	"ETL_ID" VARCHAR2(50),                                                         
	 CONSTRAINT "BIO_DATA_EXT_CODE_PK" PRIMARY KEY ("BIO_DATA_EXT_CODE_ID")        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_LITERATURE"                                  
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"BIO_LIT_REF_DATA_ID" NUMBER(18,0),                                            
	"BIO_CURATION_DATASET_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"STATEMENT" NCLOB,                                                             
	"STATEMENT_STATUS" NVARCHAR2(200),                                             
	"DATA_TYPE" NVARCHAR2(200),                                                    
	 CONSTRAINT "BIO_DATA_LITERATURE_PK" PRIMARY KEY ("BIO_DATA_ID")               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_LIT_CURATION_DATASET_FK" FOREIGN KEY ("BIO_CURATION_DATASET_ID
")                                                                              
	  REFERENCES "BIOMART"."BIO_CURATION_DATASET" ("BIO_CURATION_DATASET_ID") ENABL
E                                                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
 LOB ("STATEMENT") STORE AS BASICFILE (                                         
  TABLESPACE "BIOMART" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION               
  NOCACHE NOLOGGING                                                             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT))                                                
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_OBSERVATION"                                 
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"BIO_OBSERVATION_ID" NUMBER(18,0) NOT NULL ENABLE,                             
	"ETL_SOURCE" VARCHAR2(100)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_OMIC_MARKER"                                 
   (	"BIO_DATA_ID" NUMBER(18,0),                                                
	"BIO_MARKER_ID" NUMBER(18,0) NOT NULL ENABLE,                                  
	"DATA_TABLE" VARCHAR2(5)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 35651584 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_PLATFORM"                                    
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"BIO_ASSAY_PLATFORM_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"ETL_SOURCE" VARCHAR2(100)                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_TAXONOMY"                                    
   (	"BIO_TAXONOMY_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                    
	"ETL_SOURCE" VARCHAR2(100),                                                    
	 CONSTRAINT "BIO_TAXON_FK" FOREIGN KEY ("BIO_TAXONOMY_ID")                     
	  REFERENCES "BIOMART"."BIO_TAXONOMY" ("BIO_TAXONOMY_ID") ENABLE               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DATA_UID"                                         
   (	"BIO_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                                
	"UNIQUE_ID" NVARCHAR2(300) NOT NULL ENABLE,                                    
	"BIO_DATA_TYPE" NVARCHAR2(100) NOT NULL ENABLE,                                
	 CONSTRAINT "BIO_DATA_UID_UK" UNIQUE ("UNIQUE_ID")                             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_DATA_UID_PK" PRIMARY KEY ("BIO_DATA_ID")                      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 589824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_DISEASE"                                          
   (	"BIO_DISEASE_ID" NUMBER(18,0) NOT NULL ENABLE,                             
	"DISEASE" NVARCHAR2(510) NOT NULL ENABLE,                                      
	"CCS_CATEGORY" NVARCHAR2(510),                                                 
	"ICD10_CODE" NVARCHAR2(510),                                                   
	"MESH_CODE" NVARCHAR2(510),                                                    
	"ICD9_CODE" NVARCHAR2(510),                                                    
	"PREFERED_NAME" NVARCHAR2(510),                                                
	"ETL_ID_RETIRED" NUMBER(18,0),                                                 
	"PRIMARY_SOURCE_CD" VARCHAR2(30),                                              
	"ETL_ID" VARCHAR2(50),                                                         
	 CONSTRAINT "DISEASEDIM_PK" PRIMARY KEY ("BIO_DISEASE_ID")                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 589824 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_EXPERIMENT"                                       
   (	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                          
	"BIO_EXPERIMENT_TYPE" NVARCHAR2(200),                                          
	"TITLE" NVARCHAR2(1000),                                                       
	"DESCRIPTION" NVARCHAR2(2000),                                                 
	"DESIGN" NVARCHAR2(2000),                                                      
	"START_DATE" DATE,                                                             
	"COMPLETION_DATE" DATE,                                                        
	"PRIMARY_INVESTIGATOR" NVARCHAR2(400),                                         
	"CONTACT_FIELD" NVARCHAR2(400),                                                
	"ETL_ID" NVARCHAR2(100),                                                       
	"STATUS" VARCHAR2(100),                                                        
	"OVERALL_DESIGN" NVARCHAR2(2000),                                              
	"ACCESSION" NVARCHAR2(100),                                                    
	"ENTRYDT" DATE,                                                                
	"UPDATED" DATE,                                                                
	"INSTITUTION" VARCHAR2(100),                                                   
	"COUNTRY" VARCHAR2(50),                                                        
	"BIOMARKER_TYPE" VARCHAR2(255),                                                
	"TARGET" VARCHAR2(255),                                                        
	"ACCESS_TYPE" VARCHAR2(100),                                                   
	 CONSTRAINT "EXPERIMENTDIM_PK" PRIMARY KEY ("BIO_EXPERIMENT_ID")               
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 524288 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_ALT_DATA"                                     
   (	"BIO_LIT_ALT_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"BIO_LIT_REF_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"IN_VIVO_MODEL_ID" NUMBER(18,0),                                               
	"IN_VITRO_MODEL_ID" NUMBER(18,0),                                              
	"ETL_ID" NVARCHAR2(50),                                                        
	"ALTERATION_TYPE" NVARCHAR2(50),                                               
	"CONTROL" NVARCHAR2(1000),                                                     
	"EFFECT" NVARCHAR2(500),                                                       
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	"TECHNIQUES" NVARCHAR2(1000),                                                  
	"PATIENTS_PERCENT" NVARCHAR2(500),                                             
	"PATIENTS_NUMBER" NVARCHAR2(500),                                              
	"POP_NUMBER" NVARCHAR2(250),                                                   
	"POP_INCLUSION_CRITERIA" NVARCHAR2(1000),                                      
	"POP_EXCLUSION_CRITERIA" NVARCHAR2(1000),                                      
	"POP_DESCRIPTION" NVARCHAR2(1000),                                             
	"POP_TYPE" NVARCHAR2(250),                                                     
	"POP_VALUE" NVARCHAR2(250),                                                    
	"POP_PHASE" NVARCHAR2(250),                                                    
	"POP_STATUS" NVARCHAR2(250),                                                   
	"POP_EXPERIMENTAL_MODEL" NVARCHAR2(250),                                       
	"POP_TISSUE" NVARCHAR2(250),                                                   
	"POP_BODY_SUBSTANCE" NVARCHAR2(250),                                           
	"POP_LOCALIZATION" NVARCHAR2(1000),                                            
	"POP_CELL_TYPE" NVARCHAR2(250),                                                
	"CLIN_SUBMUCOSA_MARKER_TYPE" NVARCHAR2(250),                                   
	"CLIN_SUBMUCOSA_UNIT" NVARCHAR2(250),                                          
	"CLIN_SUBMUCOSA_VALUE" NVARCHAR2(250),                                         
	"CLIN_ASM_MARKER_TYPE" NVARCHAR2(250),                                         
	"CLIN_ASM_UNIT" NVARCHAR2(250),                                                
	"CLIN_ASM_VALUE" NVARCHAR2(250),                                               
	"CLIN_CELLULAR_SOURCE" NVARCHAR2(250),                                         
	"CLIN_CELLULAR_TYPE" NVARCHAR2(250),                                           
	"CLIN_CELLULAR_COUNT" NVARCHAR2(250),                                          
	"CLIN_PRIOR_MED_PERCENT" NVARCHAR2(250),                                       
	"CLIN_PRIOR_MED_DOSE" NVARCHAR2(250),                                          
	"CLIN_PRIOR_MED_NAME" NVARCHAR2(250),                                          
	"CLIN_BASELINE_VARIABLE" NVARCHAR2(250),                                       
	"CLIN_BASELINE_PERCENT" NVARCHAR2(250),                                        
	"CLIN_BASELINE_VALUE" NVARCHAR2(250),                                          
	"CLIN_SMOKER" NVARCHAR2(250),                                                  
	"CLIN_ATOPY" NVARCHAR2(250),                                                   
	"CONTROL_EXP_PERCENT" NVARCHAR2(50),                                           
	"CONTROL_EXP_NUMBER" NVARCHAR2(50),                                            
	"CONTROL_EXP_VALUE" NVARCHAR2(50),                                             
	"CONTROL_EXP_SD" NVARCHAR2(50),                                                
	"CONTROL_EXP_UNIT" NVARCHAR2(100),                                             
	"OVER_EXP_PERCENT" NVARCHAR2(50),                                              
	"OVER_EXP_NUMBER" NVARCHAR2(50),                                               
	"OVER_EXP_VALUE" NVARCHAR2(50),                                                
	"OVER_EXP_SD" NVARCHAR2(50),                                                   
	"OVER_EXP_UNIT" NVARCHAR2(100),                                                
	"LOSS_EXP_PERCENT" NVARCHAR2(50),                                              
	"LOSS_EXP_NUMBER" NVARCHAR2(50),                                               
	"LOSS_EXP_VALUE" NVARCHAR2(50),                                                
	"LOSS_EXP_SD" NVARCHAR2(50),                                                   
	"LOSS_EXP_UNIT" NVARCHAR2(100),                                                
	"TOTAL_EXP_PERCENT" NVARCHAR2(50),                                             
	"TOTAL_EXP_NUMBER" NVARCHAR2(50),                                              
	"TOTAL_EXP_VALUE" NVARCHAR2(50),                                               
	"TOTAL_EXP_SD" NVARCHAR2(50),                                                  
	"TOTAL_EXP_UNIT" NVARCHAR2(100),                                               
	"GLC_CONTROL_PERCENT" NVARCHAR2(250),                                          
	"GLC_MOLECULAR_CHANGE" NVARCHAR2(250),                                         
	"GLC_TYPE" NVARCHAR2(50),                                                      
	"GLC_PERCENT" NVARCHAR2(100),                                                  
	"GLC_NUMBER" NVARCHAR2(100),                                                   
	"PTM_REGION" NVARCHAR2(250),                                                   
	"PTM_TYPE" NVARCHAR2(250),                                                     
	"PTM_CHANGE" NVARCHAR2(250),                                                   
	"LOH_LOCI" NVARCHAR2(250),                                                     
	"MUTATION_TYPE" NVARCHAR2(250),                                                
	"MUTATION_CHANGE" NVARCHAR2(250),                                              
	"MUTATION_SITES" NVARCHAR2(250),                                               
	"EPIGENETIC_REGION" NVARCHAR2(250),                                            
	"EPIGENETIC_TYPE" NVARCHAR2(250),                                              
	 CONSTRAINT "BIO_LIT_ALT_DATA_PK" PRIMARY KEY ("BIO_LIT_ALT_DATA_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_LIT_ALT_REF_FK" FOREIGN KEY ("BIO_LIT_REF_DATA_ID")           
	  REFERENCES "BIOMART"."BIO_LIT_REF_DATA" ("BIO_LIT_REF_DATA_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_AMD_DATA"                                     
   (	"BIO_LIT_AMD_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"BIO_LIT_ALT_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"ETL_ID" NVARCHAR2(50),                                                        
	"MOLECULE" NVARCHAR2(50),                                                      
	"MOLECULE_TYPE" NVARCHAR2(50),                                                 
	"TOTAL_EXP_PERCENT" NVARCHAR2(50),                                             
	"TOTAL_EXP_NUMBER" NVARCHAR2(100),                                             
	"TOTAL_EXP_VALUE" NVARCHAR2(100),                                              
	"TOTAL_EXP_SD" NVARCHAR2(50),                                                  
	"TOTAL_EXP_UNIT" NVARCHAR2(50),                                                
	"OVER_EXP_PERCENT" NVARCHAR2(50),                                              
	"OVER_EXP_NUMBER" NVARCHAR2(100),                                              
	"OVER_EXP_VALUE" NVARCHAR2(100),                                               
	"OVER_EXP_SD" NVARCHAR2(50),                                                   
	"OVER_EXP_UNIT" NVARCHAR2(50),                                                 
	"CO_EXP_PERCENT" NVARCHAR2(50),                                                
	"CO_EXP_NUMBER" NVARCHAR2(100),                                                
	"CO_EXP_VALUE" NVARCHAR2(100),                                                 
	"CO_EXP_SD" NVARCHAR2(50),                                                     
	"CO_EXP_UNIT" NVARCHAR2(50),                                                   
	"MUTATION_TYPE" NVARCHAR2(50),                                                 
	"MUTATION_SITES" NVARCHAR2(50),                                                
	"MUTATION_CHANGE" NVARCHAR2(50),                                               
	"MUTATION_PERCENT" NVARCHAR2(50),                                              
	"MUTATION_NUMBER" NVARCHAR2(100),                                              
	"TARGET_EXP_PERCENT" NVARCHAR2(50),                                            
	"TARGET_EXP_NUMBER" NVARCHAR2(100),                                            
	"TARGET_EXP_VALUE" NVARCHAR2(100),                                             
	"TARGET_EXP_SD" NVARCHAR2(50),                                                 
	"TARGET_EXP_UNIT" NVARCHAR2(50),                                               
	"TARGET_OVER_EXP_PERCENT" NVARCHAR2(50),                                       
	"TARGET_OVER_EXP_NUMBER" NVARCHAR2(100),                                       
	"TARGET_OVER_EXP_VALUE" NVARCHAR2(100),                                        
	"TARGET_OVER_EXP_SD" NVARCHAR2(50),                                            
	"TARGET_OVER_EXP_UNIT" NVARCHAR2(50),                                          
	"TECHNIQUES" NVARCHAR2(250),                                                   
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	 CONSTRAINT "BIO_LIT_AMD_DATA_PK" PRIMARY KEY ("BIO_LIT_AMD_DATA_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_LIT_AMD_ALT_FK" FOREIGN KEY ("BIO_LIT_ALT_DATA_ID")           
	  REFERENCES "BIOMART"."BIO_LIT_ALT_DATA" ("BIO_LIT_ALT_DATA_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_INH_DATA"                                     
   (	"BIO_LIT_INH_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"BIO_LIT_REF_DATA_ID" NUMBER(18,0) NOT NULL DISABLE,                           
	"ETL_ID" NVARCHAR2(50),                                                        
	"TRIAL_TYPE" NVARCHAR2(250),                                                   
	"TRIAL_PHASE" NVARCHAR2(250),                                                  
	"TRIAL_STATUS" NVARCHAR2(250),                                                 
	"TRIAL_EXPERIMENTAL_MODEL" NVARCHAR2(250),                                     
	"TRIAL_TISSUE" NVARCHAR2(250),                                                 
	"TRIAL_BODY_SUBSTANCE" NVARCHAR2(250),                                         
	"TRIAL_DESCRIPTION" NVARCHAR2(1000),                                           
	"TRIAL_DESIGNS" NVARCHAR2(250),                                                
	"TRIAL_CELL_LINE" NVARCHAR2(250),                                              
	"TRIAL_CELL_TYPE" NVARCHAR2(250),                                              
	"TRIAL_PATIENTS_NUMBER" NVARCHAR2(100),                                        
	"TRIAL_INCLUSION_CRITERIA" NVARCHAR2(2000),                                    
	"INHIBITOR" NVARCHAR2(250),                                                    
	"INHIBITOR_STANDARD_NAME" NVARCHAR2(250),                                      
	"CASID" NVARCHAR2(250),                                                        
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	"CONCENTRATION" NVARCHAR2(250),                                                
	"TIME_EXPOSURE" NVARCHAR2(500),                                                
	"ADMINISTRATION" NVARCHAR2(250),                                               
	"TREATMENT" NVARCHAR2(2000),                                                   
	"TECHNIQUES" NVARCHAR2(1000),                                                  
	"EFFECT_MOLECULAR" NVARCHAR2(250),                                             
	"EFFECT_PERCENT" NVARCHAR2(250),                                               
	"EFFECT_NUMBER" NVARCHAR2(50),                                                 
	"EFFECT_VALUE" NVARCHAR2(250),                                                 
	"EFFECT_SD" NVARCHAR2(250),                                                    
	"EFFECT_UNIT" NVARCHAR2(250),                                                  
	"EFFECT_RESPONSE_RATE" NVARCHAR2(250),                                         
	"EFFECT_DOWNSTREAM" NVARCHAR2(2000),                                           
	"EFFECT_BENEFICIAL" NVARCHAR2(2000),                                           
	"EFFECT_ADVERSE" NVARCHAR2(2000),                                              
	"EFFECT_DESCRIPTION" NVARCHAR2(2000),                                          
	"EFFECT_PHARMACOS" NVARCHAR2(2000),                                            
	"EFFECT_POTENTIALS" NVARCHAR2(2000),                                           
	 CONSTRAINT "BIO_LIT_INH_DATA_PK" PRIMARY KEY ("BIO_LIT_INH_DATA_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_LIT_INH_REF_FK" FOREIGN KEY ("BIO_LIT_REF_DATA_ID")           
	  REFERENCES "BIOMART"."BIO_LIT_REF_DATA" ("BIO_LIT_REF_DATA_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_INT_DATA"                                     
   (	"BIO_LIT_INT_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"BIO_LIT_REF_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"IN_VIVO_MODEL_ID" NUMBER(18,0),                                               
	"IN_VITRO_MODEL_ID" NUMBER(18,0),                                              
	"ETL_ID" NVARCHAR2(50),                                                        
	"SOURCE_COMPONENT" NVARCHAR2(100),                                             
	"SOURCE_GENE_ID" NVARCHAR2(50),                                                
	"TARGET_COMPONENT" NVARCHAR2(100),                                             
	"TARGET_GENE_ID" NVARCHAR2(50),                                                
	"INTERACTION_MODE" NVARCHAR2(250),                                             
	"REGULATION" NVARCHAR2(1000),                                                  
	"MECHANISM" NVARCHAR2(250),                                                    
	"EFFECT" NVARCHAR2(500),                                                       
	"LOCALIZATION" NVARCHAR2(500),                                                 
	"REGION" NVARCHAR2(250),                                                       
	"TECHNIQUES" NVARCHAR2(1000),                                                  
	 CONSTRAINT "BIO_LIT_INT_DATA_PK" PRIMARY KEY ("BIO_LIT_INT_DATA_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_LIT_INT_REF_FK" FOREIGN KEY ("BIO_LIT_REF_DATA_ID")           
	  REFERENCES "BIOMART"."BIO_LIT_REF_DATA" ("BIO_LIT_REF_DATA_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_INT_MODEL_MV"                                 
   (	"BIO_LIT_INT_DATA_ID" NUMBER(18,0),                                        
	"EXPERIMENTAL_MODEL" NVARCHAR2(250)                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_MODEL_DATA"                                   
   (	"BIO_LIT_MODEL_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                      
	"ETL_ID" NVARCHAR2(50),                                                        
	"MODEL_TYPE" NVARCHAR2(50),                                                    
	"DESCRIPTION" NVARCHAR2(1000),                                                 
	"STIMULATION" NVARCHAR2(1000),                                                 
	"CONTROL_CHALLENGE" NVARCHAR2(500),                                            
	"CHALLENGE" NVARCHAR2(1000),                                                   
	"SENTIZATION" NVARCHAR2(1000),                                                 
	"ZYGOSITY" NVARCHAR2(250),                                                     
	"EXPERIMENTAL_MODEL" NVARCHAR2(250),                                           
	"ANIMAL_WILD_TYPE" NVARCHAR2(250),                                             
	"TISSUE" NVARCHAR2(250),                                                       
	"CELL_TYPE" NVARCHAR2(250),                                                    
	"CELL_LINE" NVARCHAR2(250),                                                    
	"BODY_SUBSTANCE" NVARCHAR2(250),                                               
	"COMPONENT" NVARCHAR2(250),                                                    
	"GENE_ID" NVARCHAR2(250),                                                      
	 CONSTRAINT "BIO_LIT_MODEL_DATA_PK" PRIMARY KEY ("BIO_LIT_MODEL_DATA_ID")      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_PE_DATA"                                      
   (	"BIO_LIT_PE_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                         
	"BIO_LIT_REF_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"IN_VIVO_MODEL_ID" NUMBER(18,0),                                               
	"IN_VITRO_MODEL_ID" NUMBER(18,0),                                              
	"ETL_ID" NVARCHAR2(50),                                                        
	"DESCRIPTION" NVARCHAR2(2000),                                                 
	 CONSTRAINT "BIO_LIT_PE_DATA_PK" PRIMARY KEY ("BIO_LIT_PE_DATA_ID")            
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_LIT_PE_REF_FK" FOREIGN KEY ("BIO_LIT_REF_DATA_ID")            
	  REFERENCES "BIOMART"."BIO_LIT_REF_DATA" ("BIO_LIT_REF_DATA_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_REF_DATA"                                     
   (	"BIO_LIT_REF_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"ETL_ID" NVARCHAR2(50),                                                        
	"COMPONENT" NVARCHAR2(100),                                                    
	"COMPONENT_CLASS" NVARCHAR2(250),                                              
	"GENE_ID" NVARCHAR2(50),                                                       
	"MOLECULE_TYPE" NVARCHAR2(50),                                                 
	"VARIANT" NVARCHAR2(250),                                                      
	"REFERENCE_TYPE" NVARCHAR2(50),                                                
	"REFERENCE_ID" NVARCHAR2(250),                                                 
	"REFERENCE_TITLE" NVARCHAR2(2000),                                             
	"BACK_REFERENCES" NVARCHAR2(1000),                                             
	"STUDY_TYPE" NVARCHAR2(250),                                                   
	"DISEASE" NVARCHAR2(250),                                                      
	"DISEASE_ICD10" NVARCHAR2(250),                                                
	"DISEASE_MESH" NVARCHAR2(250),                                                 
	"DISEASE_SITE" NVARCHAR2(250),                                                 
	"DISEASE_STAGE" NVARCHAR2(250),                                                
	"DISEASE_GRADE" NVARCHAR2(250),                                                
	"DISEASE_TYPES" NVARCHAR2(250),                                                
	"DISEASE_DESCRIPTION" NVARCHAR2(1000),                                         
	"PHYSIOLOGY" NVARCHAR2(250),                                                   
	"STAT_CLINICAL" NVARCHAR2(500),                                                
	"STAT_CLINICAL_CORRELATION" NVARCHAR2(250),                                    
	"STAT_TESTS" NVARCHAR2(500),                                                   
	"STAT_COEFFICIENT" NVARCHAR2(500),                                             
	"STAT_P_VALUE" NVARCHAR2(100),                                                 
	"STAT_DESCRIPTION" NVARCHAR2(1000),                                            
	 CONSTRAINT "BIO_LIT_REF_DATA_PK" PRIMARY KEY ("BIO_LIT_REF_DATA_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_LIT_SUM_DATA"                                     
   (	"BIO_LIT_SUM_DATA_ID" NUMBER(18,0) NOT NULL ENABLE,                        
	"ETL_ID" NVARCHAR2(50),                                                        
	"DISEASE_SITE" NVARCHAR2(250),                                                 
	"TARGET" NVARCHAR2(50),                                                        
	"VARIANT" NVARCHAR2(50),                                                       
	"DATA_TYPE" NVARCHAR2(50),                                                     
	"ALTERATION_TYPE" NVARCHAR2(100),                                              
	"TOTAL_FREQUENCY" NVARCHAR2(50),                                               
	"TOTAL_AFFECTED_CASES" NVARCHAR2(50),                                          
	"SUMMARY" NVARCHAR2(1000),                                                     
	 CONSTRAINT "BIO_LIT_SUM_DATA_PK" PRIMARY KEY ("BIO_LIT_SUM_DATA_ID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_MARKER"                                           
   (	"BIO_MARKER_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"BIO_MARKER_NAME" NVARCHAR2(200),                                              
	"BIO_MARKER_DESCRIPTION" NVARCHAR2(1000),                                      
	"ORGANISM" NVARCHAR2(200),                                                     
	"PRIMARY_SOURCE_CODE" NVARCHAR2(200),                                          
	"PRIMARY_EXTERNAL_ID" NVARCHAR2(200),                                          
	"BIO_MARKER_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                              
	 UNIQUE ("ORGANISM", "PRIMARY_EXTERNAL_ID")                                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 6291456 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE,                                                 
	 CONSTRAINT "BIOMARKER_PK" PRIMARY KEY ("BIO_MARKER_ID")                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 2097152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS BASIC NOLOGGING         
  STORAGE(INITIAL 10485760 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645      
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_MARKER_CORREL_MV"                                 
   (	"BIO_MARKER_ID" NUMBER(18,0),                                              
	"ASSO_BIO_MARKER_ID" NUMBER(18,0),                                             
	"CORREL_TYPE" VARCHAR2(15),                                                    
	"MV_ID" NUMBER                                                                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 4194304 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645       
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  CACHE PARALLEL 2                                                              
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_MARKER_EXP_ANALYSIS_MV"                           
   (	"BIO_MARKER_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE,                          
	"T1.BIO_ASSAY_ANALYSIS_ID*100" NUMBER                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_OBSERVATION"                                      
   (	"BIO_OBSERVATION_ID" NUMBER(18,0),                                         
	"OBS_NAME" NVARCHAR2(200) NOT NULL ENABLE,                                     
	"OBS_CODE" NVARCHAR2(50),                                                      
	"OBS_DESCR" NVARCHAR2(1000),                                                   
	"OBS_TYPE" NVARCHAR2(20),                                                      
	"OBS_CODE_SOURCE" NVARCHAR2(20),                                               
	"ETL_ID" VARCHAR2(50),                                                         
	 CONSTRAINT "OBSERVATIONDIM_PK" PRIMARY KEY ("BIO_OBSERVATION_ID")             
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_PATIENT"                                          
   (	"BIO_PATIENT_ID" NUMBER(18,0) NOT NULL ENABLE,                             
	"FIRST_NAME" NVARCHAR2(200),                                                   
	"LAST_NAME" NVARCHAR2(200),                                                    
	"MIDDLE_NAME" NVARCHAR2(200),                                                  
	"BIRTH_DATE" DATE,                                                             
	"BIRTH_DATE_ORIG" NVARCHAR2(200),                                              
	"GENDER_CODE" NVARCHAR2(200),                                                  
	"RACE_CODE" NVARCHAR2(200),                                                    
	"ETHNIC_GROUP_CODE" NVARCHAR2(200),                                            
	"ADDRESS_ZIP_CODE" NVARCHAR2(200),                                             
	"COUNTRY_CODE" NVARCHAR2(200),                                                 
	"INFORMED_CONSENT_CODE" NVARCHAR2(200),                                        
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_CLINICAL_TRIAL_P_GROUP_ID" NUMBER(18,0),                                  
	 CONSTRAINT "BIO_PATIENT_PK" PRIMARY KEY ("BIO_PATIENT_ID")                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_PATIENT_BIO_SUBJECT_FK" FOREIGN KEY ("BIO_PATIENT_ID")        
	  REFERENCES "BIOMART"."BIO_SUBJECT" ("BIO_SUBJECT_ID") ENABLE,                
	 CONSTRAINT "BIO_PATIENT_BIO_CLINIC_TRI_FK" FOREIGN KEY ("BIO_CLINICAL_TRIAL_P_
GROUP_ID")                                                                      
	  REFERENCES "BIOMART"."BIO_CLINC_TRIAL_PT_GROUP" ("BIO_CLINICAL_TRIAL_P_GROUP_
ID") ENABLE,                                                                    
	 CONSTRAINT "BIO_PATIENT_BIO_CLINICAL_TRIAL" FOREIGN KEY ("BIO_EXPERIMENT_ID") 
	  REFERENCES "BIOMART"."BIO_CLINICAL_TRIAL" ("BIO_EXPERIMENT_ID") ENABLE       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_PATIENT_EVENT"                                    
   (	"BIO_PATIENT_EVENT_ID" NUMBER(18,0) NOT NULL ENABLE,                       
	"BIO_PATIENT_ID" NUMBER(18,0) NOT NULL ENABLE,                                 
	"EVENT_CODE" NVARCHAR2(200),                                                   
	"EVENT_TYPE_CODE" NVARCHAR2(200),                                              
	"EVENT_DATE" DATE,                                                             
	"SITE" NVARCHAR2(400),                                                         
	"BIO_CLINIC_TRIAL_TIMEPOINT_ID" NUMBER(18,0) NOT NULL ENABLE,                  
	 CONSTRAINT "BIO_PATIENT_EVENT_PK" PRIMARY KEY ("BIO_PATIENT_EVENT_ID")        
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_PT_EVENT_BIO_TRL_TP_FK" FOREIGN KEY ("BIO_CLINIC_TRIAL_TIMEPOI
NT_ID")                                                                         
	  REFERENCES "BIOMART"."BIO_CLINC_TRIAL_TIME_PT" ("BIO_CLINC_TRIAL_TM_PT_ID") E
NABLE,                                                                          
	 CONSTRAINT "BIO_PT_EVENT_BIO_PT_FK" FOREIGN KEY ("BIO_PATIENT_ID")            
	  REFERENCES "BIOMART"."BIO_PATIENT" ("BIO_PATIENT_ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_PATIENT_EVENT_ATTR"                               
   (	"BIO_PATIENT_ATTR_CODE" NVARCHAR2(200) NOT NULL ENABLE,                    
	"ATTRIBUTE_TEXT_VALUE" NVARCHAR2(200),                                         
	"ATTRIBUTE_NUMERIC_VALUE" NVARCHAR2(200),                                      
	"BIO_CLINIC_TRIAL_ATTR_ID" NUMBER(18,0) NOT NULL ENABLE,                       
	"BIO_PATIENT_ATTRIBUTE_ID" NUMBER(18,0) NOT NULL ENABLE,                       
	"BIO_PATIENT_EVENT_ID" NUMBER(18,0) NOT NULL ENABLE,                           
	 CONSTRAINT "BIO_PATIENT_ATTRIBUTE_PK" PRIMARY KEY ("BIO_PATIENT_ATTRIBUTE_ID")
                                                                                
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_PT_ATTR_TRL_ATTR_FK" FOREIGN KEY ("BIO_CLINIC_TRIAL_ATTR_ID") 
	  REFERENCES "BIOMART"."BIO_CLINC_TRIAL_ATTR" ("BIO_CLINC_TRIAL_ATTR_ID") ENABL
E,                                                                              
	 CONSTRAINT "BIO_PT_EVENT_ATTR_EVT_FK" FOREIGN KEY ("BIO_PATIENT_EVENT_ID")    
	  REFERENCES "BIOMART"."BIO_PATIENT_EVENT" ("BIO_PATIENT_EVENT_ID") ENABLE     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_SAMPLE"                                           
   (	"BIO_SAMPLE_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"BIO_SAMPLE_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                              
	"CHARACTERISTICS" NVARCHAR2(1000),                                             
	"SOURCE_CODE" NVARCHAR2(200),                                                  
	"EXPERIMENT_ID" NUMBER(18,0),                                                  
	"BIO_SUBJECT_ID" NUMBER(18,0),                                                 
	"SOURCE" NVARCHAR2(200),                                                       
	"BIO_BANK_ID" NUMBER(18,0),                                                    
	"BIO_PATIENT_EVENT_ID" NUMBER(18,0),                                           
	"BIO_CELL_LINE_ID" NUMBER(18,0),                                               
	"BIO_SAMPLE_NAME" NVARCHAR2(100),                                              
	 CONSTRAINT "BIOSAMPLE_PK" PRIMARY KEY ("BIO_SAMPLE_ID")                       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE,                                                    
	 CONSTRAINT "BIO_SAMPLE_CL_FK" FOREIGN KEY ("BIO_CELL_LINE_ID")                
	  REFERENCES "BIOMART"."BIO_CELL_LINE" ("BIO_CELL_LINE_ID") ENABLE,            
	 CONSTRAINT "BIO_SAMPLE_PT_EVT_FK" FOREIGN KEY ("BIO_PATIENT_EVENT_ID")        
	  REFERENCES "BIOMART"."BIO_PATIENT_EVENT" ("BIO_PATIENT_EVENT_ID") ENABLE,    
	 CONSTRAINT "BIO_SAMPLE_BIO_SUBJECT_FK" FOREIGN KEY ("BIO_SUBJECT_ID")         
	  REFERENCES "BIOMART"."BIO_SUBJECT" ("BIO_SUBJECT_ID") ENABLE                 
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_STATS_EXP_MARKER"                                 
   (	"BIO_MARKER_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_STATS_EXP_MARKER_ID" NUMBER(18,0),                                        
	 CONSTRAINT "BIO_S_E_M_PK" PRIMARY KEY ("BIO_MARKER_ID", "BIO_EXPERIMENT_ID")  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_SUBJECT"                                          
   (	"BIO_SUBJECT_ID" NUMBER(18,0) NOT NULL ENABLE,                             
	"SITE_SUBJECT_ID" NUMBER(18,0),                                                
	"SOURCE" NVARCHAR2(200),                                                       
	"SOURCE_CODE" NVARCHAR2(200),                                                  
	"STATUS" NVARCHAR2(200),                                                       
	"ORGANISM" NVARCHAR2(200),                                                     
	"BIO_SUBJECT_TYPE" NVARCHAR2(200) NOT NULL ENABLE,                             
	 CONSTRAINT "BIO_SUBJECT_PK" PRIMARY KEY ("BIO_SUBJECT_ID")                    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "INDX"  ENABLE                                                     
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING             
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."BIO_TAXONOMY"                                         
   (	"BIO_TAXONOMY_ID" NUMBER(18,0) NOT NULL ENABLE,                            
	"TAXON_NAME" NVARCHAR2(200) NOT NULL ENABLE,                                   
	"TAXON_LABEL" NVARCHAR2(200) NOT NULL ENABLE,                                  
	"NCBI_TAX_ID" NVARCHAR2(200),                                                  
	 CONSTRAINT "BIO_TAXON_PK" PRIMARY KEY ("BIO_TAXONOMY_ID")                     
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"  ENABLE                                                  
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD2_CLIN_INHIB_EFFECT"                               
   (	"CTD_CIE_SEQ" NUMBER,                                                      
	"CTD_STUDY_ID" NUMBER,                                                         
	"EVENT_DESCRIPTION_NAME" VARCHAR2(4000),                                       
	"EVENT_DEFINITION_NAME" VARCHAR2(4000),                                        
	"ADVERSE_EFFECT_NAME" VARCHAR2(4000),                                          
	"SIGNAL_EFFECT_NAME" VARCHAR2(4000),                                           
	"PHARMACO_PARAMETER_NAME" VARCHAR2(500),                                       
	"DISCONTINUATION_RATE_VALUE" VARCHAR2(250),                                    
	"BENEFICIAL_EFFECT_NAME" VARCHAR2(4000),                                       
	"DRUG_EFFECT" VARCHAR2(4000),                                                  
	"CLINICAL_VARIABLE_NAME" VARCHAR2(250),                                        
	"QP_SM_PERCENTAGE_CHANGE" VARCHAR2(250),                                       
	"QP_SM_ABSOLUTE_CHANGE" VARCHAR2(250),                                         
	"QP_SM_RATE_OF_CHANGE" VARCHAR2(250),                                          
	"QP_SM_TREATMENT_PERIOD" VARCHAR2(250),                                        
	"QP_SM_GROUP_CHANGE" VARCHAR2(250),                                            
	"QP_SM_P_VALUE" VARCHAR2(250),                                                 
	"CE_SM_NO" VARCHAR2(250),                                                      
	"CE_SM_EVENT_RATE" VARCHAR2(250),                                              
	"CE_TIME_TO_EVENT" VARCHAR2(250),                                              
	"CE_REDUCTION" VARCHAR2(250),                                                  
	"CE_P_VALUE" VARCHAR2(250),                                                    
	"CLINICAL_CORRELATION" VARCHAR2(2000),                                         
	"COEFFICIENT_VALUE" VARCHAR2(250),                                             
	"STATISTICS_P_VALUE" VARCHAR2(250),                                            
	"STATISTICS_DESCRIPTION" VARCHAR2(4000),                                       
	"PRIMARY_ENDPOINT_TYPE" VARCHAR2(250),                                         
	"PRIMARY_ENDPOINT_DEFINITION" VARCHAR2(4000),                                  
	"PRIMARY_ENDPOINT_TEST_NAME" VARCHAR2(2000),                                   
	"PRIMARY_ENDPOINT_TIME_PERIOD" VARCHAR2(2000),                                 
	"PRIMARY_ENDPOINT_CHANGE" VARCHAR2(2000),                                      
	"PRIMARY_ENDPOINT_P_VALUE" VARCHAR2(2000),                                     
	"SECONDARY_ENDPOINT_TYPE" VARCHAR2(2000),                                      
	"SECONDARY_ENDPOINT_DEFINITION" VARCHAR2(4000),                                
	"SECONDARY_ENDPOINT_TEST_NAME" VARCHAR2(2000),                                 
	"SECONDARY_ENDPOINT_TIME_PERIOD" VARCHAR2(4000),                               
	"SECONDARY_ENDPOINT_CHANGE" VARCHAR2(4000),                                    
	"SECONDARY_ENDPOINT_P_VALUE" VARCHAR2(4000)                                    
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD2_DISEASE"                                         
   (	"CTD_DISEASE_SEQ" NUMBER,                                                  
	"CTD_STUDY_ID" NUMBER,                                                         
	"DISEASE_TYPE_NAME" VARCHAR2(500),                                             
	"DISEASE_COMMON_NAME" VARCHAR2(500),                                           
	"ICD10_NAME" VARCHAR2(250),                                                    
	"MESH_NAME" VARCHAR2(250),                                                     
	"STUDY_TYPE_NAME" VARCHAR2(2000),                                              
	"PHYSIOLOGY_NAME" VARCHAR2(500)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD2_INHIB_DETAILS"                                   
   (	"CTD_INHIB_SEQ" NUMBER,                                                    
	"CTD_STUDY_ID" NUMBER,                                                         
	"COMMON_NAME_NAME" VARCHAR2(500),                                              
	"STANDARD_NAME_NAME" VARCHAR2(500),                                            
	"EXPERIMENTAL_DETAIL_DOSE" VARCHAR2(4000),                                     
	"EXP_DETAIL_EXPOSURE_PERIOD" VARCHAR2(4000),                                   
	"EXP_DETAIL_TREATMENT_NAME" VARCHAR2(4000),                                    
	"EXP_DETAIL_ADMIN_ROUTE" VARCHAR2(4000),                                       
	"EXP_DETAIL_DESCRIPTION" VARCHAR2(4000),                                       
	"EXP_DETAIL_PLACEBO" VARCHAR2(250),                                            
	"COMPARATOR_NAME_NAME" VARCHAR2(250),                                          
	"COMP_TREATMENT_NAME" VARCHAR2(4000),                                          
	"COMP_ADMIN_ROUTE" VARCHAR2(4000),                                             
	"COMP_DOSE" VARCHAR2(2000),                                                    
	"COMP_EXPOSURE_PERIOD" VARCHAR2(2000)                                          
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD2_STUDY"                                           
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"REF_ARTICLE_PROTOCOL_ID" VARCHAR2(1000),                                      
	"REFERENCE_ID" NUMBER(9,0) NOT NULL ENABLE,                                    
	"PUBMED_ID" VARCHAR2(250),                                                     
	"PUBMED_TITLE" VARCHAR2(2000),                                                 
	"PROTOCOL_ID" VARCHAR2(1000),                                                  
	"PROTOCOL_TITLE" VARCHAR2(2000)                                                
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD2_TRIAL_DETAILS"                                   
   (	"CTD_TD_SEQ" NUMBER,                                                       
	"CTD_STUDY_ID" NUMBER,                                                         
	"CONTROL" VARCHAR2(2000),                                                      
	"BLINDING_PROCEDURE" VARCHAR2(2000),                                           
	"NO_OF_ARMS" VARCHAR2(2000),                                                   
	"SPONSOR" VARCHAR2(2000),                                                      
	"PATIENT_STUDIED" VARCHAR2(2000),                                              
	"SOURCE_TYPE" VARCHAR2(2000),                                                  
	"TRIAL_DESCRIPTION" VARCHAR2(4000),                                            
	"ARM_NAME" VARCHAR2(250),                                                      
	"PATIENT_STUDY" VARCHAR2(250),                                                 
	"CLASS_TYPE" VARCHAR2(250),                                                    
	"CLASS_VALUE" VARCHAR2(250),                                                   
	"ASTHMA_DURATION" VARCHAR2(250),                                               
	"REGION" VARCHAR2(250),                                                        
	"AGE" VARCHAR2(100),                                                           
	"GENDER" VARCHAR2(100),                                                        
	"MINOR_PARTICIPATION" VARCHAR2(100),                                           
	"SYMPTOM_SCORE" VARCHAR2(100),                                                 
	"RESCUE_MEDICATION" VARCHAR2(2000),                                            
	"THERAPEUTIC_INTERVENTION" VARCHAR2(255),                                      
	"SMOKERS" VARCHAR2(255),                                                       
	"FORMER_SMOKERS" VARCHAR2(255),                                                
	"NEVER_SMOKERS" VARCHAR2(255),                                                 
	"SMOKING_PACK_YEARS" VARCHAR2(255),                                            
	"PULM_PATH_NAME" VARCHAR2(255),                                                
	"PULM_PATH_PCT" VARCHAR2(50),                                                  
	"PULM_PATH_VALUE" VARCHAR2(50),                                                
	"PULM_PATH_METHOD" VARCHAR2(255),                                              
	"ALLOW_MED_THERAPY_OCS" VARCHAR2(1000),                                        
	"ALLOW_MED_THERAPY_ICS" VARCHAR2(1000),                                        
	"ALLOW_MED_THERAPY_LABA" VARCHAR2(1000),                                       
	"ALLOW_MED_THERAPY_LTRA" VARCHAR2(1000),                                       
	"ALLOW_MED_THERAPY_DESC" VARCHAR2(4000),                                       
	"ALLOW_MED_THERAPY_CORTSTER" VARCHAR2(1000),                                   
	"ALLOW_MED_THERAPY_IMMUNO" VARCHAR2(1000),                                     
	"ALLOW_MED_THERAPY_CYTO" VARCHAR2(1000),                                       
	"ALLOW_MED_TREAT_OCS" VARCHAR2(1000),                                          
	"ALLOW_MED_TREAT_ICS" VARCHAR2(1000),                                          
	"ALLOW_MED_TREAT_LABA" VARCHAR2(1000),                                         
	"ALLOW_MED_TREAT_LTRA" VARCHAR2(1000),                                         
	"ALLOW_MED_TREAT_DESC" VARCHAR2(4000),                                         
	"ALLOW_MED_TREAT_CORTSTER" VARCHAR2(1000),                                     
	"ALLOW_MED_TREAT_IMMUNO" VARCHAR2(1000),                                       
	"ALLOW_MED_TREAT_CYTO" VARCHAR2(1000),                                         
	"PAT_CHAR_BASE_CLIN_VAR" VARCHAR2(500),                                        
	"PAT_CHAR_BASE_CLIN_VAR_PCT" VARCHAR2(250),                                    
	"PAT_CHAR_BASE_CLIN_VAR_VALUE" VARCHAR2(250),                                  
	"BIOMARKER_NAME_NAME" VARCHAR2(250),                                           
	"PAT_CHAR_BIOMARKER_PCT" VARCHAR2(250),                                        
	"PAT_CHAR_BIOMARKER_VALUE" VARCHAR2(250),                                      
	"PAT_CHAR_CELLINFO_NAME" VARCHAR2(250),                                        
	"PAT_CHAR_CELLINFO_TYPE" VARCHAR2(250),                                        
	"PAT_CHAR_CELLINFO_COUNT" VARCHAR2(250),                                       
	"PAT_CHAR_PRIORMED_NAME" VARCHAR2(250),                                        
	"PAT_CHAR_PRIORMED_PCT" VARCHAR2(500),                                         
	"PAT_CHAR_PRIORMED_DOSE" VARCHAR2(250),                                        
	"DISEASE_PHENOTYPE_NAME" VARCHAR2(1000),                                       
	"DISEASE_SEVERITY_NAME" VARCHAR2(500),                                         
	"INCL_AGE" VARCHAR2(2000),                                                     
	"INCL_DIFFICULT_TO_TREAT" VARCHAR2(2000),                                      
	"INCL_DISEASE_DIAGNOSIS" VARCHAR2(2000),                                       
	"INCL_STEROID_DOSE" VARCHAR2(2000),                                            
	"INCL_LABA" VARCHAR2(2000),                                                    
	"INCL_OCS" VARCHAR2(2000),                                                     
	"INCL_XOLAIR" VARCHAR2(2000),                                                  
	"INCL_LTRA_INHIBITOR" VARCHAR2(2000),                                          
	"INCL_FEV1" VARCHAR2(2000),                                                    
	"INCL_FEV1_REVERSIBILITY" VARCHAR2(2000),                                      
	"INCL_SMOKING" VARCHAR2(2000),                                                 
	"INCL_TLC" VARCHAR2(2000),                                                     
	"INCL_FVC" VARCHAR2(2000),                                                     
	"INCL_DLCO" VARCHAR2(2000),                                                    
	"INCL_SGRQ" VARCHAR2(2000),                                                    
	"INCL_HRCT" VARCHAR2(2000),                                                    
	"INCL_BIOPSY" VARCHAR2(2000),                                                  
	"INCL_DYPSNEA_ON_EXERTION" VARCHAR2(2000),                                     
	"INCL_CONCOMITANT_MED" VARCHAR2(2000),                                         
	"INCL_FORMER_SMOKERS" VARCHAR2(2000),                                          
	"INCL_NEVER_SMOKERS" VARCHAR2(2000),                                           
	"INCL_SMOKING_PACK_YEARS" VARCHAR2(2000),                                      
	"INCL_FEV_FVC" VARCHAR2(2000),                                                 
	"TRIAL_DES_MINIMAL_SYMPTOM" VARCHAR2(2000),                                    
	"TRIAL_DES_RESCUE_MED" VARCHAR2(4000),                                         
	"TRIAL_DES_EXCLUSION_CRITERIA" VARCHAR2(4000),                                 
	"TRIAL_DES_OPEN_LABEL_STATUS" VARCHAR2(250),                                   
	"TRIAL_DES_RANDOM_STATUS" VARCHAR2(250),                                       
	"TRIAL_DES_NATURE_OF_TRIAL" VARCHAR2(250),                                     
	"TRIAL_DES_BLINDED_STATUS" VARCHAR2(250),                                      
	"TRIAL_DES_RUN_IN_PERIOD" VARCHAR2(2000),                                      
	"TRIAL_DES_TREATMENT" VARCHAR2(2000),                                          
	"TRIAL_DES_WASHOUT_PERIOD" VARCHAR2(2000),                                     
	"TRIAL_STATUS_NAME" VARCHAR2(2000),                                            
	"TRIAL_PHASE_NAME" VARCHAR2(2000)                                              
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART"."CTD_ALLOWED_MEDS_TREATMENT"                           
   (	"CTD_STUDY_ID" NUMBER,                                                     
	"TRTMT_OCS" VARCHAR2(4000),                                                    
	"TRTMT_ICS" VARCHAR2(4000),                                                    
	"TRTMT_LABA" VARCHAR2(4000),                                                   
	"TRTMT_LTRA" VARCHAR2(4000),                                                   
	"TRTMT_CORTICOSTEROIDS" VARCHAR2(4000),                                        
	"TRTMT_ANTI_FIBROTICS" VARCHAR2(4000),                                         
	"TRTMT_IMMUNOSUPPRESSIVE" VARCHAR2(4000),                                      
	"TRTMT_CYTOTOXIC" VARCHAR2(4000)                                               
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."LOGON_TRIGGER"                           
AFTER LOGON ON DATABASE                                                         
DECLARE                                                                         
v_user_identifier varchar2(64);                                                 
BEGIN                                                                           
SELECT SYS_CONTEXT('USERENV', 'OS_USER')                                        
       ||':'||                                                                  
       SYS_CONTEXT('USERENV', 'IP_ADDRESS')                                     
  INTO v_user_identifier                                                        
  FROM dual;                                                                    
DBMS_SESSION.SET_IDENTIFIER(v_user_identifier);                                 
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."LOGON_TRIGGER" ENABLE                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRIG_CLINICAL_TRIAL_DESIGN_ID "          
before insert on "CTD_FULL"                                                     
for each row begin                                                              
  if inserting then                                                             
    if :NEW."CLINICAL_TRIAL_DESIGN_ID" is null then                             
      select SEQ_CLINICAL_TRIAL_DESIGN_ID.nextval into :NEW."CLINICAL_TRIAL_DESI
GN_ID" from dual;                                                               
    end if;                                                                     
  end if;                                                                       
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRIG_CLINICAL_TRIAL_DESIGN_ID " ENABLE                 
BEGIN                                                                           
  DBMS_DDL.SET_TRIGGER_FIRING_PROPERTY('"BIOMART"','"TRIG_CLINICAL_TRIAL_DESIGN_
ID "',FALSE) ;                                                                  
END;                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_CTD2_TRIAL_DETAILS"                  
BEFORE INSERT ON CTD2_TRIAL_DETAILS                                             
 FOR EACH ROW BEGIN                                                             
 IF INSERTING THEN                                                              
	IF :NEW."CTD_TD_SEQ" IS NULL THEN                                              
		SELECT SEQ_CLINICAL_TRIAL_DESIGN_ID.NEXTVAL INTO :NEW."CTD_TD_SEQ" FROM DUAL; 
                                                                                
	END IF;                                                                        
 END IF;                                                                        
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_CTD2_TRIAL_DETAILS" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_CTD2_STUDY_ID"                       
BEFORE INSERT ON CTD2_STUDY                                                     
 FOR EACH ROW BEGIN                                                             
 IF INSERTING THEN                                                              
	IF :NEW."CTD_STUDY_ID" IS NULL THEN                                            
		SELECT SEQ_CLINICAL_TRIAL_DESIGN_ID.NEXTVAL INTO :NEW."CTD_STUDY_ID" FROM DUAL
;                                                                               
	END IF;                                                                        
 END IF;                                                                        
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_CTD2_STUDY_ID" ENABLE                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_CTD2_INHIB_DETAILS"                  
BEFORE INSERT ON CTD2_INHIB_DETAILS                                             
 FOR EACH ROW BEGIN                                                             
 IF INSERTING THEN                                                              
	IF :NEW."CTD_INHIB_SEQ" IS NULL THEN                                           
		SELECT SEQ_CLINICAL_TRIAL_DESIGN_ID.NEXTVAL INTO :NEW."CTD_INHIB_SEQ" FROM DUA
L;                                                                              
	END IF;                                                                        
 END IF;                                                                        
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_CTD2_INHIB_DETAILS" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_CTD2_DISEASE"                        
BEFORE INSERT ON CTD2_DISEASE                                                   
 FOR EACH ROW BEGIN                                                             
 IF INSERTING THEN                                                              
	IF :NEW."CTD_DISEASE_SEQ" IS NULL THEN                                         
		SELECT SEQ_CLINICAL_TRIAL_DESIGN_ID.NEXTVAL INTO :NEW."CTD_DISEASE_SEQ" FROM D
UAL;                                                                            
	END IF;                                                                        
 END IF;                                                                        
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_CTD2_DISEASE" ENABLE                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_CTD2_CLIN_INHIB_EFFECT"              
BEFORE INSERT ON CTD2_CLIN_INHIB_EFFECT                                         
 FOR EACH ROW BEGIN                                                             
 IF INSERTING THEN                                                              
	IF :NEW."CTD_CIE_SEQ" IS NULL THEN                                             
		SELECT SEQ_CLINICAL_TRIAL_DESIGN_ID.NEXTVAL INTO :NEW."CTD_CIE_SEQ" FROM DUAL;
                                                                                
	END IF;                                                                        
 END IF;                                                                        
END;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_CTD2_CLIN_INHIB_EFFECT" ENABLE                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_TAXON_ID" before                 
  INSERT ON "BIO_TAXONOMY" FOR EACH row BEGIN IF inserting THEN IF :NEW."BIO_TAX
ONOMY_ID" IS NULL THEN                                                          
  SELECT SEQ_BIO_DATA_ID.nextval INTO :NEW."BIO_TAXONOMY_ID" FROM dual;         
END IF;                                                                         
END IF;                                                                         
END;                                                                            
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_TAXON_ID" ENABLE                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_SUBJECT_ID" before insert on "BIO
_SUBJECT"    for each row begin     if inserting then       if :NEW."BIO_SUBJECT
_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_SUBJECT
_ID" from dual;       end if;    end if; end;                                   
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_SUBJECT_ID" ENABLE                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_SAMPLE_ID" before insert on "BIO_
SAMPLE"    for each row begin     if inserting then       if :NEW."BIO_SAMPLE_ID
" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_SAMPLE_ID"
 from dual;       end if;    end if; end;                                       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_SAMPLE_ID" ENABLE                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_PT_EVT_ATTR_ID" before insert on 
"BIO_PATIENT_EVENT_ATTR"    for each row begin     if inserting then       if :N
EW."BIO_CLINIC_TRIAL_ATTRIBUTE_ID" is null then          select SEQ_BIO_DATA_ID.
nextval into :NEW."BIO_CLINIC_TRIAL_ATTRIBUTE_ID" from dual;       end if;    en
d if; end;                                                                      
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_PT_EVT_ATTR_ID" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_PATIENT_ID" before insert on "BIO
_PATIENT"    for each row begin     if inserting then       if :NEW."BIO_PATIENT
_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_PATIENT
_ID" from dual;       end if;    end if; end;                                   
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_PATIENT_ID" ENABLE                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_PATIENT_EVENT_ID" before insert o
n "BIO_PATIENT_EVENT"    for each row begin     if inserting then       if :NEW.
"BIO_PATIENT_EVENT_ID" is null then          select SEQ_BIO_DATA_ID.nextval into
 :NEW."BIO_PATIENT_EVENT_ID" from dual;       end if;    end if; end;           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_PATIENT_EVENT_ID" ENABLE                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_OBSERVATION_ID"                  
before insert on BIO_OBSERVATION                                                
for each row                                                                    
begin                                                                           
  if inserting then                                                             
     if :NEW.BIO_OBSERVATION_ID is null then                                    
        select SEQ_BIO_DATA_ID.nextval into :NEW.BIO_OBSERVATION_ID from dual;  
     end if;                                                                    
  end if;                                                                       
end;                                                                            
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_OBSERVATION_ID" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_MKR_CORREL_DESCR_ID" before inser
t on "BIO_DATA_CORREL_DESCR"    for each row                                    
begin     if inserting then       if :NEW."BIO_DATA_CORREL_DESCR_ID" is null the
n          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_DATA_CORREL_DESCR_ID" f
rom dual;       end if;    end if; end;                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_MKR_CORREL_DESCR_ID" ENABLE                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_MARKER_ID" before insert on "BIO_
MARKER"    for each row begin     if inserting then       if :NEW."BIO_MARKER_ID
" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_MARKER_ID"
 from dual;       end if;    end if; end;                                       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_MARKER_ID" ENABLE                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_SUM_DATA_ID"                 
before insert on "BIO_LIT_SUM_DATA"                                             
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_SUM_DATA_ID" is null then                               
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_SUM_DATA_ID" from du
al;                                                                             
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_SUM_DATA_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_REF_DATA_ID"                 
before insert on "BIO_LIT_REF_DATA"                                             
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_REF_DATA_ID" is null then                               
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_REF_DATA_ID" from du
al;                                                                             
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_REF_DATA_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_PE_DATA_ID"                  
before insert on "BIO_LIT_PE_DATA"                                              
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_PE_DATA_ID" is null then                                
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_PE_DATA_ID" from dua
l;                                                                              
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_PE_DATA_ID" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_MODEL_DATA_ID"               
before insert on "BIO_LIT_MODEL_DATA"                                           
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_MODEL_DATA_ID" is null then                             
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_MODEL_DATA_ID" from 
dual;                                                                           
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_MODEL_DATA_ID" ENABLE                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_INT_DATA_ID"                 
before insert on "BIO_LIT_INT_DATA"                                             
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_INT_DATA_ID" is null then                               
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_INT_DATA_ID" from du
al;                                                                             
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_INT_DATA_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_INH_DATA_ID"                 
before insert on "BIO_LIT_INH_DATA"                                             
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_INH_DATA_ID" is null then                               
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_INH_DATA_ID" from du
al;                                                                             
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_INH_DATA_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_AMD_DATA_ID"                 
before insert on "BIO_LIT_AMD_DATA"                                             
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_AMD_DATA_ID" is null then                               
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_AMD_DATA_ID" from du
al;                                                                             
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_AMD_DATA_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_ALT_DATA_ID"                 
before insert on "BIO_LIT_ALT_DATA"                                             
for each row                                                                    
begin                                                                           
     if inserting then                                                          
       if :NEW."BIO_LIT_ALT_DATA_ID" is null then                               
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_ALT_DATA_ID" from du
al;                                                                             
       end if;                                                                  
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_ALT_DATA_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_FILE_CONTENT_ID" before insert on
 "BIO_CONTENT"    for each row begin     if inserting then       if :NEW."BIO_FI
LE_CONTENT_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."B
IO_FILE_CONTENT_ID" from dual;       end if;    end if; end;                    
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_FILE_CONTENT_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_EXPERIMENT_ID" before insert on "
BIO_EXPERIMENT"    for each row begin     if inserting then       if :NEW."BIO_E
XPERIMENT_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BI
O_EXPERIMENT_ID" from dual;       end if;    end if; end;                       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_EXPERIMENT_ID" ENABLE                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_DISEASE_ID" before insert on "BIO
_DISEASE"    for each row begin     if inserting then       if :NEW."BIO_DISEASE
_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_DISEASE
_ID" from dual;       end if;    end if; end;                                   
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_DISEASE_ID" ENABLE                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_DATA_EXT_CODE_ID" before insert o
n "BIO_DATA_EXT_CODE"    for each row begin     if inserting then       if :NEW.
"BIO_DATA_EXT_CODE_ID" is null then          select SEQ_BIO_DATA_ID.nextval into
 :NEW."BIO_DATA_EXT_CODE_ID" from dual;       end if;    end if; end;           
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_DATA_EXT_CODE_ID" ENABLE                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_DATA_CORREL_ID" before insert on 
"BIO_DATA_CORRELATION"    for each row                                          
begin     if inserting then       if :NEW."BIO_DATA_CORREL_ID" is null then     
     select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_DATA_CORREL_ID" from dual;   
    end if;    end if; end;                                                     
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_DATA_CORREL_ID" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_DATA_ATTR_ID" before insert on "B
IO_DATA_ATTRIBUTE"    for each row begin     if inserting then       if :NEW."BI
O_DATA_ATTRIBUTE_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :
NEW."BIO_DATA_ATTRIBUTE_ID" from dual;       end if;    end if; end;            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_DATA_ATTR_ID" ENABLE                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CURATION_DATASET_ID" before inser
t on "BIO_CURATION_DATASET"    for each row begin     if inserting then       if
 :NEW."BIO_CURATION_DATASET_ID" is null then          select SEQ_BIO_DATA_ID.nex
tval into :NEW."BIO_CURATION_DATASET_ID" from dual;       end if;    end if; end
;                                                                               
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CURATION_DATASET_ID" ENABLE                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CONTENT_REPO_ID" before insert on
 "BIO_CONTENT_REPOSITORY"    for each row begin     if inserting then       if :
NEW."BIO_CONTENT_REPO_ID" is null then          select SEQ_BIO_DATA_ID.nextval i
nto :NEW."BIO_CONTENT_REPO_ID" from dual;       end if;    end if; end;         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CONTENT_REPO_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CONTENT_REF_ID" before insert on 
"BIO_CONTENT_REFERENCE"    for each row                                         
begin     if inserting then       if :NEW."BIO_CONTENT_REFERENCE_ID" is null the
n          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_CONTENT_REFERENCE_ID" f
rom dual;       end if;    end if; end;                                         
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CONTENT_REF_ID" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_COMPOUND_ID" before insert on "BI
O_COMPOUND"    for each row begin     if inserting then       if :NEW."BIO_COMPO
UND_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_COMP
OUND_ID" from dual;       end if;    end if; end;                               
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_COMPOUND_ID" ENABLE                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CL_TRL_TIME_PT_ID" before insert 
on "BIO_CLINC_TRIAL_TIME_PT"    for each row begin     if inserting then       i
f :NEW."BIO_CLINC_TRIAL_TM_PT_ID" is null then          select SEQ_BIO_DATA_ID.n
extval into :NEW."BIO_CLINC_TRIAL_TM_PT_ID" from dual;       end if;    end if; 
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CL_TRL_TIME_PT_ID" ENABLE                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CLN_TRL_ATTR_ID" before insert on
 "BIO_CLINC_TRIAL_ATTR"    for each row begin     if inserting then       if :NE
W."BIO_CLINC_TRIAL_ATTR_ID" is null then          select SEQ_BIO_DATA_ID.nextval
 into :NEW."BIO_CLINC_TRIAL_ATTR_ID" from dual;       end if;    end if; end;   
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CLN_TRL_ATTR_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CLIN_TRL_PT_GRP_ID" before insert
 on "BIO_CLINC_TRIAL_PT_GROUP"    for each row begin     if inserting then      
 if :NEW."BIO_CLINICAL_TRIAL_P_GROUP_ID" is null then          select SEQ_BIO_DA
TA_ID.nextval into :NEW."BIO_CLINICAL_TRIAL_P_GROUP_ID" from dual;       end if;
    end if; end;                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CLIN_TRL_PT_GRP_ID" ENABLE                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_CELL_LINE_ID" before insert on "B
IO_CELL_LINE"    for each row begin     if inserting then       if :NEW."BIO_CEL
L_LINE_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_C
ELL_LINE_ID" from dual;       end if;    end if; end;                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_CELL_LINE_ID" ENABLE                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASY_DT_STATS_ID" before insert on
 "BIO_ASY_DATA_STATS_ALL"    for each row begin     if inserting then       if :
NEW."BIO_ASSAY_DATA_STATS_ID" is null then          select SEQ_BIO_DATA_FACT_ID.
nextval into :NEW."BIO_ASSAY_DATA_STATS_ID" from dual;       end if;    end if; 
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASY_DT_STATS_ID" ENABLE                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASY_ANLSIS_DATA_IDX_ID"          
  before insert on "BIO_ASY_ANALYSIS_DATA_IDX"                                  
  for each row begin                                                            
  if inserting then                                                             
  if :NEW."BIO_ASY_ANALYSIS_DATA_IDX_ID" is null then                           
  select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ASY_ANALYSIS_DATA_IDX_ID" from d
ual;       end if;    end if; end;                                              
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASY_ANLSIS_DATA_IDX_ID" ENABLE                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASY_ANALYSIS_PLTFM_ID" before ins
ert on "BIO_ASY_ANALYSIS_PLTFM"    for each row begin     if inserting then     
  if :NEW."BIO_ASY_ANALYSIS_PLTFM_ID" is null then          select SEQ_BIO_DATA_
ID.nextval into :NEW."BIO_ASY_ANALYSIS_PLTFM_ID" from dual;       end if;    end
 if; end;                                                                       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASY_ANALYSIS_PLTFM_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASY_ANALYSIS_GWAS_ID"            
before insert on BIOMART.BIO_ASSAY_ANALYSIS_GWAS for each row                   
begin                                                                           
  if inserting then                                                             
    if :NEW."BIO_ASY_ANALYSIS_GWAS_ID" is null then                             
      select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ASY_ANALYSIS_GWAS_ID" from d
ual;                                                                            
    end if;                                                                     
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASY_ANALYSIS_GWAS_ID" ENABLE                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASY_ANALYSIS_EQTL_ID" before inse
rt on BIOMART.BIO_ASSAY_ANALYSIS_EQTL for each row                              
begin                                                                           
  if inserting then                                                             
    if :NEW."BIO_ASY_ANALYSIS_EQTL_ID" is null then                             
      select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ASY_ANALYSIS_EQTL_ID" from d
ual;                                                                            
    end if;                                                                     
  end if;                                                                       
end;                                                                            
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASY_ANALYSIS_EQTL_ID" ENABLE                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_PLATFORM_ID" before insert 
on "BIO_ASSAY_PLATFORM"    for each row begin     if inserting then       if :NE
W."BIO_ASSAY_PLATFORM_ID" is null then          select SEQ_BIO_DATA_ID.nextval i
nto :NEW."BIO_ASSAY_PLATFORM_ID" from dual;       end if;    end if; end;       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASSAY_PLATFORM_ID" ENABLE                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_ID" before insert on "BIO_A
SSAY"    for each row begin     if inserting then       if :NEW."BIO_ASSAY_ID" i
s null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_ASSAY_ID" fro
m dual;       end if;    end if; end;                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASSAY_ID" ENABLE                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_F_G_ID" before insert on "B
IO_ASSAY_FEATURE_GROUP"    for each row begin     if inserting then       if :NE
W."BIO_ASSAY_FEATURE_GROUP_ID" is null then          select SEQ_BIO_DATA_ID.next
val into :NEW."BIO_ASSAY_FEATURE_GROUP_ID" from dual;       end if;    end if; e
nd;                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASSAY_F_G_ID" ENABLE                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_DATA_ID" before insert on "
BIO_ASSAY_DATA"    for each row begin     if inserting then       if :NEW."BIO_A
SSAY_DATA_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BI
O_ASSAY_DATA_ID" from dual;       end if;    end if; end;                       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASSAY_DATA_ID" ENABLE                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_DATASET_ID" before insert o
n "BIO_ASSAY_DATASET"    for each row begin     if inserting then       if :NEW.
"BIO_ASSAY_DATASET_ID" is null then          select SEQ_BIO_DATA_ID.nextval into
 :NEW."BIO_ASSAY_DATASET_ID" from dual;       end if;    end if; end;           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASSAY_DATASET_ID" ENABLE                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ASSAY_ANALYSIS_ID" before insert 
on "BIO_ASSAY_ANALYSIS"    for each row begin     if inserting then       if :NE
W."BIO_ASSAY_ANALYSIS_ID" is null then          select SEQ_BIO_DATA_ID.nextval i
nto :NEW."BIO_ASSAY_ANALYSIS_ID" from dual;       end if;    end if; end;       
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ASSAY_ANALYSIS_ID" ENABLE                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATT_LINEAGE"            
  before insert on "BIOMART"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE"                   
  for each row                                                                  
declare                                                                         
  -- local variables here                                                       
begin                                                                           
  if inserting then                                                             
    if :NEW.BIO_ANALYSIS_ATT_LINEAGE_ID is null then                            
      select SEQ_BIO_ANALYSIS_ATT_LIN_ID.nextval into :NEW.BIO_ANALYSIS_ATT_LINE
AGE_ID from dual;                                                               
    end if;                                                                     
  end if;                                                                       
end TRG_BIO_ANALYSIS_ATT_LINEAGE;                                               
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATT_LINEAGE" ENABLE                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATT_BAAL"               
  after insert on "BIOMART"."BIO_ANALYSIS_ATTRIBUTE"                            
  for each row                                                                  
declare                                                                         
  -- local variables here                                                       
begin                                                                           
  if inserting then                                                             
    -- create a new record in the lineage table for each ancestor of this term (
including self)                                                                 
    insert into BIO_ANALYSIS_ATTRIBUTE_LINEAGE                                  
    (BIO_ANALYSIS_ATTRIBUTE_ID, ANCESTOR_TERM_ID, ANCESTOR_SEARCH_KEYWORD_ID)   
    SELECT :NEW.BIO_ANALYSIS_ATTRIBUTE_ID, skl.ancestor_id, skl.search_keyword_i
d                                                                               
    FROM searchapp.solr_keywords_lineage skl                                    
    WHERE skl.term_id = :NEW.TERM_ID;                                           
  end if;                                                                       
                                                                                
end TRG_BIO_ANALYSIS_ATT_BAAL;                                                  
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATT_BAAL" DISABLE                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATTRIBUTE_ID"           
  before insert on "BIOMART"."BIO_ANALYSIS_ATTRIBUTE"                           
  for each row                                                                  
declare                                                                         
  -- local variables here                                                       
begin                                                                           
  if inserting then                                                             
    if :NEW.BIO_ANALYSIS_ATTRIBUTE_ID is null then                              
      select SEQ_BIO_DATA_ID.nextval into :NEW.BIO_ANALYSIS_ATTRIBUTE_ID from du
al;                                                                             
    end if;                                                                     
                                                                                
  end if;                                                                       
                                                                                
end TRG_BIO_ANALYSIS_ATTRIBUTE_ID;                                              
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_ANALYSIS_ATTRIBUTE_ID" ENABLE                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_AD_HOC_PROP_ID" before           
  INSERT ON "BIOMART"."BIO_AD_HOC_PROPERTY" FOR EACH row BEGIN IF inserting THEN
 IF :NEW."AD_HOC_PROPERTY_ID" IS NULL THEN                                      
  SELECT SEQ_BIO_DATA_ID.nextval INTO :NEW."AD_HOC_PROPERTY_ID" FROM dual;      
	END IF;                                                                        
	END IF;                                                                        
	END;                                                                           
                                                                                
ALTER TRIGGER "BIOMART"."TRG_BIO_AD_HOC_PROP_ID" ENABLE                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TRIGGER "BIOMART"."TMP_TRG_BIO_CONCEPT_CODE_ID" before inser
t on "BIO_CONCEPT_CODE"    for each row begin     if inserting then       if :NE
W."BIO_CONCEPT_CODE_ID" is null then          select SEQ_BIO_DATA_ID.nextval int
o :NEW."BIO_CONCEPT_CODE_ID" from dual;       end if;    end if; end;           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
ALTER TRIGGER "BIOMART"."TMP_TRG_BIO_CONCEPT_CODE_ID" ENABLE                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_ARM_VIEW" ("ID", "REF_ARTICLE_PROT
OCOL_ID", "ARM", "ARM_NBR_OF_PATIENTS_STUDIED", "ARM_CLASSIFICATION_TYPE", "ARM_
CLASSIFICATION_VALUE", "ARM_ASTHMA_DURATION", "ARM_GEOGRAPHIC_REGION", "ARM_AGE"
, "ARM_GENDER", "ARM_SMOKERS_PCT", "ARM_FORMER_SMOKERS_PCT", "ARM_NEVER_SMOKERS_
PCT", "ARM_PACK_YEARS", "MINORITY_PARTICIPATION", "BASELINE_SYMPTOM_SCORE", "BAS
ELINE_RESCUE_MEDICATION_USE") AS                                                
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."ARM",v."ARM_NBR_OF_PATIENT
S_STUDIED",v."ARM_CLASSIFICATION_TYPE",v."ARM_CLASSIFICATION_VALUE",v."ARM_ASTHM
A_DURATION",v."ARM_GEOGRAPHIC_REGION",v."ARM_AGE",v."ARM_GENDER",v."ARM_SMOKERS_
PCT",v."ARM_FORMER_SMOKERS_PCT",v."ARM_NEVER_SMOKERS_PCT",v."ARM_PACK_YEARS",v."
MINORITY_PARTICIPATION",v."BASELINE_SYMPTOM_SCORE",v."BASELINE_RESCUE_MEDICATION
_USE"                                                                           
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			ARM,                                                                         
			ARM_NBR_OF_PATIENTS_STUDIED,                                                 
			ARM_CLASSIFICATION_TYPE,                                                     
			ARM_CLASSIFICATION_VALUE,                                                    
			ARM_ASTHMA_DURATION,                                                         
			ARM_GEOGRAPHIC_REGION,                                                       
			ARM_AGE,                                                                     
			ARM_GENDER,                                                                  
			ARM_SMOKERS_PCT,                                                             
			ARM_FORMER_SMOKERS_PCT,                                                      
			ARM_NEVER_SMOKERS_PCT,                                                       
			ARM_PACK_YEARS,                                                              
			MINORITY_PARTICIPATION,                                                      
			BASELINE_SYMPTOM_SCORE,                                                      
			BASELINE_RESCUE_MEDICATION_USE                                               
from ctd_full                                                                   
where ARM is not null                                                           
order by REF_ARTICLE_PROTOCOL_ID, ARM, to_number(ARM_NBR_OF_PATIENTS_STUDIED)   
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_BIOMARKER_VIEW" ("ID", "REF_ARTICL
E_PROTOCOL_ID", "BIOMARKER_NAME", "BIOMARKER_PCT", "BIOMARKER_VALUE") AS        
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."BIOMARKER_NAME",v."BIOMARK
ER_PCT",v."BIOMARKER_VALUE"                                                     
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			BIOMARKER_NAME,                                                              
			BIOMARKER_PCT,                                                               
			BIOMARKER_VALUE                                                              
from ctd_full                                                                   
where BIOMARKER_NAME is not null                                                
order by REF_ARTICLE_PROTOCOL_ID, BIOMARKER_NAME                                
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_CELL_INFO_VIEW" ("ID", "REF_ARTICL
E_PROTOCOL_ID", "CELLINFO_TYPE", "CELLINFO_COUNT", "CELLINFO_SOURCE") AS        
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."CELLINFO_TYPE",v."CELLINFO
_COUNT",v."CELLINFO_SOURCE"                                                     
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			CELLINFO_TYPE,                                                               
			CELLINFO_COUNT,                                                              
			CELLINFO_SOURCE                                                              
from ctd_full                                                                   
where CELLINFO_TYPE is not null                                                 
order by REF_ARTICLE_PROTOCOL_ID, CELLINFO_TYPE                                 
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_CLINICAL_CHARS_VIEW" ("ID", "REF_A
RTICLE_PROTOCOL_ID", "CLINICAL_VARIABLE", "CLINICAL_VARIABLE_PCT", "CLINICAL_VAR
IABLE_VALUE") AS                                                                
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."CLINICAL_VARIABLE",v."CLIN
ICAL_VARIABLE_PCT",v."CLINICAL_VARIABLE_VALUE"                                  
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			CLINICAL_VARIABLE,                                                           
			CLINICAL_VARIABLE_PCT,                                                       
			CLINICAL_VARIABLE_VALUE                                                      
from ctd_full                                                                   
where CLINICAL_VARIABLE is not null                                             
order by REF_ARTICLE_PROTOCOL_ID, CLINICAL_VARIABLE                             
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_DRUG_EFFECTS_VIEW" ("ID", "REF_ART
ICLE_PROTOCOL_ID", "DISCONTINUATION_RATE", "RESPONSE_RATE", "DOWNSTREAM_SIGNALIN
G_EFFECTS", "BENEFICIAL_EFFECTS", "ADVERSE_EFFECTS", "PK_PD_PARAMETER", "PK_PD_V
ALUE", "EFFECT_DESCRIPTION") AS                                                 
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."DISCONTINUATION_RATE",v."R
ESPONSE_RATE",v."DOWNSTREAM_SIGNALING_EFFECTS",v."BENEFICIAL_EFFECTS",v."ADVERSE
_EFFECTS",v."PK_PD_PARAMETER",v."PK_PD_VALUE",v."EFFECT_DESCRIPTION"            
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			DISCONTINUATION_RATE,                                                        
			RESPONSE_RATE,                                                               
			DOWNSTREAM_SIGNALING_EFFECTS,                                                
			BENEFICIAL_EFFECTS,                                                          
			ADVERSE_EFFECTS,                                                             
			PK_PD_PARAMETER,                                                             
			PK_PD_VALUE,                                                                 
			EFFECT_DESCRIPTION                                                           
from ctd_full                                                                   
order by REF_ARTICLE_PROTOCOL_ID, BENEFICIAL_EFFECTS, ADVERSE_EFFECTS           
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_DRUG_INHIBITOR_VIEW" ("ID", "REF_A
RTICLE_PROTOCOL_ID", "DRUG_INHIBITOR_COMMON_NAME", "DRUG_INHIBITOR_STANDARD_NAME
", "DRUG_INHIBITOR_CAS_ID") AS                                                  
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."DRUG_INHIBITOR_COMMON_NAME
",v."DRUG_INHIBITOR_STANDARD_NAME",v."DRUG_INHIBITOR_CAS_ID"                    
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
  	DRUG_INHIBITOR_COMMON_NAME,                                                  
	DRUG_INHIBITOR_STANDARD_NAME,                                                  
	DRUG_INHIBITOR_CAS_ID                                                          
from ctd_full                                                                   
order by REF_ARTICLE_PROTOCOL_ID, DRUG_INHIBITOR_COMMON_NAME                    
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EVENTS_VIEW" ("ID", "REF_ARTICLE_P
ROTOCOL_ID", "DEFINITION_OF_THE_EVENT", "NUMBER_OF_EVENTS", "EVENT_RATE", "TIME_
TO_EVENT", "EVENT_PCT_REDUCTION", "EVENT_P_VALUE", "EVENT_DESCRIPTION") AS      
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."DEFINITION_OF_THE_EVENT",v
."NUMBER_OF_EVENTS",v."EVENT_RATE",v."TIME_TO_EVENT",v."EVENT_PCT_REDUCTION",v."
EVENT_P_VALUE",v."EVENT_DESCRIPTION"                                            
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			DEFINITION_OF_THE_EVENT,                                                     
			NUMBER_OF_EVENTS,                                                            
			EVENT_RATE,                                                                  
			TIME_TO_EVENT,                                                               
			EVENT_PCT_REDUCTION,                                                         
			EVENT_P_VALUE,                                                               
			EVENT_DESCRIPTION                                                            
from ctd_full                                                                   
where DEFINITION_OF_THE_EVENT is not null or EVENT_DESCRIPTION is not null      
order by REF_ARTICLE_PROTOCOL_ID, DEFINITION_OF_THE_EVENT                       
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPERIMENTS_VIEW" ("ID", "REF_ARTI
CLE_PROTOCOL_ID", "DRUG_INHIBITOR_COMMON_NAME", "DRUG_INHIBITOR_DOSE", "DRUG_INH
IBITOR_TIME_PERIOD", "DRUG_INHIBITOR_ROUTE_OF_ADMIN", "DRUG_INHIBITOR_TRTMT_REGI
ME", "COMPARATOR_NAME", "COMPARATOR_DOSE", "COMPARATOR_TIME_PERIOD", "COMPARATOR
_ROUTE_OF_ADMIN", "TREATMENT_REGIME", "PLACEBO", "EXPERIMENT_DESCRIPTION") AS   
  SELECT   ROWNUM AS ID,                                                        
            v."REF_ARTICLE_PROTOCOL_ID",                                        
            v."DRUG_INHIBITOR_COMMON_NAME",                                     
            v."DRUG_INHIBITOR_DOSE",                                            
            v."DRUG_INHIBITOR_TIME_PERIOD",                                     
            v."DRUG_INHIBITOR_ROUTE_OF_ADMIN",                                  
            v."DRUG_INHIBITOR_TRTMT_REGIME",                                    
            v."COMPARATOR_NAME",                                                
            v."COMPARATOR_DOSE",                                                
            v."COMPARATOR_TIME_PERIOD",                                         
            v."COMPARATOR_ROUTE_OF_ADMIN",                                      
            v."TREATMENT_REGIME",                                               
            v."PLACEBO",                                                        
            v."EXPERIMENT_DESCRIPTION"                                          
     FROM   (  SELECT   DISTINCT REF_ARTICLE_PROTOCOL_ID,                       
                                 DRUG_INHIBITOR_COMMON_NAME,                    
                                 DRUG_INHIBITOR_TIME_PERIOD,                    
                                 DRUG_INHIBITOR_DOSE,                           
                                 DRUG_INHIBITOR_ROUTE_OF_ADMIN,                 
                                 DRUG_INHIBITOR_TRTMT_REGIME,                   
                                 COMPARATOR_NAME,                               
                                 COMPARATOR_DOSE,                               
                                 COMPARATOR_TIME_PERIOD,                        
                                 COMPARATOR_ROUTE_OF_ADMIN,                     
                                 TREATMENT_REGIME,                              
                                 PLACEBO,                                       
                                 EXPERIMENT_DESCRIPTION                         
                 FROM   ctd_full                                                
             ORDER BY   REF_ARTICLE_PROTOCOL_ID,                                
                        DRUG_INHIBITOR_COMMON_NAME,                             
                        DRUG_INHIBITOR_TRTMT_REGIME) v                          
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPR_AFTER_VIEW" ("ID", "REF_ARTIC
LE_PROTOCOL_ID", "BIOMOLECULE_NAME", "EXPR_AFTER_TRTMT_PCT", "EXPR_AFTER_TRTMT_N
UMBER", "EXPR_AFTERTRTMT_VALUEFOLD_MEAN", "EXPR_AFTER_TRTMT_SD", "EXPR_AFTER_TRT
MT_SEM", "EXPR_AFTER_TRTMT_UNIT") AS                                            
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."BIOMOLECULE_NAME",v."EXPR_
AFTER_TRTMT_PCT",v."EXPR_AFTER_TRTMT_NUMBER",v."EXPR_AFTERTRTMT_VALUEFOLD_MEAN",
v."EXPR_AFTER_TRTMT_SD",v."EXPR_AFTER_TRTMT_SEM",v."EXPR_AFTER_TRTMT_UNIT"      
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			BIOMOLECULE_NAME,                                                            
			EXPR_AFTER_TRTMT_PCT,                                                        
			EXPR_AFTER_TRTMT_NUMBER,                                                     
			EXPR_AFTERTRTMT_VALUEFOLD_MEAN,                                              
			EXPR_AFTER_TRTMT_SD,                                                         
			EXPR_AFTER_TRTMT_SEM,                                                        
			EXPR_AFTER_TRTMT_UNIT                                                        
from ctd_full                                                                   
where BIOMOLECULE_NAME is not null or EXPR_AFTERTRTMT_VALUEFOLD_MEAN is not null
                                                                                
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME                              
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPR_BASELINE_VIEW" ("ID", "REF_AR
TICLE_PROTOCOL_ID", "BIOMOLECULE_NAME", "BASELINE_EXPR_PCT", "BASELINE_EXPR_NUMB
ER", "BASELINE_EXPR_VALUE_FOLD_MEAN", "BASELINE_EXPR_SD", "BASELINE_EXPR_SEM", "
BASELINE_EXPR_UNIT") AS                                                         
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."BIOMOLECULE_NAME",v."BASEL
INE_EXPR_PCT",v."BASELINE_EXPR_NUMBER",v."BASELINE_EXPR_VALUE_FOLD_MEAN",v."BASE
LINE_EXPR_SD",v."BASELINE_EXPR_SEM",v."BASELINE_EXPR_UNIT"                      
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			BIOMOLECULE_NAME,                                                            
			BASELINE_EXPR_PCT,                                                           
			BASELINE_EXPR_NUMBER,                                                        
			BASELINE_EXPR_VALUE_FOLD_MEAN,                                               
			BASELINE_EXPR_SD,                                                            
			BASELINE_EXPR_SEM,                                                           
			BASELINE_EXPR_UNIT                                                           
from ctd_full                                                                   
where BIOMOLECULE_NAME is not null or  BASELINE_EXPR_VALUE_FOLD_MEAN is not null
                                                                                
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME                              
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPR_BIO_VIEW" ("ID", "REF_ARTICLE
_PROTOCOL_ID", "BIOMOLECULE_NAME", "BIOMOLECULE_ID", "BIOMOLECULE_TYPE", "BIOMAR
KER", "BIOMARKER_TYPE") AS                                                      
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."BIOMOLECULE_NAME",v."BIOMO
LECULE_ID",v."BIOMOLECULE_TYPE",v."BIOMARKER",v."BIOMARKER_TYPE"                
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			BIOMOLECULE_NAME,                                                            
			BIOMOLECULE_ID,                                                              
			BIOMOLECULE_TYPE,                                                            
			BIOMARKER,                                                                   
			BIOMARKER_TYPE                                                               
from ctd_full                                                                   
where BIOMOLECULE_NAME is not null or BIOMOLECULE_ID is not null                
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME                              
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPR_SOURCE_VIEW" ("ID", "REF_ARTI
CLE_PROTOCOL_ID", "EXPR_CHG_SOURCE_TYPE", "EXPR_CHG_TECHNIQUE", "EXPR_CHG_DESCRI
PTION") AS                                                                      
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."EXPR_CHG_SOURCE_TYPE",v."E
XPR_CHG_TECHNIQUE",v."EXPR_CHG_DESCRIPTION"                                     
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
      			EXPR_CHG_SOURCE_TYPE,                                                  
			EXPR_CHG_TECHNIQUE,                                                          
			EXPR_CHG_DESCRIPTION                                                         
from ctd_full                                                                   
where EXPR_CHG_SOURCE_TYPE is not null or EXPR_CHG_DESCRIPTION is not null      
order by REF_ARTICLE_PROTOCOL_ID, EXPR_CHG_SOURCE_TYPE                          
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_FULL_CLINICAL_ENDPTS_VIEW" ("ID", 
"REF_ARTICLE_PROTOCOL_ID", "PRIMARY_ENDPOINT_TYPE", "PRIMARY_ENDPOINT_DEFINITION
", "PRIMARY_ENDPOINT_CHANGE", "PRIMARY_ENDPOINT_TIME_PERIOD", "PRIMARY_ENDPOINT_
P_VALUE", "PRIMARY_ENDPOINT_STAT_TEST", "SECONDARY_TYPE", "SECONDARY_TYPE_DEFINI
TION", "SECONDARY_TYPE_CHANGE", "SECONDARY_TYPE_TIME_PERIOD", "SECONDARY_TYPE_P_
VALUE", "SECONDARY_TYPE_STAT_TEST") AS                                          
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."PRIMARY_ENDPOINT_TYPE",v."
PRIMARY_ENDPOINT_DEFINITION",v."PRIMARY_ENDPOINT_CHANGE",v."PRIMARY_ENDPOINT_TIM
E_PERIOD",v."PRIMARY_ENDPOINT_P_VALUE",v."PRIMARY_ENDPOINT_STAT_TEST",v."SECONDA
RY_TYPE",v."SECONDARY_TYPE_DEFINITION",v."SECONDARY_TYPE_CHANGE",v."SECONDARY_TY
PE_TIME_PERIOD",v."SECONDARY_TYPE_P_VALUE",v."SECONDARY_TYPE_STAT_TEST"         
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			PRIMARY_ENDPOINT_TYPE,                                                       
			PRIMARY_ENDPOINT_DEFINITION,                                                 
			PRIMARY_ENDPOINT_CHANGE,                                                     
			PRIMARY_ENDPOINT_TIME_PERIOD,                                                
			PRIMARY_ENDPOINT_P_VALUE,                                                    
			PRIMARY_ENDPOINT_STAT_TEST,                                                  
			SECONDARY_TYPE,                                                              
			SECONDARY_TYPE_DEFINITION,                                                   
			SECONDARY_TYPE_CHANGE,                                                       
			SECONDARY_TYPE_TIME_PERIOD,                                                  
			SECONDARY_TYPE_P_VALUE,                                                      
			SECONDARY_TYPE_STAT_TEST                                                     
from CTD_FULL                                                                   
order by REF_ARTICLE_PROTOCOL_ID                                                
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_FULL_SEARCH_VIEW" ("FACT_ID", "REF
_ARTICLE_PROTOCOL_ID", "MESH", "COMMON_NAME", "DRUG_INHIBITOR_STANDARD_NAME", "P
RIMARY_ENDPOINT_TYPE", "SECONDARY_TYPE", "BIOMARKER_NAME", "DISEASE_SEVERITY", "
INHALED_STEROID_DOSE", "FEV1", "PRIMARY_ENDPOINT_TIME_PERIOD", "PRIMARY_ENDPOINT
_CHANGE", "PRIMARY_ENDPOINT_P_VALUE") AS                                        
  select rownum as fact_id, t."REF_ARTICLE_PROTOCOL_ID",t."MESH",t."COMMON_NAME"
,t."DRUG_INHIBITOR_STANDARD_NAME",t."PRIMARY_ENDPOINT_TYPE",t."SECONDARY_TYPE",t
."BIOMARKER_NAME",t."DISEASE_SEVERITY",t."INHALED_STEROID_DOSE",t."FEV1",t."PRIM
ARY_ENDPOINT_TIME_PERIOD",t."PRIMARY_ENDPOINT_CHANGE",t."PRIMARY_ENDPOINT_P_VALU
E"                                                                              
from                                                                            
(                                                                               
SELECT distinct ref_Article_Protocol_Id, mesh, common_Name, drug_Inhibitor_Stand
ard_Name,                                                                       
	   primary_Endpoint_Type, secondary_Type, biomarker_Name, disease_Severity,    
	   inhaled_Steroid_Dose, fev1, primary_Endpoint_Time_Period, primary_Endpoint_C
hange,  primary_Endpoint_P_Value                                                
FROM BIOMART.CTD_FULL                                                           
) t                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_PRIMARY_ENDPTS_VIEW" ("ID", "REF_A
RTICLE_PROTOCOL_ID", "PRIMARY_ENDPOINT_TYPE", "PRIMARY_ENDPOINT_DEFINITION", "PR
IMARY_ENDPOINT_CHANGE", "PRIMARY_ENDPOINT_TIME_PERIOD", "PRIMARY_ENDPOINT_P_VALU
E", "PRIMARY_ENDPOINT_STAT_TEST") AS                                            
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."PRIMARY_ENDPOINT_TYPE",v."
PRIMARY_ENDPOINT_DEFINITION",v."PRIMARY_ENDPOINT_CHANGE",v."PRIMARY_ENDPOINT_TIM
E_PERIOD",v."PRIMARY_ENDPOINT_P_VALUE",v."PRIMARY_ENDPOINT_STAT_TEST"           
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			PRIMARY_ENDPOINT_TYPE,                                                       
			PRIMARY_ENDPOINT_DEFINITION,                                                 
			PRIMARY_ENDPOINT_CHANGE,                                                     
			PRIMARY_ENDPOINT_TIME_PERIOD,                                                
			PRIMARY_ENDPOINT_P_VALUE,                                                    
			PRIMARY_ENDPOINT_STAT_TEST                                                   
from CTD_FULL                                                                   
where PRIMARY_ENDPOINT_TYPE is not null or PRIMARY_ENDPOINT_DEFINITION is not nu
ll                                                                              
order by REF_ARTICLE_PROTOCOL_ID, PRIMARY_ENDPOINT_TYPE                         
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_PRIOR_MED_USE_VIEW" ("ID", "REF_AR
TICLE_PROTOCOL_ID", "PRIOR_MED_DRUG_NAME", "PRIOR_MED_PCT", "PRIOR_MED_VALUE") A
S                                                                               
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."PRIOR_MED_DRUG_NAME",v."PR
IOR_MED_PCT",v."PRIOR_MED_VALUE"                                                
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			PRIOR_MED_DRUG_NAME,                                                         
			PRIOR_MED_PCT,                                                               
			PRIOR_MED_VALUE                                                              
from ctd_full                                                                   
where PRIOR_MED_DRUG_NAME is not null                                           
order by REF_ARTICLE_PROTOCOL_ID, PRIOR_MED_DRUG_NAME                           
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_PULMONARY_PATH_VIEW" ("ID", "REF_A
RTICLE_PROTOCOL_ID", "PULMONARY_PATHOLOGY_NAME", "PULMPATH_PATIENT_PCT", "PULMPA
TH_VALUE_UNIT", "PULMPATH_METHOD") AS                                           
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."PULMONARY_PATHOLOGY_NAME",
v."PULMPATH_PATIENT_PCT",v."PULMPATH_VALUE_UNIT",v."PULMPATH_METHOD"            
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			PULMONARY_PATHOLOGY_NAME,                                                    
			PULMPATH_PATIENT_PCT,                                                        
			PULMPATH_VALUE_UNIT,                                                         
			PULMPATH_METHOD                                                              
from ctd_full                                                                   
where PULMONARY_PATHOLOGY_NAME is not null                                      
order by REF_ARTICLE_PROTOCOL_ID, PULMONARY_PATHOLOGY_NAME                      
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_QUANT_PARAMS_VIEW" ("ID", "REF_ART
ICLE_PROTOCOL_ID", "CLINICAL_VARIABLE_NAME", "PCT_CHANGE_FROM_BASELINE", "ABS_CH
ANGE_FROM_BASELINE", "RATE_OF_CHANGE_FROM_BASELINE", "AVERAGE_OVER_TREATMENT_PER
IOD", "WITHIN_GROUP_CHANGES", "STAT_MEASURE_P_VALUE") AS                        
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."CLINICAL_VARIABLE_NAME",v.
"PCT_CHANGE_FROM_BASELINE",v."ABS_CHANGE_FROM_BASELINE",v."RATE_OF_CHANGE_FROM_B
ASELINE",v."AVERAGE_OVER_TREATMENT_PERIOD",v."WITHIN_GROUP_CHANGES",v."STAT_MEAS
URE_P_VALUE"                                                                    
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			CLINICAL_VARIABLE_NAME,                                                      
			PCT_CHANGE_FROM_BASELINE,                                                    
			ABS_CHANGE_FROM_BASELINE,                                                    
			RATE_OF_CHANGE_FROM_BASELINE,                                                
			AVERAGE_OVER_TREATMENT_PERIOD,                                               
			WITHIN_GROUP_CHANGES,                                                        
			STAT_MEASURE_P_VALUE                                                         
from ctd_full                                                                   
where CLINICAL_VARIABLE_NAME is not null                                        
order by REF_ARTICLE_PROTOCOL_ID                                                
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_REFERENCE_VIEW" ("ID", "REF_ARTICL
E_PROTOCOL_ID", "REF_ARTICLE_PMID", "REF_PROTOCOL_ID", "REF_TITLE", "REF_RECORD_
ID", "REF_BACK_REFERENCE") AS                                                   
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."REF_ARTICLE_PMID",v."REF_P
ROTOCOL_ID",v."REF_TITLE",v."REF_RECORD_ID",v."REF_BACK_REFERENCE"              
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			REF_ARTICLE_PMID,                                                            
			REF_PROTOCOL_ID,                                                             
			REF_TITLE,			                                                                
     			REF_RECORD_ID,                                                          
			REF_BACK_REFERENCE                                                           
from ctd_full                                                                   
order by REF_ARTICLE_PROTOCOL_ID, REF_RECORD_ID                                 
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_RUNIN_THERAPIES_VIEW" ("ID", "REF_
ARTICLE_PROTOCOL_ID", "RUNIN_OCS", "RUNIN_ICS", "RUNIN_LABA", "RUNIN_LTRA", "RUN
IN_CORTICOSTEROIDS", "RUNIN_ANTI_FIBROTICS", "RUNIN_IMMUNOSUPPRESSIVE", "RUNIN_C
YTOTOXIC", "RUNIN_DESCRIPTION") AS                                              
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."RUNIN_OCS",v."RUNIN_ICS",v
."RUNIN_LABA",v."RUNIN_LTRA",v."RUNIN_CORTICOSTEROIDS",v."RUNIN_ANTI_FIBROTICS",
v."RUNIN_IMMUNOSUPPRESSIVE",v."RUNIN_CYTOTOXIC",v."RUNIN_DESCRIPTION"           
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			RUNIN_OCS,                                                                   
			RUNIN_ICS,                                                                   
			RUNIN_LABA,                                                                  
			RUNIN_LTRA,                                                                  
			RUNIN_CORTICOSTEROIDS,                                                       
			RUNIN_ANTI_FIBROTICS,                                                        
			RUNIN_IMMUNOSUPPRESSIVE,                                                     
			RUNIN_CYTOTOXIC,                                                             
			RUNIN_DESCRIPTION                                                            
from ctd_full                                                                   
where RUNIN_OCS is not null or RUNIN_DESCRIPTION is not null or RUNIN_IMMUNOSUPP
RESSIVE is not null                                                             
order by REF_ARTICLE_PROTOCOL_ID, RUNIN_DESCRIPTION, RUNIN_DESCRIPTION          
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_SECONDARY_ENDPTS_VIEW" ("ID", "REF
_ARTICLE_PROTOCOL_ID", "SECONDARY_TYPE", "SECONDARY_TYPE_DEFINITION", "SECONDARY
_TYPE_CHANGE", "SECONDARY_TYPE_TIME_PERIOD", "SECONDARY_TYPE_P_VALUE", "SECONDAR
Y_TYPE_STAT_TEST") AS                                                           
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."SECONDARY_TYPE",v."SECONDA
RY_TYPE_DEFINITION",v."SECONDARY_TYPE_CHANGE",v."SECONDARY_TYPE_TIME_PERIOD",v."
SECONDARY_TYPE_P_VALUE",v."SECONDARY_TYPE_STAT_TEST"                            
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			SECONDARY_TYPE,                                                              
			SECONDARY_TYPE_DEFINITION,                                                   
			SECONDARY_TYPE_CHANGE,                                                       
			SECONDARY_TYPE_TIME_PERIOD,                                                  
			SECONDARY_TYPE_P_VALUE,                                                      
			SECONDARY_TYPE_STAT_TEST                                                     
from CTD_FULL                                                                   
where SECONDARY_TYPE is not null or SECONDARY_TYPE_DEFINITION is not null       
order by REF_ARTICLE_PROTOCOL_ID, SECONDARY_TYPE                                
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_STATS_VIEW" ("ID", "REF_ARTICLE_PR
OTOCOL_ID", "CLINICAL_CORRELATION", "STATISTICAL_TEST", "STATISTICAL_COEFFICIENT
_VALUE", "STATISTICAL_TEST_P_VALUE", "STATISTICAL_TEST_DESCRIPTION") AS         
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."CLINICAL_CORRELATION",v."S
TATISTICAL_TEST",v."STATISTICAL_COEFFICIENT_VALUE",v."STATISTICAL_TEST_P_VALUE",
v."STATISTICAL_TEST_DESCRIPTION"                                                
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			CLINICAL_CORRELATION,                                                        
			STATISTICAL_TEST,                                                            
			STATISTICAL_COEFFICIENT_VALUE,                                               
			STATISTICAL_TEST_P_VALUE,                                                    
			STATISTICAL_TEST_DESCRIPTION                                                 
from ctd_full                                                                   
where STATISTICAL_TEST_DESCRIPTION is not null or STATISTICAL_TEST is not null  
order by REF_ARTICLE_PROTOCOL_ID, STATISTICAL_TEST                              
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_STUDY_DETAILS_VIEW" ("ID", "REF_AR
TICLE_PROTOCOL_ID", "STUDY_TYPE", "COMMON_NAME", "ICD10", "MESH", "DISEASE_TYPE"
, "PHYSIOLOGY_NAME") AS                                                         
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."STUDY_TYPE",v."COMMON_NAME
",v."ICD10",v."MESH",v."DISEASE_TYPE",v."PHYSIOLOGY_NAME"                       
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
      STUDY_TYPE,                                                               
			COMMON_NAME,                                                                 
			ICD10,                                                                       
			MESH,                                                                        
			DISEASE_TYPE,                                                                
			PHYSIOLOGY_NAME                                                              
from ctd_full                                                                   
where COMMON_NAME is not null                                                   
order by REF_ARTICLE_PROTOCOL_ID, COMMON_NAME                                   
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TD_DESIGN_VIEW" ("ID", "REF_ARTICL
E_PROTOCOL_ID", "NATURE_OF_TRIAL", "RANDOMIZATION", "BLINDED_TRIAL", "TRIAL_TYPE
", "RUN_IN_PERIOD", "TREATMENT_PERIOD", "WASHOUT_PERIOD", "OPEN_LABEL_EXTENSION"
) AS                                                                            
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."NATURE_OF_TRIAL",v."RANDOM
IZATION",v."BLINDED_TRIAL",v."TRIAL_TYPE",v."RUN_IN_PERIOD",v."TREATMENT_PERIOD"
,v."WASHOUT_PERIOD",v."OPEN_LABEL_EXTENSION"                                    
  from (                                                                        
  select distinct REF_ARTICLE_PROTOCOL_ID,                                      
        NATURE_OF_TRIAL,                                                        
        RANDOMIZATION,                                                          
        BLINDED_TRIAL,                                                          
        TRIAL_TYPE,                                                             
        RUN_IN_PERIOD,                                                          
        TREATMENT_PERIOD,                                                       
        WASHOUT_PERIOD,                                                         
        OPEN_LABEL_EXTENSION                                                    
  from ctd_full                                                                 
  where TRIAL_TYPE is not null or NATURE_OF_TRIAL is not null                   
  order by REF_ARTICLE_PROTOCOL_ID, NATURE_OF_TRIAL, TRIAL_TYPE                 
  ) v                                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TD_EXCL_VIEW" ("ID", "REF_ARTICLE_
PROTOCOL_ID", "EXCLUSION_CRITERIA1", "EXCLUSION_CRITERIA2", "MINIMAL_SYMPTOMS", 
"RESCUE_MEDICATION_USE", "CONTROL_DETAILS", "BLINDING_PROCEDURE", "NUMBER_OF_ARM
S", "DESCRIPTION1", "DESCRIPTION2") AS                                          
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."EXCLUSION_CRITERIA1",v."EX
CLUSION_CRITERIA2",v."MINIMAL_SYMPTOMS",v."RESCUE_MEDICATION_USE",v."CONTROL_DET
AILS",v."BLINDING_PROCEDURE",v."NUMBER_OF_ARMS",v."DESCRIPTION1",v."DESCRIPTION2
"                                                                               
from (                                                                          
  select distinct REF_ARTICLE_PROTOCOL_ID,                                      
     	dbms_lob.substr(EXCLUSION_CRITERIA, 4000, 1) as EXCLUSION_CRITERIA1,      
	dbms_lob.substr(EXCLUSION_CRITERIA, 2000, 4001) as EXCLUSION_CRITERIA2,        
	MINIMAL_SYMPTOMS,                                                              
	RESCUE_MEDICATION_USE,                                                         
	CONTROL_DETAILS,                                                               
	BLINDING_PROCEDURE,                                                            
	NUMBER_OF_ARMS,                                                                
      	dbms_lob.substr(DESCRIPTION, 4000, 1) as DESCRIPTION1,                   
	dbms_lob.substr(DESCRIPTION, 2000, 4001) as DESCRIPTION2                       
  from ctd_full                                                                 
  where BLINDING_PROCEDURE is not null or NUMBER_OF_ARMS is not null            
  order by REF_ARTICLE_PROTOCOL_ID                                              
  ) v                                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TD_INCLUSION_VIEW" ("ID", "REF_ART
ICLE_PROTOCOL_ID", "TRIAL_AGE", "DISEASE_SEVERITY", "DIFFICULT_TO_TREAT", "ASTHM
A_DIAGNOSIS", "INHALED_STEROID_DOSE", "LABA", "OCS", "XOLAIR", "LTRA_INHIBITORS"
, "ASTHMA_PHENOTYPE", "FEV1", "FEV1_REVERSIBILITY", "TLC", "FEV1_FVC", "FVC", "D
LCO", "SGRQ", "HRCT", "BIOPSY", "DYSPNEA_ON_EXERTION", "CONCOMITANT_MED") AS    
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."TRIAL_AGE",v."DISEASE_SEVE
RITY",v."DIFFICULT_TO_TREAT",v."ASTHMA_DIAGNOSIS",v."INHALED_STEROID_DOSE",v."LA
BA",v."OCS",v."XOLAIR",v."LTRA_INHIBITORS",v."ASTHMA_PHENOTYPE",v."FEV1",v."FEV1
_REVERSIBILITY",v."TLC",v."FEV1_FVC",v."FVC",v."DLCO",v."SGRQ",v."HRCT",v."BIOPS
Y",v."DYSPNEA_ON_EXERTION",v."CONCOMITANT_MED"                                  
  from (                                                                        
  select distinct REF_ARTICLE_PROTOCOL_ID,                                      
        TRIAL_AGE,                                                              
        DISEASE_SEVERITY,                                                       
        DIFFICULT_TO_TREAT,                                                     
        ASTHMA_DIAGNOSIS,                                                       
        INHALED_STEROID_DOSE,                                                   
        LABA,                                                                   
        OCS,                                                                    
        XOLAIR,                                                                 
        LTRA_INHIBITORS,                                                        
        ASTHMA_PHENOTYPE,                                                       
        FEV1,                                                                   
        FEV1_REVERSIBILITY,                                                     
        TLC,                                                                    
        FEV1_FVC,                                                               
        FVC,                                                                    
        DLCO,                                                                   
        SGRQ,                                                                   
        HRCT,                                                                   
        BIOPSY,                                                                 
        DYSPNEA_ON_EXERTION,                                                    
        CONCOMITANT_MED                                                         
  from ctd_full                                                                 
  where FEV1 is not null or  DISEASE_SEVERITY is not null or TRIAL_AGE is not nu
ll                                                                              
  order by REF_ARTICLE_PROTOCOL_ID, DISEASE_SEVERITY, FEV1                      
  ) v                                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TD_SMOKER_VIEW" ("ID", "REF_ARTICL
E_PROTOCOL_ID", "TRIAL_SMOKERS_PCT", "TRIAL_FORMER_SMOKERS_PCT", "TRIAL_NEVER_SM
OKERS_PCT", "TRIAL_PACK_YEARS") AS                                              
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."TRIAL_SMOKERS_PCT",v."TRIA
L_FORMER_SMOKERS_PCT",v."TRIAL_NEVER_SMOKERS_PCT",v."TRIAL_PACK_YEARS"          
  from (                                                                        
  select distinct REF_ARTICLE_PROTOCOL_ID,                                      
        TRIAL_SMOKERS_PCT,                                                      
        TRIAL_FORMER_SMOKERS_PCT,                                               
        TRIAL_NEVER_SMOKERS_PCT,                                                
        TRIAL_PACK_YEARS	                                                       
  from ctd_full                                                                 
  where TRIAL_SMOKERS_PCT is not null or TRIAL_NEVER_SMOKERS_PCT is not null    
  order by REF_ARTICLE_PROTOCOL_ID, TRIAL_SMOKERS_PCT                           
  ) v                                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TD_SPONSOR_VIEW" ("ID", "REF_ARTIC
LE_PROTOCOL_ID", "SPONSOR", "TRIAL_NBR_OF_PATIENTS_STUDIED", "SOURCE_TYPE") AS  
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."SPONSOR",v."TRIAL_NBR_OF_P
ATIENTS_STUDIED",v."SOURCE_TYPE"                                                
  from (                                                                        
  select distinct REF_ARTICLE_PROTOCOL_ID,                                      
      SPONSOR,                                                                  
      TRIAL_NBR_OF_PATIENTS_STUDIED,                                            
      SOURCE_TYPE                                                               
  from ctd_full                                                                 
  where SPONSOR is not null or TRIAL_NBR_OF_PATIENTS_STUDIED  is not null       
  order by REF_ARTICLE_PROTOCOL_ID, SPONSOR, TRIAL_NBR_OF_PATIENTS_STUDIED      
  ) v                                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TD_STATUS_VIEW" ("ID", "REF_ARTICL
E_PROTOCOL_ID", "TRIAL_STATUS", "TRIAL_PHASE") AS                               
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."TRIAL_STATUS",v."TRIAL_PHA
SE"                                                                             
  from (                                                                        
  select distinct REF_ARTICLE_PROTOCOL_ID,                                      
        TRIAL_STATUS,                                                           
        TRIAL_PHASE                                                             
  from ctd_full                                                                 
  where TRIAL_STATUS is not null or TRIAL_PHASE is not null                     
  order by REF_ARTICLE_PROTOCOL_ID                                              
  ) v                                                                           
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_TREATMENT_PHASES_VIEW" ("ID", "REF
_ARTICLE_PROTOCOL_ID", "TRTMT_OCS", "TRTMT_ICS", "TRTMT_LABA", "TRTMT_LTRA", "TR
TMT_CORTICOSTEROIDS", "TRTMT_ANTI_FIBROTICS", "TRTMT_IMMUNOSUPPRESSIVE", "TRTMT_
CYTOTOXIC", "TRTMT_DESCRIPTION") AS                                             
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."TRTMT_OCS",v."TRTMT_ICS",v
."TRTMT_LABA",v."TRTMT_LTRA",v."TRTMT_CORTICOSTEROIDS",v."TRTMT_ANTI_FIBROTICS",
v."TRTMT_IMMUNOSUPPRESSIVE",v."TRTMT_CYTOTOXIC",v."TRTMT_DESCRIPTION"           
from                                                                            
(                                                                               
select distinct REF_ARTICLE_PROTOCOL_ID,                                        
			TRTMT_OCS,                                                                   
			TRTMT_ICS,                                                                   
			TRTMT_LABA,                                                                  
			TRTMT_LTRA,                                                                  
			TRTMT_CORTICOSTEROIDS,                                                       
			TRTMT_ANTI_FIBROTICS,                                                        
			TRTMT_IMMUNOSUPPRESSIVE,                                                     
			TRTMT_CYTOTOXIC,                                                             
			TRTMT_DESCRIPTION                                                            
from ctd_full                                                                   
where TRTMT_OCS is not null or TRTMT_DESCRIPTION is not null or TRTMT_IMMUNOSUPP
RESSIVE is not null                                                             
order by REF_ARTICLE_PROTOCOL_ID, TRTMT_DESCRIPTION, TRTMT_OCS                  
) v                                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."VW_FACETED_SEARCH" ("ANALYSIS_ID", "ST
UDY", "STUDY_ID", "DISEASE", "ANALYSES", "DATA_TYPE", "PLATFORM", "OBSERVATION",
 "FACET_ID") AS                                                                 
  select ba.bio_assay_analysis_id as ANALYSIS_ID                                
,be.bio_experiment_id as STUDY                                                  
,be.bio_experiment_id as STUDY_ID                                               
,bd.disease as DISEASE                                                          
,ba.analysis_type as ANALYSES                                                   
,ba.bio_assay_data_type as DATA_TYPE                                            
,bplat.platform_accession as PLATFORM                                           
,bpobs.obs_name as OBSERVATION                                                  
,row_number() over (order by ba.bio_assay_analysis_id) as FACET_ID              
from bio_assay_analysis ba                                                      
Join bio_experiment be                                                          
	 on ba.etl_id = be.accession                                                   
Left outer join bio_data_disease bdd                                            
	 on ba.bio_assay_analysis_id = bdd.bio_data_id                                 
left outer join bio_disease bd                                                  
	 on bdd.bio_disease_id = bd.bio_disease_id                                     
left outer join bio_data_platform bdplat                                        
	 on ba.bio_assay_analysis_id = bdplat.bio_data_id                              
left outer join bio_assay_platform bplat                                        
	 on bdplat.bio_assay_platform_id = bplat.bio_assay_platform_id                 
left outer join bio_data_observation bdpobs                                     
	 on ba.bio_assay_analysis_id = bdpobs.bio_data_id                              
left outer join bio_observation bpobs                                           
	 on bdpobs.bio_observation_id = bpobs.bio_observation_id                       
where ba.bio_assay_data_type in ('GWAS','Metabolic GWAS','EQTL')                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE FORCE VIEW "BIOMART"."VW_FACETED_SEARCH_TEST" ("ANALYSIS_ID"
, "STUDY", "STUDY_ID", "DISEASE", "ANALYSES", "DATA_TYPE", "PLATFORM", "OBSERVAT
ION", "FACET_ID") AS                                                            
  SELECT ba.bio_assay_analysis_id                         AS ANALYSIS_ID ,      
    be.bio_experiment_id                                  AS STUDY ,            
    be.bio_experiment_id                                  AS STUDY_ID ,         
    y.diseases                                            AS DISEASE ,          
    ba.analysis_type                                      AS ANALYSES ,         
    ba.bio_assay_data_type                                AS DATA_TYPE ,        
    x.platforms                                           AS PLATFORM ,         
    z.observations                                        AS OBSERVATION ,      
    row_number() over (order by ba.bio_assay_analysis_id) AS FACET_ID           
  FROM bio_assay_analysis ba                                                    
  JOIN bio_experiment be                                                        
  ON ba.etl_id = be.accession                                                   
  LEFT OUTER JOIN                                                               
    (SELECT baa.bio_assay_analysis_id,                                          
      listagg(bp.platform_accession, ';') within GROUP (                        
    ORDER BY bp.platform_accession) AS platforms                                
    FROM bio_assay_analysis baa ,                                               
      bio_data_platform bdp ,                                                   
      bio_assay_platform bp                                                     
    WHERE baa.bio_assay_analysis_id = bdp.bio_data_id                           
    AND bdp.bio_assay_platform_id   = bp.bio_assay_platform_id                  
    GROUP BY baa.bio_assay_analysis_id                                          
    ) x                                                                         
  ON ba.bio_assay_analysis_id = x.bio_assay_analysis_id                         
  LEFT OUTER JOIN                                                               
    (SELECT baa.bio_assay_analysis_id,                                          
      listagg(TO_CHAR(bd.disease), ';') within GROUP (                          
    ORDER BY TO_CHAR(bd.disease)) AS diseases                                   
    FROM bio_assay_analysis baa ,                                               
      bio_data_disease bdd ,                                                    
      bio_disease bd                                                            
    WHERE baa.bio_assay_analysis_id = bdd.bio_data_id                           
    AND bdd.bio_disease_id          = bd.bio_disease_id                         
    GROUP BY baa.bio_assay_analysis_id                                          
    ) y                                                                         
  ON ba.bio_assay_analysis_id = y.bio_assay_analysis_id                         
  LEFT OUTER JOIN                                                               
    (SELECT baa.bio_assay_analysis_id,                                          
      listagg(TO_CHAR(bo.obs_name), ';') within GROUP (                         
    ORDER BY TO_CHAR(bo.obs_name)) AS observations                              
    FROM bio_assay_analysis baa ,                                               
      bio_data_observation bdo ,                                                
      bio_observation bo                                                        
    WHERE baa.bio_assay_analysis_id = bdo.bio_data_id                           
    AND bdo.bio_observation_id      = bo.bio_observation_id                     
    GROUP BY baa.bio_assay_analysis_id                                          
    ) z                                                                         
  ON ba.bio_assay_analysis_id   = z.bio_assay_analysis_id                       
  WHERE ba.bio_assay_data_type IN ('GWAS','Metabolic GWAS','EQTL')              
                                                                                
                                                                                
                                                                                
