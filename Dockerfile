FROM ubuntu:latest

MAINTAINER Christian Oelsner <c.oelsner@web.de>

RUN apt-get update && apt-get install -y zip wget && apt-get clean 

ENV SERVER_VERSION=1344 \
  SERVER_ROOT=/opt/terraria \
  SERVER_ZIP=$SERVER_ROOT/terraria-server.zip

RUN wget -q http://terraria.org/server/terraria-server-$SERVER_VERSION.zip -O $SERVER_ZIP \
  && unzip $SERVER_ZIP 'Dedicated\ Server/Linux/*' -d $SERVER_ROOT \ 
  && rm $SERVER_ZIP \
  && cd $SERVER_ROOT/Dedicated\ Server/Linux/ \
  && chmod a+rw * \
  && chmod a+x TerrariaServer*

VOLUME ["/world"]
EXPOSE 80

WORKDIR $SERVER_ROOT/Dedicated\ Server/Linux
ADD serverconfig.txt .

#ENTRYPOINT ["./TerrariaServer.bin.x86_64", "-config", "serverconfig.txt"]