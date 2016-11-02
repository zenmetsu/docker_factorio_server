# Factorio [![Docker Pulls](https://img.shields.io/docker/pulls/dtandersen/factorio.svg)](https://hub.docker.com/r/dtandersen/factorio/) [![Docker Stars](https://img.shields.io/docker/stars/dtandersen/factorio.svg)](https://hub.docker.com/r/dtandersen/factorio/)

* `0.14.17`, `0.14`, `latest` [(0.14.17/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/0.14.17/0.14/Dockerfile)
* `0.14.16` [(0.14.16/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/0.14.16/0.14/Dockerfile)
* `0.13.20`, `0.13`, `stable` [(0.13.20/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/0.13.20/0.13/Dockerfile)

# What is Factorio?

[Factorio](https://www.factorio.com) is a game in which you build and maintain factories.

You will be mining resources, researching technologies, building infrastructure, automating production and fighting enemies. Use your imagination to design your factory, combine simple elements into ingenious structures, apply management skills to keep it working and finally protect it from the creatures who don't really like you.

The game is very stable and optimized for building massive factories. You can create your own maps, write mods in Lua or play with friends via Multiplayer.

NOTE: This is only the server. The game is available at [factorio.com](https://www.factorio.com) and [Steam](http://store.steampowered.com/app/427520/).


# Usage

## Quick Start

Run the server to create the necessary folder structure and configuration files. For this example data is stored in `/tmp/factorio`.

```
docker run -d -P -v /tmp/factorio:/factorio --name factorio dtandersen/factorio
```

For those new to Docker, here is an explanation of the options:

* `-d` - Run as a daemon ("detached").
* `-P` - Expose all ports.
* `-v` - Mount `/tmp/factorio` on the local file system to `/factorio` in the container.
* `--name` - Name the container "factorio" (otherwise it has a funny random name).

Check the logs to see what happened:

```
docker logs factorio
```

Stop the server:

```
docker stop factorio
```

Now there's a `server-settings.json` file in the folder `/tmp/factorio/config`. Modify this to your liking and restart the server:

```
docker start factorio
```

Try to connect to the server. Check the logs if it isn't working.


## Saves

A new map named `_autosave1.zip` is generated the first time the server is started. The `map-gen-settings.json` file in `/tmp/factorio/config` is used for the map settings. On subsequent runs the newest save is used.

To load an old save stop the server and run the command `touch oldsave.zip`. This resets the date. Then restart the server. Another option is to delete all saves except one.

To generate a new map stop the server, delete all of the saves and restart the server.


## Mods

Copy mods into the mods folder and restart the server.


## RCON

Set the RCON password in the `rconpw` file. A random password is generated if `rconpw` doesn't exist.

To change the password stop the server, modify `rconpw`, and restart the server.

To "disable" RCON don't expose port 27015, i.e. start the server with `-p 34197:34197/udp` instead of `-P`. RCON still runs, but nobody is able to connect to it.


# Container Details

The philosophy is to [keep it simple](http://wiki.c2.com/?KeepItSimple).

* The server should bootstrap itself.
* Prefer configuration files over environment variables.
* Use one volume for data.


## Volumes

To keep things simple, the container uses a single volume mounted at `/factorio`. This volume stores configuration, mods, and saves.

    factorio
    |-- config
    |   |-- map-gen-settings.json
    |   |-- rconpw
    |   `-- server-settings.json
    |-- mods
    |   `-- fancymod.zip
    `-- saves
        `-- _autosave1.zip


## Ports

* `34197/udp` - Factorio clients (required).
* `27015/tcp` - RCON (optional).


## Troubleshooting

**Server is listed in the in-game server browser, but users can't connect**

By default, Docker routes outgoing traffic through a proxy. The source UDP port is changed by the proxy so the server list detects the wrong port. See [Incorrect port detected for docker hosted server](https://forums.factorio.com/viewtopic.php?f=49&t=35255).

To fix this problem, start the Docker service with the `--userland-proxy=false` switch to prevent it from using a proxy. This is typically done by appending the switch to the `DOCKER_OPTS` variable or adding it to the end of `ExecStart` in the systemd service definition. The location of these files varies by OS.


# Credits

Ideas borrowed from:

* [Zopanix](https://github.com/zopanix/docker_factorio_server)
* [Rfvgyhn](https://github.com/Rfvgyhn/docker-factorio)
