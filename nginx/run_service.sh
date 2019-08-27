docker service rm nginx
docker service create --name nginx --publish published=80,target=80 localhost:5000/nginx:v1
