# pycrypto installation
sudo yum install gcc
sudo yum install gcc-c++
sudo yum install python-devel
sudo yum -y install python-pip

# 
# Current ec2 instance
# pip install --target=. piramiko
# pip install --target=. pycrypto
# zip lamda.zip -r . # Execute this from the directory of lambda package

# Java installation
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo rpm -i <rpm_file_name>

# Spark set up
mkdir spark
cd spark
wget http://mirror.cc.columbia.edu/pub/software/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
sudo tar zxvf spark-2.4.5-bin-hadoop2.7.tgz -C /opt
sudo chown -R ec2-user:ec2-user /opt/spark-2.4.5-bin-hadoop2.7
sudo ln -fs spark-2.4.5-bin-hadoop2.7 /opt/spark  

sudo vi ~/.bash_profile

# Add below 
export SPARK_HOME=/opt/spark
PATH=$PATH:$SPARK_HOME/bin
export PATH

source ~/.bash_profile

# Confirm the setting
spark-submit --version

# Spark submit command
# spark-submit --driver-memory 1g --class dc.basics.Job --master local AllSpark-1.0-shaded.jar
