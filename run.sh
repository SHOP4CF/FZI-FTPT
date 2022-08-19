#!/bin/bash

image_name=ftpt
container_name=ftpt_cont

# run the docker container
docker run -d --name $container_name -it $image_name:latest bash -c "source /root/ftpt_docker/catkin_ws/devel/setup.bash && roslaunch ros_bt_py ros_bt_py.launch"

echo "Waiting for the FTPT (ros_bt_py) User Interface"
sleep 3
echo "Initializing the FTPT User Interface"

xdg-open http://$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(docker ps -aqf "name=$container_name")):8085/ros_bt_py/editor.html
