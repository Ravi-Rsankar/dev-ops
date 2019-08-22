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
docker build .
```
The . represents the path where to build  

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