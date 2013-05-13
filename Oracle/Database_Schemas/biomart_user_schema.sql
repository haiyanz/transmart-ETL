                                                                                
  CREATE INDEX "BIOMART_USER"."IDX_BIO_MARKER_EXP_ANALYSIS_MV" ON "BIOMART_USER"
."BIO_MARKER_EXP_ANALYSIS_MV" ("BIO_MARKER_ID")                                 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS               
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
  PARALLEL                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "BIOMART_USER"."CREATE_FILE_FROM_QUERY" ( p_query 
in varchar2,                                                                    
                                  p_dir   in varchar2,                          
                                  p_filename in varchar2 )                      
IS                                                                              
     l_output        utl_file.file_type;                                        
     l_theCursor     INTEGER DEFAULT dbms_sql.open_cursor;                      
     l_columnValue   VARCHAR2(4000);                                            
     l_status        INTEGER;                                                   
     l_query         VARCHAR2(1000);                                            
     l_colCnt        NUMBER := 0;                                               
     l_separator     VARCHAR2(1);                                               
     l_descTbl       dbms_sql.desc_tab2;                                        
BEGIN                                                                           
     l_output := utl_file.fopen( p_dir, p_filename, 'w', 32767);                
     EXECUTE IMMEDIATE 'alter session set nls_date_format=''dd-mon-yyyy hh24:mi:
ss'' ';                                                                         
                                                                                
     dbms_sql.parse(  l_theCursor,  p_query, dbms_sql.NATIVE );                 
     dbms_sql.describe_columns2( l_theCursor, l_colCnt, l_descTbl );            
     for i in 1 .. l_colCnt loop                                                
         utl_file.put( l_output, l_separator || '"' || l_descTbl(i).col_name|| '
"' );                                                                           
         dbms_output.put_line('Column Type :: ' || l_descTbl(i).col_type);      
         --col_type = 112 : 112 is the # for CLOB data-type                     
         IF (l_desctbl(i).col_type = 112) THEN                                  
            dbms_sql.define_column( l_theCursor, i, l_columnValue, 4000000000); 
         else                                                                   
            dbms_sql.define_column( l_theCursor, i, l_columnValue, 4000 );      
         END IF;                                                                
         l_separator := ',';                                                    
     end loop;                                                                  
     utl_file.new_line( l_output );                                             
     l_status := dbms_sql.execute(l_theCursor);                                 
     while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop                        
         l_separator := '';                                                     
         FOR i IN 1 .. l_colCnt loop                                            
             dbms_sql.column_value( l_theCursor, i, l_columnValue );            
             IF (l_desctbl(i).col_type = 112) THEN                              
                l_columnValue := rtrim(rtrim(dbms_lob.substr(replace(l_columnVal
ue,'"','""'))));                                                                
             END IF;                                                            
             utl_file.put( l_output, l_separator || l_columnValue );            
             l_separator := ',';                                                
         end loop;                                                              
         utl_file.new_line( l_output );                                         
     end loop;                                                                  
     dbms_sql.close_cursor(l_theCursor);                                        
     utl_file.fclose( l_output );                                               
     execute immediate 'alter session set nls_date_format=''dd-MON-yy'' ';      
exception                                                                       
    when utl_file.invalid_path then                                             
       raise_application_error(-20100,'Invalid Path');                          
    when utl_file.invalid_mode then                                             
       raise_application_error(-20101,'Invalid Mode');                          
    when utl_file.invalid_operation then                                        
       raise_application_error(-20102,'Invalid Operation');                     
    when utl_file.invalid_filehandle then                                       
       raise_application_error(-20103,'Invalid FileHandle');                    
    when utl_file.write_error then                                              
       raise_application_error(-20104,'Write Error');                           
    when utl_file.read_error then                                               
       raise_application_error(-20105,'Read Error');                            
    when utl_file.internal_error then                                           
       raise_application_error(-20106,'Internal Error');                        
    when others then                                                            
         utl_file.fclose( l_output );                                           
         execute immediate 'alter session set nls_date_format=''dd-MON-yy'' ';  
         raise;                                                                 
end;                                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE PROCEDURE "BIOMART_USER"."PATIENT_SUBSET2" (                
  p_result_instance_id IN VARCHAR2,                                             
  p_pathway IN VARCHAR2,                                                        
  p_refcur  OUT SYS_REFCURSOR) AS                                               
                                                                                
  v_patients patients_tab;                                                      
  v_concept_cd concept_cd_tab;                                                  
                                                                                
BEGIN                                                                           
                                                                                
SELECT patient_num BULK COLLECT INTO v_patients FROM (SELECT                    
             DISTINCT a.patient_num                                             
        FROM qt_patient_set_collection a,                                       
             qt_query_result_instance b,                                        
             qt_query_instance c,                                               
             qt_query_master d                                                  
        WHERE a.result_instance_id = b.result_instance_id AND                   
              b.query_instance_id = c.query_instance_id AND                     
              c.query_master_id = d.query_master_id AND                         
              b.result_instance_id = p_result_instance_id);                     
                                                                                
FOR record IN (SELECT SUBSTR(item_key,INSTR(item_key,'\',1,3)) AS concept_path  
FROM (                                                                          
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
cell/crc/psm/1.1/"'))) ik))                                                     
LOOP                                                                            
   SELECT concept_cd BULK COLLECT INTO v_concept_cd FROM concept_dimension      
        WHERE concept_path like record.concept_path||'%';                       
END LOOP;                                                                       
                                                                                
                                                                                
 FOR record IN (SELECT * FROM TABLE(CAST(v_concept_cd AS concept_cd_tab)))      
 LOOP                                                                           
 DBMS_OUTPUT.PUT_LINE(record.column_value);                                     
 END LOOP;                                                                      
                                                                                
OPEN p_refcur FOR                                                               
  SELECT DISTINCT a.probeset, a.gene_symbol, a.refseq, a.zscore, a.pvalue, b.pat
ient_uid, a.assay_id                                                            
      FROM de_subject_assay_data a                                              
      JOIN de_subject_sample_mapping b                                          
        ON a.patient_id = b.patient_id                                          
      JOIN de_pathway_gene c                                                    
        ON a.gene_symbol = c.gene_symbol                                        
      JOIN de_pathway d                                                         
        ON d.id = c.pathway_id                                                  
      WHERE d.name = p_pathway                                                  
        AND b.patient_uid IN (SELECT * FROM TABLE(CAST(v_patients as patients_ta
b)))                                                                            
        AND b.concept_code IN (CASE WHEN ( SELECT COUNT(*) FROM de_subject_sampl
e_mapping                                                                       
                                       WHERE concept_code IN (SELECT * FROM TABL
E(CAST(v_concept_cd AS concept_cd_tab)))) > 0 THEN                              
                                         (SELECT * FROM TABLE(CAST(v_concept_cd 
AS concept_cd_tab)))                                                            
                                       ELSE                                     
                                         (SELECT concept_code FROM de_subject_sa
mple_mapping)                                                                   
                                      END);                                     
                                                                                
END PATIENT_SUBSET2;                                                            
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."ADD_ONTOLOGY_NODE" FOR "I2B2METADATA
"."ADD_ONTOLOGY_NODE"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."WORK_DB_LOOKUP" FOR "I2B2HIVE"."WORK
_DB_LOOKUP"                                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."WORKPLACE_ACCESS" FOR "I2B2WORKDATA"
."WORKPLACE_ACCESS"                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."WORKPLACE" FOR "I2B2WORKDATA"."WORKP
LACE"                                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."VW_FACETED_SEARCH" FOR "BIOMART"."VW
_FACETED_SEARCH"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."VISIT_DIMENSION" FOR "I2B2DEMODATA".
"VISIT_DIMENSION"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."UTIL_GRANT_ALL" FOR "DEAPP"."UTIL_GR
ANT_ALL"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."UPLOAD_STATUS" FOR "I2B2DEMODATA"."U
PLOAD_STATUS"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."UPDATE_OBSERVATION_FACT" FOR "I2B2DE
MODATA"."UPDATE_OBSERVATION_FACT"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."TMP_ANALYSIS_DATA_TEA_RANK" FOR "BIO
MART"."TMP_ANALYSIS_DATA_TEA_RANK"                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."TIMERS" FOR "I2B2HIVE"."TIMERS"     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."TABLE_ACCESS" FOR "I2B2METADATA"."TA
BLE_ACCESS"                                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."T1" FOR "BIOMART"."T1"              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SQ_UP_PATDIM_PATIENTNUM" FOR "I2B2DE
MODATA"."SQ_UP_PATDIM_PATIENTNUM"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SQ_UP_ENCDIM_ENCOUNTERNUM" FOR "I2B2
DEMODATA"."SQ_UP_ENCDIM_ENCOUNTERNUM"                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SQ_UPLOADSTATUS_UPLOADID" FOR "I2B2D
EMODATA"."SQ_UPLOADSTATUS_UPLOADID"                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SP_XTAB" FOR "I2B2DEMODATA"."SP_XTAB
"                                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SOURCE_MASTER" FOR "I2B2DEMODATA"."S
OURCE_MASTER"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SET_UPLOAD_STATUS" FOR "I2B2DEMODATA
"."SET_UPLOAD_STATUS"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SET_TYPE" FOR "I2B2DEMODATA"."SET_TY
PE"                                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SETONT" FOR "I2B2DEMODATA"."SETONT" 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_SUBJECT_REFERENCE" FOR "I2B2DEMO
DATA"."SEQ_SUBJECT_REFERENCE"                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_SEARCH_TAXONOMY_TERM_ID" FOR "SE
ARCHAPP"."SEQ_SEARCH_TAXONOMY_TERM_ID"                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_SEARCH_TAXONOMY_RELS_ID" FOR "SE
ARCHAPP"."SEQ_SEARCH_TAXONOMY_RELS_ID"                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_SEARCH_DATA_ID" FOR "SEARCHAPP".
"SEQ_SEARCH_DATA_ID"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_PATIENT_NUM" FOR "I2B2DEMODATA".
"SEQ_PATIENT_NUM"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_I2B2_DATA_ID" FOR "I2B2METADATA"
."SEQ_I2B2_DATA_ID"                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_ETL_ID" FOR "TM_LZ"."SEQ_ETL_ID"
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_DATA_ID" FOR "DEAPP"."SEQ_DATA_I
D"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_CONCEPT_CODE" FOR "I2B2METADATA"
."SEQ_CONCEPT_CODE"                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_CLINICAL_TRIAL_DESIGN_ID" FOR "B
IOMART"."SEQ_CLINICAL_TRIAL_DESIGN_ID"                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_BIO_DATA_ID" FOR "BIOMART"."SEQ_
BIO_DATA_ID"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_BIO_DATA_FACT_ID" FOR "BIOMART".
"SEQ_BIO_DATA_FACT_ID"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEQ_ASSAY_ID" FOR "DEAPP"."SEQ_ASSAY
_ID"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_USER_FEEDBACK" FOR "SEARCHAPP
"."SEARCH_USER_FEEDBACK"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_TAXONOMY_RELS" FOR "SEARCHAPP
"."SEARCH_TAXONOMY_RELS"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_TAXONOMY" FOR "SEARCHAPP"."SE
ARCH_TAXONOMY"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_SEC_ACCESS_LEVEL" FOR "SEARCH
APP"."SEARCH_SEC_ACCESS_LEVEL"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_SECURE_OBJECT_PATH" FOR "SEAR
CHAPP"."SEARCH_SECURE_OBJECT_PATH"                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_SECURE_OBJECT" FOR "SEARCHAPP
"."SEARCH_SECURE_OBJECT"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_ROLE_AUTH_USER" FOR "SEARCHAP
P"."SEARCH_ROLE_AUTH_USER"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_ROLE" FOR "SEARCHAPP"."SEARCH
_ROLE"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_REQUEST_MAP" FOR "SEARCHAPP".
"SEARCH_REQUEST_MAP"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_KEYWORD_TERM1" FOR "SEARCHAPP
"."SEARCH_KEYWORD_TERM1"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_KEYWORD_TERM" FOR "SEARCHAPP"
."SEARCH_KEYWORD_TERM"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_KEYWORD1" FOR "SEARCHAPP"."SE
ARCH_KEYWORD1"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_KEYWORD" FOR "SEARCHAPP"."SEA
RCH_KEYWORD"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_GENE_SIG_FILE_SCHEMA" FOR "SE
ARCHAPP"."SEARCH_GENE_SIG_FILE_SCHEMA"                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_GENE_SIGNATURE_ITEM" FOR "SEA
RCHAPP"."SEARCH_GENE_SIGNATURE_ITEM"                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_GENE_SIGNATURE" FOR "SEARCHAP
P"."SEARCH_GENE_SIGNATURE"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_CUSTOM_FILTER_ITEM" FOR "SEAR
CHAPP"."SEARCH_CUSTOM_FILTER_ITEM"                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_CUSTOM_FILTER" FOR "SEARCHAPP
"."SEARCH_CUSTOM_FILTER"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_BIO_MKR_CORREL_VIEW" FOR "SEA
RCHAPP"."SEARCH_BIO_MKR_CORREL_VIEW"                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_BIO_MKR_CORREL_FAST_MV" FOR "
SEARCHAPP"."SEARCH_BIO_MKR_CORREL_FAST_MV"                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_USER_SEC_ACCESS_V" FOR "
SEARCHAPP"."SEARCH_AUTH_USER_SEC_ACCESS_V"                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_USER_SEC_ACCESS" FOR "SE
ARCHAPP"."SEARCH_AUTH_USER_SEC_ACCESS"                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_USER" FOR "SEARCHAPP"."S
EARCH_AUTH_USER"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_SEC_OBJECT_ACCESS" FOR "
SEARCHAPP"."SEARCH_AUTH_SEC_OBJECT_ACCESS"                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_PRINCIPAL" FOR "SEARCHAP
P"."SEARCH_AUTH_PRINCIPAL"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_GROUP_MEMBER" FOR "SEARC
HAPP"."SEARCH_AUTH_GROUP_MEMBER"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_AUTH_GROUP" FOR "SEARCHAPP"."
SEARCH_AUTH_GROUP"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SEARCH_APP_ACCESS_LOG" FOR "SEARCHAP
P"."SEARCH_APP_ACCESS_LOG"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SCHEMES" FOR "I2B2METADATA"."SCHEMES
"                                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."SAMPLE_CATEGORIES" FOR "I2B2DEMODATA
"."SAMPLE_CATEGORIES"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."REMOVE_TEMP_TABLE" FOR "I2B2DEMODATA
"."REMOVE_TEMP_TABLE"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QUERY_GLOBAL_TEMP" FOR "I2B2DEMODATA
"."QUERY_GLOBAL_TEMP"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QUERY1" FOR "I2B2METADATA"."QUERY1" 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_XML_RESULT" FOR "I2B2DEMODATA"."Q
T_XML_RESULT"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QXR_XRID" FOR "I2B2DEMODATA"."
QT_SQ_QXR_XRID"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QS_QSID" FOR "I2B2DEMODATA"."Q
T_SQ_QS_QSID"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QR_QRID" FOR "I2B2DEMODATA"."Q
T_SQ_QR_QRID"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QRI_QRIID" FOR "I2B2DEMODATA".
"QT_SQ_QRI_QRIID"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QPR_PCID" FOR "I2B2DEMODATA"."
QT_SQ_QPR_PCID"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QPER_PECID" FOR "I2B2DEMODATA"
."QT_SQ_QPER_PECID"                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QM_QMID" FOR "I2B2DEMODATA"."Q
T_SQ_QM_QMID"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_QI_QIID" FOR "I2B2DEMODATA"."Q
T_SQ_QI_QIID"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_SQ_PQM_QMID" FOR "I2B2DEMODATA"."
QT_SQ_PQM_QMID"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_QUERY_STATUS_TYPE" FOR "I2B2DEMOD
ATA"."QT_QUERY_STATUS_TYPE"                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_QUERY_RESULT_TYPE" FOR "I2B2DEMOD
ATA"."QT_QUERY_RESULT_TYPE"                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_QUERY_RESULT_INSTANCE" FOR "I2B2D
EMODATA"."QT_QUERY_RESULT_INSTANCE"                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_QUERY_MASTER" FOR "I2B2DEMODATA".
"QT_QUERY_MASTER"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_QUERY_INSTANCE" FOR "I2B2DEMODATA
"."QT_QUERY_INSTANCE"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_PRIVILEGE" FOR "I2B2DEMODATA"."QT
_PRIVILEGE"                                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_PDO_QUERY_MASTER" FOR "I2B2DEMODA
TA"."QT_PDO_QUERY_MASTER"                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_PATIENT_SET_COLLECTION" FOR "I2B2
DEMODATA"."QT_PATIENT_SET_COLLECTION"                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_PATIENT_ENC_COLLECTION" FOR "I2B2
DEMODATA"."QT_PATIENT_ENC_COLLECTION"                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_BREAKDOWN_PATH" FOR "I2B2DEMODATA
"."QT_BREAKDOWN_PATH"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_ANALYSIS_PLUGIN_RESULT_TYPE" FOR 
"I2B2DEMODATA"."QT_ANALYSIS_PLUGIN_RESULT_TYPE"                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."QT_ANALYSIS_PLUGIN" FOR "I2B2DEMODAT
A"."QT_ANALYSIS_PLUGIN"                                                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PROVIDER_DIMENSION" FOR "I2B2DEMODAT
A"."PROVIDER_DIMENSION"                                                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PROTOCOL_ID_SEQ" FOR "I2B2DEMODATA".
"PROTOCOL_ID_SEQ"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PROJECT_INFO" FOR "BIOMART"."PROJECT
_INFO"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PLUGIN_SEQ" FOR "SEARCHAPP"."PLUGIN_
SEQ"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PLUGIN_MODULE_SEQ" FOR "SEARCHAPP"."
PLUGIN_MODULE_SEQ"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PLUGIN_MODULE" FOR "SEARCHAPP"."PLUG
IN_MODULE"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PLUGIN" FOR "SEARCHAPP"."PLUGIN"    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PATIENT_TRIAL" FOR "I2B2DEMODATA"."P
ATIENT_TRIAL"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PATIENT_MAPPING" FOR "I2B2DEMODATA".
"PATIENT_MAPPING"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."PATIENT_DIMENSION" FOR "I2B2DEMODATA
"."PATIENT_DIMENSION"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."ONT_SQ_PS_PRID" FOR "I2B2METADATA"."
ONT_SQ_PS_PRID"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."ONT_PROCESS_STATUS" FOR "I2B2METADAT
A"."ONT_PROCESS_STATUS"                                                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."ONT_DB_LOOKUP" FOR "I2B2METADATA"."O
NT_DB_LOOKUP"                                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."OBSERVATION_FACT" FOR "I2B2DEMODATA"
."OBSERVATION_FACT"                                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."NEWS_UPDATES" FOR "I2B2DEMODATA"."NE
WS_UPDATES"                                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."MLOG$_SEARCH_GENE_SIGNATUR" FOR "SEA
RCHAPP"."MLOG$_SEARCH_GENE_SIGNATUR"                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."MESH_ENTRY_ALL" FOR "BIOMART"."MESH_
ENTRY_ALL"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."MESH_ENTRY" FOR "BIOMART"."MESH_ENTR
Y"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."MESH_ALL" FOR "BIOMART"."MESH_ALL"  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."MESH" FOR "BIOMART"."MESH"          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."MASTER_QUERY_GLOBAL_TEMP" FOR "I2B2D
EMODATA"."MASTER_QUERY_GLOBAL_TEMP"                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."LZ_SRC_STUDY_METADATA" FOR "TM_LZ"."
LZ_SRC_STUDY_METADATA"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."LZ_SRC_ANALYSIS_METADATA" FOR "TM_LZ
"."LZ_SRC_ANALYSIS_METADATA"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."JMS_USERS" FOR "I2B2HIVE"."JMS_USERS
"                                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."JMS_TRANSACTIONS" FOR "I2B2HIVE"."JM
S_TRANSACTIONS"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."JMS_SUBSCRIPTIONS" FOR "I2B2HIVE"."J
MS_SUBSCRIPTIONS"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."JMS_ROLES" FOR "I2B2HIVE"."JMS_ROLES
"                                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."JMS_MESSAGES" FOR "I2B2HIVE"."JMS_ME
SSAGES"                                                                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."INSERT_PROVIDER_FROMTEMP" FOR "I2B2D
EMODATA"."INSERT_PROVIDER_FROMTEMP"                                             
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."INSERT_PID_MAP_FROMTEMP" FOR "I2B2DE
MODATA"."INSERT_PID_MAP_FROMTEMP"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."INSERT_PATIENT_MAP_FROMTEMP" FOR "I2
B2DEMODATA"."INSERT_PATIENT_MAP_FROMTEMP"                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."INSERT_ENCOUNTERVISIT_FROMTEMP" FOR 
"I2B2DEMODATA"."INSERT_ENCOUNTERVISIT_FROMTEMP"                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."INSERT_EID_MAP_FROMTEMP" FOR "I2B2DE
MODATA"."INSERT_EID_MAP_FROMTEMP"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."INSERT_CONCEPT_FROMTEMP" FOR "I2B2DE
MODATA"."INSERT_CONCEPT_FROMTEMP"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."I2B2_TAGS" FOR "I2B2METADATA"."I2B2_
TAGS"                                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."I2B2_SECURE" FOR "I2B2METADATA"."I2B
2_SECURE"                                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."I2B2_SAMPLE" FOR "I2B2SAMPLEDATA"."I
2B2_SAMPLE"                                                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."I2B2_ID_SEQ" FOR "I2B2METADATA"."I2B
2_ID_SEQ"                                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."I2B2" FOR "I2B2METADATA"."I2B2"     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."HILOSEQUENCES" FOR "I2B2HIVE"."HILOS
EQUENCES"                                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."HIBERNATE_SEQUENCE" FOR "SEARCHAPP".
"HIBERNATE_SEQUENCE"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."HAPLOVIEW_DATA" FOR "DEAPP"."HAPLOVI
EW_DATA"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."GLOBAL_TEMP_PARAM_TABLE" FOR "I2B2DE
MODATA"."GLOBAL_TEMP_PARAM_TABLE"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."GLOBAL_TEMP_FACT_PARAM_TABLE" FOR "I
2B2DEMODATA"."GLOBAL_TEMP_FACT_PARAM_TABLE"                                     
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."FACETED_SEARCH" FOR "BIOMART"."FACET
ED_SEARCH"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."ENCOUNTER_MAPPING" FOR "I2B2DEMODATA
"."ENCOUNTER_MAPPING"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DX" FOR "I2B2DEMODATA"."DX"         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DUMP_TABLE_TO_CSV" FOR "DEAPP"."DUMP
_TABLE_TO_CSV"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DIMLOADER" FOR "I2B2DEMODATA"."DIMLO
ADER"                                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_XTRIAL_PARENT_NAMES" FOR "DEAPP".
"DE_XTRIAL_PARENT_NAMES"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_XTRIAL_CHILD_MAP" FOR "DEAPP"."DE
_XTRIAL_CHILD_MAP"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_SNP_DATASET" FOR "DEAPP".
"DE_SUBJECT_SNP_DATASET"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_SAMPLE_MAPPING" FOR "DEAP
P"."DE_SUBJECT_SAMPLE_MAPPING"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_RBM_DATA" FOR "DEAPP"."DE
_SUBJECT_RBM_DATA"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_PROTEIN_DATA" FOR "DEAPP"
."DE_SUBJECT_PROTEIN_DATA"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_MICROARRAY_MED" FOR "DEAP
P"."DE_SUBJECT_MICROARRAY_MED"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_MICROARRAY_LOGS" FOR "DEA
PP"."DE_SUBJECT_MICROARRAY_LOGS"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_MICROARRAY_DATA_OLD" FOR 
"DEAPP"."DE_SUBJECT_MICROARRAY_DATA_OLD"                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SUBJECT_MICROARRAY_DATA" FOR "DEA
PP"."DE_SUBJECT_MICROARRAY_DATA"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_SUBJECT_SORTED_DEF" FOR "DEAP
P"."DE_SNP_SUBJECT_SORTED_DEF"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_PROBE_SORTED_DEF" FOR "DEAPP"
."DE_SNP_PROBE_SORTED_DEF"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_PROBE" FOR "DEAPP"."DE_SNP_PR
OBE"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_INFO" FOR "DEAPP"."DE_SNP_INF
O"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_GENE_MAP" FOR "DEAPP"."DE_SNP
_GENE_MAP"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_DATA_DATASET_LOC" FOR "DEAPP"
."DE_SNP_DATA_DATASET_LOC"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_DATA_BY_PROBE" FOR "DEAPP"."D
E_SNP_DATA_BY_PROBE"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_DATA_BY_PATIENT" FOR "DEAPP".
"DE_SNP_DATA_BY_PATIENT"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_COPY_NUMBER" FOR "DEAPP"."DE_
SNP_COPY_NUMBER"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SNP_CALLS_BY_GSM" FOR "DEAPP"."DE
_SNP_CALLS_BY_GSM"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_SAVED_COMPARISON" FOR "DEAPP"."DE
_SAVED_COMPARISON"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_RC_SNP_INFO" FOR "DEAPP"."DE_RC_S
NP_INFO"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_PATHWAY_GENE" FOR "DEAPP"."DE_PAT
HWAY_GENE"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_PATHWAY" FOR "DEAPP"."DE_PATHWAY"
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_PARENT_CD_SEQ" FOR "DEAPP"."DE_PA
RENT_CD_SEQ"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_MRNA_ANNOTATION" FOR "DEAPP"."DE_
MRNA_ANNOTATION"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_GPL_INFO" FOR "DEAPP"."DE_GPL_INF
O"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_CONTEXT_SEQ" FOR "DEAPP"."DE_CONT
EXT_SEQ"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_CONTEXT" FOR "DEAPP"."DE_CONTEXT"
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DE_CONCEPT_CONTEXT" FOR "DEAPP"."DE_
CONCEPT_CONTEXT"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DEAPP_ANNOTATION" FOR "DEAPP"."DEAPP
_ANNOTATION"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."DATAMART_REPORT" FOR "I2B2DEMODATA".
"DATAMART_REPORT"                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CZ_REQUIRED_UPLOAD_FIELD" FOR "TM_CZ
"."CZ_REQUIRED_UPLOAD_FIELD"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CZ_FORM_LAYOUT" FOR "TM_CZ"."CZ_FORM
_LAYOUT"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CUSTOM_META" FOR "I2B2METADATA"."CUS
TOM_META"                                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TREATMENT_PHASES_VIEW" FOR "BIOM
ART"."CTD_TREATMENT_PHASES_VIEW"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TD_STATUS_VIEW" FOR "BIOMART"."C
TD_TD_STATUS_VIEW"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TD_SPONSOR_VIEW" FOR "BIOMART"."
CTD_TD_SPONSOR_VIEW"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TD_SMOKER_VIEW" FOR "BIOMART"."C
TD_TD_SMOKER_VIEW"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TD_INCLUSION_VIEW" FOR "BIOMART"
."CTD_TD_INCLUSION_VIEW"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TD_EXCL_VIEW" FOR "BIOMART"."CTD
_TD_EXCL_VIEW"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_TD_DESIGN_VIEW" FOR "BIOMART"."C
TD_TD_DESIGN_VIEW"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_STUDY_DETAILS_VIEW" FOR "BIOMART
"."CTD_STUDY_DETAILS_VIEW"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_STUDY" FOR "BIOMART"."CTD_STUDY"
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_STATS_VIEW" FOR "BIOMART"."CTD_S
TATS_VIEW"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_SEC_ENDPTS" FOR "BIOMART"."CTD_S
EC_ENDPTS"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_SECONDARY_ENDPTS_VIEW" FOR "BIOM
ART"."CTD_SECONDARY_ENDPTS_VIEW"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_RUNIN_THERAPIES_VIEW" FOR "BIOMA
RT"."CTD_RUNIN_THERAPIES_VIEW"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_REFERENCE_VIEW" FOR "BIOMART"."C
TD_REFERENCE_VIEW"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_QUANT_PARAMS_VIEW" FOR "BIOMART"
."CTD_QUANT_PARAMS_VIEW"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_PULMONARY_PATH_VIEW" FOR "BIOMAR
T"."CTD_PULMONARY_PATH_VIEW"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_PRIOR_MED_USE_VIEW" FOR "BIOMART
"."CTD_PRIOR_MED_USE_VIEW"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_PRIMARY_ENDPTS_VIEW" FOR "BIOMAR
T"."CTD_PRIMARY_ENDPTS_VIEW"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_PRIMARY_ENDPTS" FOR "BIOMART"."C
TD_PRIMARY_ENDPTS"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_INCLUSION_CRITERIA" FOR "BIOMART
"."CTD_INCLUSION_CRITERIA"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_FULL_SEARCH_VIEW" FOR "BIOMART".
"CTD_FULL_SEARCH_VIEW"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_FULL_CLINICAL_ENDPTS_VIEW" FOR "
BIOMART"."CTD_FULL_CLINICAL_ENDPTS_VIEW"                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_FULL" FOR "BIOMART"."CTD_FULL"  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_EXPR_SOURCE_VIEW" FOR "BIOMART".
"CTD_EXPR_SOURCE_VIEW"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_EXPR_BIO_VIEW" FOR "BIOMART"."CT
D_EXPR_BIO_VIEW"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_EXPR_BASELINE_VIEW" FOR "BIOMART
"."CTD_EXPR_BASELINE_VIEW"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_EXPR_AFTER_VIEW" FOR "BIOMART"."
CTD_EXPR_AFTER_VIEW"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_EXPERIMENTS_VIEW" FOR "BIOMART".
"CTD_EXPERIMENTS_VIEW"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_EVENTS_VIEW" FOR "BIOMART"."CTD_
EVENTS_VIEW"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_DRUG_INHIBITOR_VIEW" FOR "BIOMAR
T"."CTD_DRUG_INHIBITOR_VIEW"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_DRUG_INHIB" FOR "BIOMART"."CTD_D
RUG_INHIB"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_DRUG_EFFECTS_VIEW" FOR "BIOMART"
."CTD_DRUG_EFFECTS_VIEW"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_DISEASE" FOR "BIOMART"."CTD_DISE
ASE"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_CLINICAL_CHARS_VIEW" FOR "BIOMAR
T"."CTD_CLINICAL_CHARS_VIEW"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_CELL_INFO_VIEW" FOR "BIOMART"."C
TD_CELL_INFO_VIEW"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_BIOMARKER_VIEW" FOR "BIOMART"."C
TD_BIOMARKER_VIEW"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_BIOMARKER" FOR "BIOMART"."CTD_BI
OMARKER"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_ARM_VIEW" FOR "BIOMART"."CTD_ARM
_VIEW"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD_ALLOWED_MEDS_TREATMENT" FOR "BIO
MART"."CTD_ALLOWED_MEDS_TREATMENT"                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD2_TRIAL_DETAILS" FOR "BIOMART"."C
TD2_TRIAL_DETAILS"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD2_STUDY" FOR "BIOMART"."CTD2_STUD
Y"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD2_INHIB_DETAILS" FOR "BIOMART"."C
TD2_INHIB_DETAILS"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD2_DISEASE" FOR "BIOMART"."CTD2_DI
SEASE"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CTD2_CLIN_INHIB_EFFECT" FOR "BIOMART
"."CTD2_CLIN_INHIB_EFFECT"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_VISIT_TABLE" FOR "I2B2DE
MODATA"."CREATE_TEMP_VISIT_TABLE"                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_TABLE" FOR "I2B2DEMODATA
"."CREATE_TEMP_TABLE"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_PROVIDER_TABLE" FOR "I2B
2DEMODATA"."CREATE_TEMP_PROVIDER_TABLE"                                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_PID_TABLE" FOR "I2B2DEMO
DATA"."CREATE_TEMP_PID_TABLE"                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_PATIENT_TABLE" FOR "I2B2
DEMODATA"."CREATE_TEMP_PATIENT_TABLE"                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_EID_TABLE" FOR "I2B2DEMO
DATA"."CREATE_TEMP_EID_TABLE"                                                   
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CREATE_TEMP_CONCEPT_TABLE" FOR "I2B2
DEMODATA"."CREATE_TEMP_CONCEPT_TABLE"                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CRC_DB_LOOKUP" FOR "I2B2HIVE"."CRC_D
B_LOOKUP"                                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CRC_ANALYSIS_JOB" FOR "I2B2HIVE"."CR
C_ANALYSIS_JOB"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."COUNTER" FOR "I2B2DEMODATA"."COUNTER
"                                                                               
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CONCEPT_ID" FOR "I2B2DEMODATA"."CONC
EPT_ID"                                                                         
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CONCEPT_DIMENSION" FOR "I2B2DEMODATA
"."CONCEPT_DIMENSION"                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CONCEPT_COUNTS" FOR "I2B2DEMODATA"."
CONCEPT_COUNTS"                                                                 
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."CODE_LOOKUP" FOR "I2B2DEMODATA"."COD
E_LOOKUP"                                                                       
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_TAXONOMY" FOR "BIOMART"."BIO_TAX
ONOMY"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_SUBJECT" FOR "BIOMART"."BIO_SUBJ
ECT"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_STATS_EXP_MARKER" FOR "BIOMART".
"BIO_STATS_EXP_MARKER"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_SAMPLE" FOR "BIOMART"."BIO_SAMPL
E"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_PATIENT_EVENT_ATTR" FOR "BIOMART
"."BIO_PATIENT_EVENT_ATTR"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_PATIENT_EVENT" FOR "BIOMART"."BI
O_PATIENT_EVENT"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_PATIENT" FOR "BIOMART"."BIO_PATI
ENT"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_OBSERVATION" FOR "BIOMART"."BIO_
OBSERVATION"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."ASYNC_JOB" FOR "I2B2DEMODATA"."ASYNC
_JOB"                                                                           
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_AD_HOC_PROPERTY" FOR "BIOMART"."
BIO_AD_HOC_PROPERTY"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ANALYSIS_ATTRIBUTE" FOR "BIOMART
"."BIO_ANALYSIS_ATTRIBUTE"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE" FOR 
"BIOMART"."BIO_ANALYSIS_ATTRIBUTE_LINEAGE"                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY" FOR "BIOMART"."BIO_ASSAY"
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_ANALYSIS" FOR "BIOMART"."B
IO_ASSAY_ANALYSIS"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_ANALYSIS_DATA" FOR "BIOMAR
T"."BIO_ASSAY_ANALYSIS_DATA"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_ANALYSIS_DATA_TEA" FOR "BI
OMART"."BIO_ASSAY_ANALYSIS_DATA_TEA"                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_ANALYSIS_EQTL" FOR "BIOMAR
T"."BIO_ASSAY_ANALYSIS_EQTL"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_ANALYSIS_EXT" FOR "BIOMART
"."BIO_ASSAY_ANALYSIS_EXT"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_ANALYSIS_GWAS" FOR "BIOMAR
T"."BIO_ASSAY_ANALYSIS_GWAS"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_DATA" FOR "BIOMART"."BIO_A
SSAY_DATA"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_DATASET" FOR "BIOMART"."BI
O_ASSAY_DATASET"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_DATA_ANNOTATION" FOR "BIOM
ART"."BIO_ASSAY_DATA_ANNOTATION"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_DATA_STATS" FOR "BIOMART".
"BIO_ASSAY_DATA_STATS"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_DATA_STATS_SEQ" FOR "BIOMA
RT"."BIO_ASSAY_DATA_STATS_SEQ"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_FEATURE_GROUP" FOR "BIOMAR
T"."BIO_ASSAY_FEATURE_GROUP"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_PLATFORM" FOR "BIOMART"."B
IO_ASSAY_PLATFORM"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASSAY_SAMPLE" FOR "BIOMART"."BIO
_ASSAY_SAMPLE"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASY_ANALYSIS_DATASET" FOR "BIOMA
RT"."BIO_ASY_ANALYSIS_DATASET"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASY_ANALYSIS_DATA_IDX" FOR "BIOM
ART"."BIO_ASY_ANALYSIS_DATA_IDX"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASY_ANALYSIS_PLTFM" FOR "BIOMART
"."BIO_ASY_ANALYSIS_PLTFM"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_ASY_DATA_STATS_ALL" FOR "BIOMART
"."BIO_ASY_DATA_STATS_ALL"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CELL_LINE" FOR "BIOMART"."BIO_CE
LL_LINE"                                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CGDCP_DATA" FOR "BIOMART"."BIO_C
GDCP_DATA"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CLINC_TRIAL_ATTR" FOR "BIOMART".
"BIO_CLINC_TRIAL_ATTR"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CLINC_TRIAL_PT_GROUP" FOR "BIOMA
RT"."BIO_CLINC_TRIAL_PT_GROUP"                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CLINC_TRIAL_TIME_PT" FOR "BIOMAR
T"."BIO_CLINC_TRIAL_TIME_PT"                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CLINICAL_TRIAL" FOR "BIOMART"."B
IO_CLINICAL_TRIAL"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CLINICAL_TRIAL_DESIGN" FOR "BIOM
ART"."BIO_CLINICAL_TRIAL_DESIGN"                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_COMPOUND" FOR "BIOMART"."BIO_COM
POUND"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CONCEPT_CODE" FOR "BIOMART"."BIO
_CONCEPT_CODE"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CONTENT" FOR "BIOMART"."BIO_CONT
ENT"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CONTENT_REFERENCE" FOR "BIOMART"
."BIO_CONTENT_REFERENCE"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CONTENT_REPOSITORY" FOR "BIOMART
"."BIO_CONTENT_REPOSITORY"                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CURATED_DATA" FOR "BIOMART"."BIO
_CURATED_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_CURATION_DATASET" FOR "BIOMART".
"BIO_CURATION_DATASET"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_ATTRIBUTE" FOR "BIOMART"."B
IO_DATA_ATTRIBUTE"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_COMPOUND" FOR "BIOMART"."BI
O_DATA_COMPOUND"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_CORRELATION" FOR "BIOMART".
"BIO_DATA_CORRELATION"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_CORREL_DESCR" FOR "BIOMART"
."BIO_DATA_CORREL_DESCR"                                                        
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_DISEASE" FOR "BIOMART"."BIO
_DATA_DISEASE"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_EXT_CODE" FOR "BIOMART"."BI
O_DATA_EXT_CODE"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_LITERATURE" FOR "BIOMART"."
BIO_DATA_LITERATURE"                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_OBSERVATION" FOR "BIOMART".
"BIO_DATA_OBSERVATION"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_OMIC_MARKER" FOR "BIOMART".
"BIO_DATA_OMIC_MARKER"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_PLATFORM" FOR "BIOMART"."BI
O_DATA_PLATFORM"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_TAXONOMY" FOR "BIOMART"."BI
O_DATA_TAXONOMY"                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DATA_UID" FOR "BIOMART"."BIO_DAT
A_UID"                                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_DISEASE" FOR "BIOMART"."BIO_DISE
ASE"                                                                            
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_EXPERIMENT" FOR "BIOMART"."BIO_E
XPERIMENT"                                                                      
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_ALT_DATA" FOR "BIOMART"."BIO
_LIT_ALT_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_AMD_DATA" FOR "BIOMART"."BIO
_LIT_AMD_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_INH_DATA" FOR "BIOMART"."BIO
_LIT_INH_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_INT_DATA" FOR "BIOMART"."BIO
_LIT_INT_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_INT_MODEL_MV" FOR "BIOMART".
"BIO_LIT_INT_MODEL_MV"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_MODEL_DATA" FOR "BIOMART"."B
IO_LIT_MODEL_DATA"                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_PE_DATA" FOR "BIOMART"."BIO_
LIT_PE_DATA"                                                                    
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_REF_DATA" FOR "BIOMART"."BIO
_LIT_REF_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_LIT_SUM_DATA" FOR "BIOMART"."BIO
_LIT_SUM_DATA"                                                                  
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_MARKER" FOR "BIOMART"."BIO_MARKE
R"                                                                              
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE SYNONYM "BIOMART_USER"."BIO_MARKER_CORREL_MV" FOR "BIOMART".
"BIO_MARKER_CORREL_MV"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_USER"."BIO_MARKER_EXP_ANALYSIS_MV"                      
   (	"BIO_MARKER_ID" NUMBER(18,0) NOT NULL ENABLE,                              
	"BIO_EXPERIMENT_ID" NUMBER(18,0),                                              
	"BIO_ASSAY_ANALYSIS_ID" NUMBER(18,0) NOT NULL ENABLE                           
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_USER"."PLAN_TABLE"                                      
   (	"STATEMENT_ID" VARCHAR2(30),                                               
	"TIMESTAMP" DATE,                                                              
	"REMARKS" VARCHAR2(80),                                                        
	"OPERATION" VARCHAR2(30),                                                      
	"OPTIONS" VARCHAR2(255),                                                       
	"OBJECT_NODE" VARCHAR2(128),                                                   
	"OBJECT_OWNER" VARCHAR2(30),                                                   
	"OBJECT_NAME" VARCHAR2(30),                                                    
	"OBJECT_INSTANCE" NUMBER(*,0),                                                 
	"OBJECT_TYPE" VARCHAR2(30),                                                    
	"OPTIMIZER" VARCHAR2(255),                                                     
	"SEARCH_COLUMNS" NUMBER,                                                       
	"ID" NUMBER(*,0),                                                              
	"PARENT_ID" NUMBER(*,0),                                                       
	"POSITION" NUMBER(*,0),                                                        
	"COST" NUMBER(*,0),                                                            
	"CARDINALITY" NUMBER(*,0),                                                     
	"BYTES" NUMBER(*,0),                                                           
	"OTHER_TAG" VARCHAR2(255),                                                     
	"PARTITION_START" VARCHAR2(255),                                               
	"PARTITION_STOP" VARCHAR2(255),                                                
	"PARTITION_ID" NUMBER(*,0),                                                    
	"OTHER" LONG,                                                                  
	"DISTRIBUTION" VARCHAR2(30),                                                   
	"CPU_COST" NUMBER(*,0),                                                        
	"IO_COST" NUMBER(*,0),                                                         
	"TEMP_SPACE" NUMBER(*,0)                                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_USER"."KDE_TEMP_OBJ_REG3"                               
   (	"OBJECT_SCHEMA" VARCHAR2(32),                                              
	"OBJECT_NAME" VARCHAR2(32),                                                    
	"OBJECT_TYPE" VARCHAR2(64),                                                    
	"KDE_USERNAME" VARCHAR2(64),                                                   
	"KDE_SESSION" VARCHAR2(255),                                                   
	"OBJECT_CREATED_TIMESTAMP" CHAR(15)                                            
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE TABLE "BIOMART_USER"."IOE_TEMP_OBJ_REG2"                               
   (	"OBJECT_SCHEMA" VARCHAR2(32),                                              
	"OBJECT_NAME" VARCHAR2(32),                                                    
	"OBJECT_TYPE" VARCHAR2(64),                                                    
	"KDE_USERNAME" VARCHAR2(64),                                                   
	"KDE_SESSION" VARCHAR2(255),                                                   
	"OBJECT_CREATED_TIMESTAMP" TIMESTAMP (0)                                       
   ) SEGMENT CREATION IMMEDIATE                                                 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING              
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DE
FAULT CELL_FLASH_CACHE DEFAULT)                                                 
  TABLESPACE "BIOMART"                                                          
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TYPE "BIOMART_USER"."CONCEPT_CD_TAB" IS TABLE OF VARCHAR2(50
)                                                                               
                                                                                
                                                                                
                                                                                
                                                                                
  CREATE OR REPLACE TYPE "BIOMART_USER"."PATIENTS_TAB" IS TABLE OF NUMBER(10,0) 
                                                                                
                                                                                
                                                                                
