xhost +local:docker
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
docker build -t webcam-opencv-image .
docker run -it --rm --device=/dev/video0:/dev/video0 -e DISPLAY=$DISPLAY -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -v ${PWD}:/src webcam-opencv-image ${1:-bash}
xhost -local:docker