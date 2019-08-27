## Nginx Installation


## Nginx Configuration with Docker

#### check the nginx is started
```
systemctl status nginx
```

#### Allow ports

See if the ports are already allowed in the list  
```
sudo ufw status
```

```
sudo ufw allow 80
```

#### nginx.conf file
1. Add the port on which the nginx server listen  
2. Provide the server_naem as the ip addr / domain name  
3. Add the locations under the server json with the endpoints that has to be routed by the nginx  
4. Set the proxy pass with the ip:port to which nginx has to route  

#### Dockerfile
Pull nginx base image and copy the conf file into the docker  

#### build.sh
build the docker image

#### run_service.sh
Create the docker service and publish it to the 80 port