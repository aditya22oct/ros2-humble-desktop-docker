# ROS 2 Humble Desktop Docker Image

This repository contains a Dockerfile to build a custom ROS 2 Humble desktop image based on the official `ros:humble-ros-base` image.

## Features

- Installs the full `ros-humble-desktop` meta-package
- Includes GUI tools like RViz, rqt, Gazebo dependencies
- Lightweight, easy to extend

## Build

```bash
docker build -t ros2-humble-desktop .
