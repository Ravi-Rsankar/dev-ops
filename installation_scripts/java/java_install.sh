sudo apt update
sudo apt install python-software-properties -y

sudo apt install openjdk-8-jre -y

echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile
source /etc/profile
echo $JAVA_HOME

