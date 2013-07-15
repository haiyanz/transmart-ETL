#  JAVA_HOME variable must be set if none exists globally
# export JAVA_HOME=/usr/local/jdk1.6.0_27
set -x
$HOME/data-integration/kitchen.sh -norep=Y -file=$HOME/Kettle-ETL/remove_analysis.kjb -log=remove_analysis.log \
-param:STUDY_ID=BHS \
-param:ANALYSIS_NAME='FVC Baseline'
log_date=$(date +"%Y%m%d%H%M")
mv remove_analysis.log logs/remove_analysis_${log_date}.log
