# Supported tags and respective `Dockerfile` links

* `0.12.32`, `latest` [(0.12.32/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.32/Dockerfile)
* `0.12.31` [(0.12.31/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.31/Dockerfile)
* `0.12.30` [(0.12.30/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.30/Dockerfile)

[![](https://imagelayers.io/badge/dtandersen/factorio:latest.svg)](https://imagelayers.io/?images=dtandersen/factorio:latest 'Get your own badge on imagelayers.io')

# What is Factorio?

[Factorio](https://www.factorio.com) is a game in which you build and maintain factories.

You will be mining resources, researching technologies, building infrastructure, automating production and fighting enemies. Use your imagination to design your factory, combine simple elements into ingenious structures, apply management skills to keep it working and finally protect it from the creatures who don't really like you.

The game is very stable and optimized for building massive factories. You can create your own maps, write mods in Lua or play with friends via Multiplayer.

NOTE: This is only the server. The game is available on [Steam](http://store.steampowered.com/app/427520/).

# Features

* Automatically takes latest save or autosave when restarting the container.
* Volumes for saves and mods
* Set autosave interval and number of saves.
* Enable/disable the no-auto-pause option.
* Enable/disable console commands in game.
* Based on Alpine Linux.

# How to use this image?

## Quick Start

This runs factorio with default settings, and your save will be kept:

```
docker run -d \
  -v [PATH]:/opt/factorio/saves \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

* Where [PATH] is a folder where you'll put your saves, if there already is a save in it with the string "save", that one will be taken by default, otherwize, a new one will be made.
* Where [PORT] is the port number you choose, if you're going to launch it on your local machine, don't use the port 34197, take another one at random.

## Advanced usage

### Without map persistence

This will generate a new random map with default settings.

```
docker run -d \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

### With map persistence

This will generate a new random map with default settings and save it onto the volume.
Replace [PATH] with a path to a folder on the host where the map will be saved.

```
docker run -d \
  -v [PATH]:/opt/factorio/saves \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

### With existing map

It's the same as above, it takes the last modified file which contains the word save in the filename as current save when booting the server. This allows when upgrading the container to take the last save, you don't have to rename the last autosave as save.zip

```
docker run -d \
  -v [PATH]:/opt/factorio/saves \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

### Autosave interval

You can set the autosave interval. By default it is set at 2 minutes bud you can change it by launching the container with the `FACTORIO_AUTOSAVE_INTERVAL` variable to whatever suits you best.

```
docker run -d \
  --env FACTORIO_AUTOSAVE_INTERVAL=[NUMBER] \
  -p [PORT]:34197/udp  \
  dtandersen/factorio
```

Where [NUMBER] is the number of minutes between autosaves. 

### Autosave slots

You can set the number of autosave slots. By default it is set at 3 slots bud you can change it by launching the container with the `FACTORIO_AUTOSAVE_SLOTS` variable to whatever suits you best.

```
docker run -d \
  --env FACTORIO_AUTOSAVE_SLOTS=[NUMBER] \
  -p [PORT]:34197/udp  \
  dtandersen/factorio
```

Where [NUMBER] is the number of autosave slots.  

### Mounting mod volume

As everybody knows about factorio is you can add mods to it. Now you can also do it in this docker image by mounting a volume.

```
docker run -d \
  -v [PATH]:/opt/factorio/mods \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

Where [PATH] is the path to the folder with your mods.

### Allowing in-game commands

I've always disabled in-game commands because I think it is like cheating, however, you can enable them by setting the the `FACTORIO_DISSALOW_COMMANDS` variable to "false".

```
docker run -d \
  --env FACTORIO_DISSALOW_COMMANDS=false \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

### Activating no-auto-pause in the game when no one is on the server

I do not recommend this feature, bud it can make the game more difficult if you're up for a challenge :-). Just set the `FACTORIO_NO_AUTO_PAUSE` variable to "true".

```
docker run -d \
  --env FACTORIO_NO_AUTO_PAUSE=true \
  -p [PORT]:34197/udp \
  dtandersen/factorio
```

### Logs

Sometimes it's useful to see the logs of a running container:

```
docker exec -it [CONTAINER] tail -f /opt/factorio/factorio-current.log
```

# Credits

Based on [Zopanix' Factorio Server](https://github.com/zopanix/docker_factorio_server).
