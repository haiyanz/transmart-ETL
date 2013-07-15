etl_id=${1}
$HOME/data-integration/kitchen.sh -norep=Y -file=$HOME/Kettle-ETL/load_analysis_from_lz_to_staging.kjb -log=load_analysis_stage.log \
-param:ARCHIVE_DIR=/vol1/vol1/upload/archive \
-param:SORT_DIR=/vol1/vol1/Kettle-tmp/ \
-param:ETL_ID=$etl_id

log_date=$(date +"%Y%m%d%H%M")
mv load_analysis_stage.log logs/load_analysis_stage_${log_date}.log

echo "Load finished...."
date


