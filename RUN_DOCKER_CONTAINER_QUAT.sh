#!/bin/bash
IMAGE_NAME=rosbag2dataset_with_quat:latest
CONTAINER_NAME=rosbag2dataset_with_quat

if [ $# -eq 0 ]; then
    BAGFILE_DIR=${HOME}/bagfiles
    DATASET_DIR=${HOME}/dataset
else
    BAGFILE_DIR=$1
    DATASET_DIR=$2
fi

docker run -it --rm \
    --privileged \
    -v ${PWD}/:/root/rosbag2dataset \
    -v ${BAGFILE_DIR}:/root/bagfiles \
    -v ${DATASET_DIR}:/root/dataset \
    --name $CONTAINER_NAME \
    $IMAGE_NAME \
    bash -c "cd rosbag2dataset && bash"
