
# Server Setup Guide

## Java
```
sudo apt update  
sudo apt install python-software-properties -y  
sudo apt install openjdk-8-jre -y  
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile  
source /etc/profile  
echo $JAVA_HOME  
```

## Cassandra
```
echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list  
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -  
sudo apt-get update  
sudo apt-get install cassandra  
sudo service cassandra start  
```

## KairosDB
```
wget https://github.com/kairosdb/kairosdb/releases/download/v1.1.1/kairosdb_1.2.2-1_all.deb  
sudo dpkg -i kairosdb_1.2.2-1_all.deb  
```

#### Setting Cassandra as a datastore
By default the Kairos DB will be connected to the H2 datastore. To change it to Cassandra copy the code into the below mentioned file.  
open the file: /opt/kairosdb/conf/kairosdb.properties   
`kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule  `

#### Start the service
```
sudo service kairosdb start  
systemctl status kairosdb  
```

## Nodejs
```
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -  
sudo apt install npm  
node -v  
npm -v  
```

## Mongo
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4  
sudo echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list  
sudo apt-get update  
sudo apt-get install -y mongodb-org  
sudo systemctl start mongod  
sudo systemctl enable mongod  
```

#### Create Mongo admin user
```
mongo  
use admin  
db.createUser({user:"admin", pwd:"exactmongo123", roles:[{role:"root", db:"admin"}]})  
exit  
```

#### Logging using the root/admin user
```
mongo -u admin -p exactmongo123 --authenticationDatabase admin  
```

#### Create application users
```
use exspv2  
db.createUser({user:"exactspaceapi", pwd:"exactapi123", roles:[{role:"readWrite", db:"exspv2"}]})  
db.updateUser({user:"exactspaceapi",  roles:[{role:"readWrite", db:"exspv2"}]})  

use dfk  
db.createUser({user:"dfkapi", pwd:"dfkapi123", roles:[{role:"readWrite", db:"dfk"}]})  

use utv  
db.createUser({user:"utvapi", pwd:"utvapi123", roles:[{role:"readWrite", db:"utv"}]})  
```
## Loopback installation
```
sudo apt-get install build-essential  
npm install --unsafe-perm  -g loopback-cli  
```

## Nginx installation
```
sudo apt-get update  
sudo apt-get install nginx  
nginx -v  
```

## Docker installation
```
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common  
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7EA0A9C3F273FCD8  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"  
sudo apt update  
sudo apt install -y docker-ce  
sudo systemctl status docker  
> sudo usermod -aG docker ${USER}  
> docker version  
```
--------------------------------------------------------------------------------------------------------------------
## Mysql Installation 
```
sudo apt-get update  
sudo apt-get install mysql-server  
systemctl status mysql.service  
```

#### Create user
```
CREATE USER 'vrm'@'%' IDENTIFIED BY 'password';  
GRANT ALL PRIVILEGES ON *.* TO 'vrm'@'%' IDENTIFIED BY 'password' with GRANT OPTION;  
FLUSH PRIVILEGES;  
```

## Maven Installation
```
cd /opt/  
wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz  
sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz  
sudo mv apache-maven-3.3.9 maven  
sudo nano /etc/profile.d/mavenenv.sh  
```

###### Add the following lines:  
```
export M2_HOME=/opt/maven  
export PATH=${M2_HOME}/bin:${PATH}  
sudo chmod +x /etc/profile.d/mavenenv.sh  
source /etc/profile.d/mavenenv.sh  
mvn --version  
```
