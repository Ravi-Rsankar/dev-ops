# Docker commands

##### Initialize a swarm 
```
swarm init --advertise-addr localhost
```

##### Create a registry  
This creates a registry without TLS
```
docker run -d -p 5000:5000 --restart=always --name registry_name registry:2
```

##### Stop registry
```
docker container stop registry_name
```

##### To remove the container, use docker container rm
```
docker container stop registry_name && docker container rm -v registry_name
```

##### Docker build
```
docker build [Options] [Path] 
```
The '.' represents the path where to build
Options:-t - name and optionally a tag in name:tag format  
        -f - Name of the dockerfile(if name other than Dockerfile)

##### Run the docker image
```
docker run --name some_name image_id
```

##### Remove a container
```
docker rm name
```

##### View all running containers
```
docker ps
```

##### List all the images
```
docker images
```

##### Remove the docker images
```
docker rmi image_name
```
Use -f for force remove  

##### Stop the docker container
```
docker stop test
```

##### List all exited containers
```
docker ps -f "status=exited"
```

##### Docker pull command
```
docker pull module_name
```

##### Docker tag 
```
docker tag Source_Image[:tag] Target_Image[:tag]
```

##### Docker push
```
docker push Name[:tag]
```

##### Remove all unused Images, Containers
```
docker system prune  
docker system prune -a  
```

