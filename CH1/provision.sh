#!/bin/bash

docker rm -f nginx kibana mysql

KIBANA="kibana:6.4.2"

#docker network create devops-net

echo "Installing $KIBANA as a docker image...."

echo "$KIBANA image detected and pulled from docker hub"
docker pull kibana:6.4.2

echo "Installing $KIBANA"
docker run -d --name kibana --net devops-net -p 5601:5601 kibana:6.4.2

echo "Installing Nginx..."

docker run --name nginx -p 80:80 --net devops-net -d nginx:latest

echo "Installing mysql"

docker run --name mysql --net devops-net -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Batsignal30$ -d mysql:latest

#####################################################################

echo "Please wait..." && sleep 20
echo " "
echo "#####################################################################"
echo "Testing if Nginx installed successfully"
NGINX_URL="http://localhost:80"

curl $NGINX_URL
if [ "$?" -eq "0" ]
then
  echo "NGINX successfully installed."
else
  echo "NGINX installation failed!!!."
fi
#####################################################################

echo "Testing if mysql installed successfully"
MYSQL_URL="http://localhost:80"

curl $MYSQL_URL
if [ "$?" -eq "0" ]
then
  echo "MYSQL successfully installed."
else
  echo "MYSQL installation failed!!!."
fi

#####################################################################

echo "Testing if Kibana installed successfully..."

KIBANA_URL="http://localhost:5601"

echo "Please wait till kibana boots...." && sleep 40
echo "#####################################################################"

curl $KIBANA_URL
if [ "$?" -eq "0" ]
then
  echo "$KIBANA successfully installed."
else
  echo "$KIBANA installation failed!!!."
fi
