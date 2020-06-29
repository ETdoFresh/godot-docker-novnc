# Godot Engine editor in Docker container

Adapted [godot-docker-vnc](https://github.com/TeddyDD/godot-docker-vnc) to work with the [Godot Engine](https://godotengine.org/) using [noVNC](https://novnc.com/).

My goal was to run this in my browser to use on my ipad. It works, but the lag spikes prove to be a little bit too annoying for serious use.

The audio may not be working.

## Build

``` sh
docker build . -t godot-docker-vnc
```

## Run
``` sh
docker run -dtp 8080:8080 godot-docker-vnc
```

## Usage
For full resolution in the VNC terminal (xterm)...

``` sh
godot --resolution 1280x720 *GODOT_PROJECT*/project.godot
````

Connect to container using web browser: 

```http
http://localhost:8080/vnc.html
```

