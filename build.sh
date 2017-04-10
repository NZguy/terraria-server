docker rm -f terraria
docker rmi terraria
docker build -t terraria .
docker run -p 80:80 --name terraria -v $(pwd)/worlds:/worlds -it terraria
#ctrl+p ctrl+q to detach