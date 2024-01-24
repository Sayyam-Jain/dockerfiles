## Dockerfile for Deepstream 6.4
Based on *deepstream:6.4-triton-multiarch*

```docker build -t samajh/deepstream:6.4-triton-multiarch . ```

#### If the applications are not running, do this:
````
Reboot system
xhost +local:*
xhost -local:*
xhost +local:*
xhost +


Or do this:

export DISPLAY=:1
xhost +local:docker
xhost +
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
export QT_GRAPHICSSYSTEM=native
export QT_X11_NO_MITSHM=1
rm -rf ~/.cache/gstreamer-1.0
````

Applications path: ````   /opt/nvidia/deepstream/deepstream-6.4/sources/deepstream_python_apps/apps/deepstream-test1  ````

#### Testing 
clone ```https://github.com/NVIDIA-AI-IOT/deepstream_python_apps``` to your directory and mount it to ```/opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps```
This allows user to edit code on the fly. If apps don't run, consult, solutions mentioned above

