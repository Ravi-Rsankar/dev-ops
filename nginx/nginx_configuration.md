## Nginx Installation
```
sudo apt-get update
sudo apt-get install nginx
```

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

#### Nginx Commands

Test the configuration
```
sudo nginx -t
```

## Other settings
### To download a file by exposing the path 
In the nginx.conf file provide the root path at the 'root' variable udnder the server section.  
```
root /home/ubuntu/src/ui
```

Provide a location for '/' which will have an empty body. Whenever a request is received at this location it will direct to the root.  
```
location ~ \.(zip) {
        root /var/www/html/share;
    }
```

Now to access the file, navigate the url till the file in the browser.  
Eg: In the browser, say if the file is under /home/ubuntu/src/ui/image/image.tar.  
Provide this complete link in the browser to access the file