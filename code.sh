path=$1
echo "$path" > path.txt
/opt/spark/bin/spark-submit --driver-memory 1g --class dc.basics.Job --master local /home/ec2-user/AllSpark-1.0-shaded.jar

