# Docker commands

#### Docker build

```
docker build [Options] [Path] 
```
The '.' represents the path where to build  

*Options*:  
        -t - name and optionally a tag in name:tag format  
        -f - Name of the dockerfile(if name other than Dockerfile)


#### Run the docker image
```
docker run --name some_name image_id
```

#### Remove a container
```
docker rm name
```

#### View all running containers
```
docker ps
```

#### List all the images
```
docker images
```

#### Remove the docker images
```
docker rmi [options] image_name
```
*Use -f for force remove*  

#### List all Volumes

```
docker volume ls
```

#### List dangling volumes

```
docker volume ls -qf dangling=true
```

#### Remove all dangling volumes

```
docker volume rm $(docker volume ls -qf dangling=true)
```

#### Remove all unused Images, Containers

```
docker system prune  
docker system prune -a  
```

#### Remove dangling images

```
docker image prune [options]
```

*-a: remove all*  
remove all images that are created more than 12 hours ago

```
docker image prune -a --filter "until=12h"
```

#### Create a registry  

This creates a registry without TLS
```
docker run -d -p 5000:5000 --restart=always --name registry_name registry:2
```

#### Stop registry
```
docker container stop registry_name
```

#### To remove the container, use docker container rm
```
docker container stop registry_name && docker container rm -v registry_name
```

#### Stop the docker container
```
docker stop test
```

#### List all exited containers
```
docker ps -f "status=exited"
```

#### Docker pull command
```
docker pull module_name
```

#### Docker tag 
```
docker tag Source_Image[:tag] Target_Image[:tag]
```

#### Docker push
```
docker push Name[:tag]
```

#### publish service on a port
```
docker service create --name service_name --publish published=1883,target=1883 image_id

```

#### List services
```
docker service ls [options]

```
*-f : filter  
-q : display only ids*  

#### Login to the container
```
docker exec -it container_id /bin/bash
```

#### Create a service
To create a single replica with no configuration, suppply the image name alone. this command starts nginx with no published port
```
docker service create --name any_name image_name:tag
```

#### Remove / stop a service 
```
docker service rm service_name
```

#### Save Image as tar
```
docker save imageName > imagename.tar
```
You can also save a particular tag using imagename:tag  

#### Load image tar 

```
docker load --input imagename.tar
```

#### Visualize docker disc space usage
```
docker system df
```

#### Size of docker container
```
docker ps --size
```
