#!/bin/bash
#script to install GIT MAVEN JAVA in linusx box
#run cmd install_JMG.sh > test.log
#script to install git java meven
sudo su - 
yum update -y
java --version
yum remove java-1.7.0 -y
cd /opt
ls -ltr
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
ls -ltr
tar xzf jdk-8u131-linux-x64.tar.gz
cd /opt/jdk1.8.0_131
pwd
alternatives --install /usr/bin/java java /opt/jdk1.8.0_131/bin/java 2
alternatives --config java
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_131/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_131/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_131/bin/jar
alternatives --set javac /opt/jdk1.8.0_131/bin/javac
java -version
javac -version
which javac
readlink -f /usr/bin/javac
cd
sleep 20
echo "export JAVA_HOME=/opt/jdk1.8.0_131" >> ~/.bash_profile
sleep 10
echo "export JRE_HOME=/opt/jdk1.8.0_131/jre" >> ~/.bash_profile
sleep 10
echo "export PATH=$PATH:/opt/jdk1.8.0_131/bin:/opt/jdk1.8.0_131/jre/bin" >> ~/.bash_profile

#echo 'export JAVA_HOME=/opt/jdk1.8.0_131' >> ~/.bash_profile
#sleep 20
#echo 'export JRE_HOME=/opt/jdk1.8.0_131/jre' >> ~/.bash_profile
#sleep 20
#echo 'export PATH=$PATH:/opt/jdk1.8.0_131/bin:/opt/jdk1.8.0_131/jre/bin' >> ~/.bash_profile
sleep 20
source ~/.bash_profile
sleep 20
echo $JAVA_HOME
sleep 20
yum install git -y
git --version
cd /opt/
ls -lrt
wget wget https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar xzf apache-maven-3.6.3-bin.tar.gz
cd apache-maven-3.6.3
pwd
cd
sleep 20
echo "export M2_HOME=/opt/apache-maven-3.6.3" >> ~/.bash_profile
sleep 20
echo "export M2=$M2_HOME/bin" >> ~/.bash_profile
sleep 20
echo "export PATH=$M2:$PATH" >> ~/.bash_profile
sleep 20
source ~/.bash_profile
sleep 20
echo $M2_HOME
sleep 20
cd /opt/
which git
cd
sleep 20
DATE=$(date +%m%d%y)
Logfile="/tmp/test_str_process_$DATE.log"
log_it()
{
  printf "%s\n" "$*" >> "$Logfile"
 
}

LOG() {
   echo "$(date +%c) $*" >> $LOG_DIR/$LOG_FILE
}