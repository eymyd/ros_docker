FROM ct2034/vnc-ros-kinetic-full


# install packages
RUN apt-get update && apt-get install -q -y \
  vim \
  nano \
    && rm -rf /var/lib/apt/lists/*


EXPOSE 80
#RUN echo 'source /opt/ros/kinetic/setup.bash' >> .bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> .bashrc
RUN echo 'export DISPLAY=:1.0' >> .bashrc

RUN cp .bashrc /etc/bash.bashrc
WORKDIR ./catkin_ws
