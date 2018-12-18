FROM ct2034/vnc-ros-kinetic-full


# install packages
RUN apt-get update && apt-get install -q -y \
  vim \
  nano \
  ros-kinetic-moveit-core \
  ros-kinetic-controller-manager \
  ros-kinetic-moveit-planners-ompl \
  ros-kinetic-realtime-tools \
  ros-kinetic-moveit-ros-move-group \
  ros-kinetic-control-toolbox \
  ros-kinetic-moveit-ros-visualization \
  ros-kinetic-gazebo-ros-control \
  ros-kinetic-ros-control \
  ros-kinetic-ros-controllers \
  ros-kinetic-moveit-simple-controller-manager\
  ros-kinetic-moveit-visual-tools \
    && apt-get dist-upgrade -y && rm -rf /var/lib/apt/lists/*




EXPOSE 80
#RUN echo 'source /opt/ros/kinetic/setup.bash' >> .bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> .bashrc
RUN echo 'export DISPLAY=:1.0' >> .bashrc

RUN cp .bashrc /etc/bash.bashrc
WORKDIR ./catkin_ws
