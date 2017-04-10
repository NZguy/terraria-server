docker rm -f terraria
docker rmi duncanandrew/terraria
docker build -t duncanandrew/terraria .
docker run -p 7777:7777 --name terraria -v $(pwd)/worlds:/worlds -it duncanandrew/terraria
#ctrl+p ctrl+q to detach