# tmodloader-docker

Terraria server 1.4.3.6 with tModLoader v0.11.8.9, forked from ldericher/tmodloader-docker

use this branch to add your own mods

# Starting image
# Adding worlds and mods

    docker run -d --name terraria -p 7777:7777 -v /path/to/terraria/world:/root/.local/share/Terraria/ModLoader/Worlds \
    -v /path/to/terraria/mods:/root/.local/share/Terraria/ModLoader/Mods rollio/tmodloaderv11-docker

# More info

How to run and manipulate [a vanilla terraria container](https://store.docker.com/community/images/ryshe/terraria). Most of these apply here.
Original walkthrough [on reddit by GhostInThePrompt](https://www.reddit.com/r/Terraria/comments/7dbkfe/how_to_create_a_tmodloadermodded_server_on_linux).
