docker build -t nginx:v1 .
docker tag nginx:v1 localhost:5000/nginx:v1
docker image remove nginx:v1
docker push localhost:5000/nginx:v1

