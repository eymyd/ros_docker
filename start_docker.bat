docker run --rm -p 6080:80 -p 5900:5900 -v %cd%/catkin_ws:/root/catkin_ws -v $%cd%/.conf/.clion:/root/.CLion2018.3  -v $%cd%/.conf/.gazebo:/root/.gazebo  --name isse-ros -it  eymy/isse-ros
