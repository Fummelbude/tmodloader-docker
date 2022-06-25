# METADATA
FROM ubuntu:focal

ARG TMOD_VERSION=2022.05.103.34
ARG TERRARIA_VERSION=1436

RUN \
	# system update \
	apt-get -y update &&\
	apt-get -y install wget unzip &&\
	apt-get -y clean &&\
	\
	# prepare directory \
	mkdir /terraria-server &&\
	cd /terraria-server &&\
	\
	# get vanilla server \
	wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-${TERRARIA_VERSION}.zip &&\
	unzip terraria-server-*.zip &&\
	rm terraria-server-*.zip &&\
	cp --verbose -a ${TERRARIA_VERSION}/. . &&\
	rm -rf ${TERRARIA_VERSION} &&\
	\
	# add in tModLoader \
	cd Linux &&\
	wget https://github.com/tModLoader/tModLoader/releases/download/v${TMOD_VERSION}/tModLoader.zip &&\
	unzip -o tModLoader.zip &&\
	rm tModLoader.zip &&\
	chmod u+x start-tModLoaderServer.sh &&\

	# make and access data directories \
	mkdir ${HOME}/.local &&\
	mkdir /root/.local/share &&\
	mkdir /root/.local/share/Terraria &&\
	mkdir /root/.local/share/Terraria/ModLoader &&\
	mkdir /root/.local/share/Terraria/ModLoader/Worlds &&\
	mkdir /root/.local/share/Terraria/ModLoader/Mods

VOLUME \
	/root/.local/share/Terraria/ModLoader/Worlds
COPY \
	Tmod_mods /root/.local/share/Terraria/ModLoader/Mods
COPY \		
	serverconfig.txt /terraria-server/Linux/
	
RUN \
	# remove unneeded files \
	cd .. &&\
	rm -rf /terraria-server/Windows /terraria-server/Mac

# ports used
EXPOSE 7777

# start server
ENTRYPOINT exec /terraria-server/Linux/start-tModLoaderServer.sh
