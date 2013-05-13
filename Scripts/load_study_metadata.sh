#  JAVA_HOME variable must be set if none exists globally
# export JAVA_HOME=/usr/local/jdk1.6.0_27
set -x
$HOME/data-integration/kitchen.sh -norep=Y -file=$HOME/Kettle-ETL/Load_Study_Metadata.kjb -log=load_study_metadata.log \
-param:METADATA_FILENAME=TEST_metadata.txt \
-param:METADATA_LOCATION=$HOME \
-param:METADATA_MAP_FILENAME=x \
-param:SORT_DIR=$HOME 
log_date=$(date +"%Y%m%d%H%M")
mv load_study_metadata.log logs/load_study_metadata_${log_date}.log
