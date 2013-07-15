date
#  JAVA_HOME variable must be set if none exists globally
# export JAVA_HOME=/usr/local/jdk1.6.0_27
$HOME/data-integration/kitchen.sh -norep=Y -file=$HOME/Kettle-ETL/remove_clinical_node.kjb -log=remove_clinical_node.log \
-param:STUDY_ID=TEST \
-param:TOP_NODE='\Public Studies\Test' 

log_date=$(date +"%Y%m%d%H%M")
mv remove_clinical_node.log logs/remove_clinical_node_${log_date}.log

echo "Load finished...."
date
