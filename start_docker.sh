#!/bin/bash

docker run --rm \
	-p 6080:80 -p 5900:5900 \
	-v $(pwd)/catkin_ws:/root/catkin_ws \
	-v $(pwd)/.conf/.gazebo:/root/.gazebo \
	--name isse-ros \
	-it  isse-ros
