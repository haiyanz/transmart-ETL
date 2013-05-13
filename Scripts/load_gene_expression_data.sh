#  JAVA_HOME variable must be set if none exists globally
# export JAVA_HOME=/usr/local/jdk1.6.0_27
set -x
$HOME/data-integration/kitchen.sh -norep=Y /file=$HOME/Kettle-ETL/load_gene_expression_data.kjb /log=load_gene_expression_data.log \
/param:DATA_FILE_PREFIX=TEST_Expression_Data_Subset_ \
/param:DATA_LOCATION=$HOME/TEST/DATA \
/param:DATA_TYPE=R \
/param:FilePivot_LOCATION=$HOME/FilePivot \
/param:LOAD_TYPE=I \
/param:LOG_BASE=2 \
/param:MAP_FILENAME=test_subject_sample_mapping.txt \
/param:SAMPLE_REMAP_FILENAME=NOSAMPLEREMAP \
/param:SAMPLE_SUFFIX=.rma-Signal \
/param:SECURITY_REQUIRED=N \
/param:SORT_DIR=$HOME \
/param:SOURCE_CD=STD \
/param:SQLLDR_PATH=$ORACLE_HOME/bin/sqlldr \
/param:STUDY_ID=TEST \
/param:TOP_NODE='\Public Studies\TEST\'
log_date=$(date +"%Y%m%d%H%M")
mv load_gene_expression_data.log load_gene_expression_data_${log_date}.log

