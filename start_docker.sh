#!/bin/bash

docker run --rm \
	-p 6080:80 -p 5900:5900 \
	-v $(pwd)/catkin_ws:/root/catkin_ws \
	-v $(pwd)/.conf/.gazebo:/root/.gazebo \
	-e VNC_RESOLUTION=1920x1080 \
	--name isse-ros \
	-it  eymy/isse-ros
