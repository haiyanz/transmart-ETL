date
#  JAVA_HOME variable must be set if none exists globally
export JAVA_HOME=/usr/local/jdk1.6.0_31
$HOME/data-integration/kitchen.sh -norep=Y -file=$HOME/Kettle-ETL/create_clinical_data.kjb -log=load_clinical_data.log \
-param:COLUMN_MAP_FILE=test_column_mapping.txt \
-param:DATA_LOCATION=$HOME/TEST/DATA  \
-param:LOAD_TYPE=I \
-param:SECURITY_REQUIRED=N \
-param:SORT_DIR=$HOME \
-param:SQLLDR_PATH=$ORACLE_HOME/bin/sqlldr \
-param:STUDY_ID=TEST \
-param:TOP_NODE='\Public Studies\COPD_test' \
-param:WORD_MAP_FILE= test_word_mapping.txt\
-param:RECORD_EXCLUSION_FILE=x
log_date=$(date +"%Y%m%d%H%M")
mv load_clinical_data.log logs/load_clinical_data_${log_date}.log

echo "Load finished...."
date
