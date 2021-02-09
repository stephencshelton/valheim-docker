FROM steamcmd/steamcmd

LABEL maintainer="sshelton@sevatec.com"

RUN apt-get update && \
	apt-get -y install --no-install-recommends lib32gcc1 lib32stdc++6 lib32stdc++6 && \
	rm -rf /var/lib/apt/lists/*

ENV DATA_DIR="/serverdata"
ENV STEAMCMD_DIR="/root/.steam/steamcmd"
ENV SERVER_DIR="${DATA_DIR}/serverfiles"
ENV GAME_ID="896660"
ENV GAME_NAME="valheim"
ENV GAME_PARAMS=""
ENV SVR_NAME="Valheim-K3s"
ENV WORLD_NAME="Dedicated"
ENV SRV_PWD="Docker"
ENV PUBLIC=1
ENV GAME_PORT=27015
ENV VALIDATE=""
ENV USERNAME=""
ENV PASSWRD=""
ENV USER="steam"
ENV DATA_PERM=770

RUN ls -la /usr/bin

RUN mkdir $DATA_DIR && mkdir $SERVER_DIR

RUN mkdir /opt/scripts/
ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/

EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp
#Server Start
ENTRYPOINT ["/opt/scripts/start-server.sh"]
