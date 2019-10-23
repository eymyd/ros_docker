FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# built-in packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common curl \
    && apt-get update \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
        supervisor \
        openssh-server pwgen sudo vim-tiny \
        net-tools \
        lxde x11vnc xvfb \
        gtk2-engines-murrine ttf-ubuntu-font-family \
        firefox \
        nginx \
        python-pip python-dev build-essential \
        mesa-utils libgl1-mesa-dri \
        gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine pinta \
        dbus-x11 x11-utils \
        terminator \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# =================================
# install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosinstall \
    python-vcstools \
	python-rosinstall-generator \
	python-wstool \
	build-essential \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


# install ros packages
ENV ROS_DISTRO melodic
RUN apt-get update && apt-get install -y \
    ros-melodic-desktop-full \
    #              A
    #              +--- full desktop \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# setup entrypoint
# COPY ./ros_entrypoint.sh /


# =================================

# user tools
RUN apt-get update && apt-get install -y \
    terminator \
    gedit \
    okular \
    && rm -rf /var/lib/apt/lists/*

# tini for subreap
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

ADD image /
RUN pip install setuptools wheel && pip install -r /usr/lib/web/requirements.txt

RUN cp /usr/share/applications/terminator.desktop /root/Desktop
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc

EXPOSE 80
WORKDIR /root
ENV HOME=/home/ubuntu \
    SHELL=/bin/bash
COPY image/startup.sh /startup.sh
RUN chmod +x /startup.sh
ENTRYPOINT ["/startup.sh"]

# install packages
RUN apt-get update && apt-get install -q -y \
  vim \
  nano \
  ros-melodic-moveit-core \
  ros-melodic-controller-manager \
  ros-melodic-moveit-planners-ompl \
  ros-melodic-realtime-tools \
  ros-melodic-moveit-ros-move-group \
  ros-melodic-control-toolbox \
  ros-melodic-moveit-ros-visualization \
  ros-melodic-gazebo-ros-control \
  ros-melodic-ros-control \
  ros-melodic-ros-controllers \
  ros-melodic-moveit-simple-controller-manager\
  ros-melodic-moveit-visual-tools \
  ros-melodic-rqt \
  ros-melodic-rqt-common-plugins \
  ros-melodic-common-tutorials \
    && apt-get dist-upgrade -y && rm -rf /var/lib/apt/lists/*




EXPOSE 80
#RUN echo 'source /opt/ros/kinetic/setup.bash' >> .bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> .bashrc
RUN echo 'export DISPLAY=:1.0' >> .bashrc

RUN cp .bashrc /etc/bash.bashrc
WORKDIR ./catkin_ws
