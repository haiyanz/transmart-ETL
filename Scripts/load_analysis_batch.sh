set -x
fn=${1}
log_date=`date +%Y%m%d%H%M%S`
./data-integration/kitchen.sh -norep=Y -file=Kettle-ETL/process_analysis_files.kjb \
-param:DATA_LOCATION=/vol2/transmart/ETL/Analysis_Data/FULL_DATA \
-param:LOAD_TYPE=I \
-param:SORT_DIR=/vol2/transmart/ETL/Kettle-tmp \
-param:LOADER_PATH=/app/oracle/product/11.2/bin/sqlldr \
-param:METADATA_FILE=$fn
mv Analysis_Data/FULL_DATA/$fn Analysis_Data/FULL_DATA/$fn.loaded
