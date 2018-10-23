#!/bin/bash

docker run --rm \
	-p 6080:80 -p 5900:5900 \
	-v $(pwd)/catkin_ws:/root/catkin_ws \
	--name isse-ros \
	-it  isse-ros
