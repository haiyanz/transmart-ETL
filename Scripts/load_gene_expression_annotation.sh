#  JAVA_HOME variable must be set if none exists globally
# export JAVA_HOME=/usr/local/jdk1.6.0_27
#
#	the parameters are set for using an annotation file from Affymetrix (convert csv to tab-delimited text in Excel and delete all of the top rows except
#	for the column header row (right before the data)
#	Be sure to check the columns before running.
#	Also check the gene_id column for a date and remove all dates
set -x
/usr/local/home/data-integration/kitchen.sh -norep=Y -file=/usr/local/home/Kettle-ETL/load_annotation.kjb -log=load_annotation.log \
-param:DATA_LOCATION=$HOME/TEST/DATA \
-param:SOURCE_FILENAME=test_platform.txt \
-param:GPL_ID=TESTP \
-param:ANNOTATION_TITLE='TEST_ANNO' \
-param:ANNOTATION_DATE=2012/09/07 \
-param:ANNOTATION_RELEASE= \
-param:DATA_SOURCE=A  \
-param:PROBE_COL=2 \
-param:GENE_ID_COL=4 \
-param:GENE_SYMBOL_COL=3 \
-param:ORGANISM_COL=5 \
-param:SKIP_ROWS=1 \
-param:SORT_DIR=$HOME \
-param:LOAD_TYPE=I \
-param:SQLLDR_PATH=$ORACLE_HOME/bin/sqlldr \
-param:EMBEDDED_GENE_TABLE=N \
-param:GENETAB_DELIM=// \
-param:GENETAB_ID_COL=-1 \
-param:GENETAB_REC_DELIM=/// \
-param_GENETAB_SYMBOL_COL=-1 
log_date=$(date +"%Y%m%d%H%M")
mv load_annotation.log logs/load_annotation${log_date}.log
