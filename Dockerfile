FROM ct2034/vnc-ros-kinetic-full


# install packages
RUN apt-get update && apt-get install -q -y \
  vim \
  nano \
    && rm -rf /var/lib/apt/lists/*


EXPOSE 80
RUN echo 'source /opt/ros/kinetic/setup.bash' >> .bashrc
WORKDIR ./catkin_ws
RUN echo 'source /catkin_ws/devel/setup.bash' >> .bashrc
