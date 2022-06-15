# tmodloader-docker

Terraria server 1.4.3.6 with tModLoader v0.11.8.9

## Quick Start

    docker run -it --name terraria -p 7777:7777 ldericher/tmodloader

# Adding worlds

    docker run -it --name terraria -p 7777:7777 -v /path/to/.../terraria:/terraria ldericher/tmodloader

# More info

How to run and manipulate [a vanilla terraria container](https://store.docker.com/community/images/ryshe/terraria). Most of these apply here.
Original walkthrough [on reddit by GhostInThePrompt](https://www.reddit.com/r/Terraria/comments/7dbkfe/how_to_create_a_tmodloadermodded_server_on_linux).
