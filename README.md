# ROS 2 Humble Desktop Docker Image

This repository contains a Dockerfile to build a custom ROS 2 Humble desktop image based on the official `ros:humble-ros-base` image.

## Features

- Installs the full `ros-humble-desktop` meta-package
- Includes GUI tools like RViz, rqt, Gazebo dependencies
- Lightweight, easy to extend

## Build

```bash
docker build -t ros2-humble-desktop .
```

## Run with Docker Compose (GUI Support)

Before running the container, allow local Docker containers to access your X server:

```bash
xhost +local:docker
```

Start the container in detached mode using Docker Compose:

```bash
docker-compose up -d
```
or 

```bash
docker-compose -f docker-compose.yml up -d
```

To open a bash shell inside the running container:

```bash
docker-compose exec ros2 bash
```

When finished, stop and remove the container with:

```bash
docker-compose down
```

Optionally, revoke the X server permissions to restrict access again:

```bash
xhost -local:docker
```
