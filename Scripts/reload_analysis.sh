set -x
log_date=`date +%Y%m%d%H%M%S`
$HOME/data-integration/kitchen.sh -norep=Y -file=$HOME/Kettle-ETL/reload_analysis.kjb 
