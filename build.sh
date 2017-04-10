docker rm -f terraria
docker rmi terraria
docker build -t terraria .
docker run -d -p 7777:7777 --name terraria -v $(pwd)/worlds:/worlds -it terraria bash