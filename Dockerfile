FROM osrf/ros:kinetic-desktop-full

RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc

RUN mkdir -p /root/catkin_ws/src

WORKDIR /root/catkin_ws/src

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_init_workspace" 

WORKDIR /root/catkin_ws

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make" 

RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

WORKDIR /root/catkin_ws/src

RUN git clone https://github.com/robopeak/rplidar_ros

WORKDIR /root/catkin_ws

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make" 

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make install" 

CMD /bin/bash -c "source /root/catkin_ws/devel/setup.bash; roslaunch rplidar_ros view_rplidar.launch"
 
