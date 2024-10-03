# FROM nvcr.io/nvidia/deepstream:6.4-samples-multiarch
FROM nvcr.io/nvidia/deepstream:7.0-triton-multiarch

# To get video driver libraries at runtime (libnvidia-encode.so/libnvcuvid.so)
ENV NVIDIA_DRIVER_CAPABILITIES $NVIDIA_DRIVER_CAPABILITIES,video
ENV LOGLEVEL="INFO"
ENV GST_DEBUG=2
ENV GST_DEBUG_FILE=/app/output/GST_DEBUG.log
# ENV APP_VER=1.1.10
# ENV PYDS_URL=https://github.com/NVIDIA-AI-IOT/deepstream_python_apps/releases/download/v$APP_VER/pyds-$APP_VER-py3-none-linux_x86_64.whl

RUN apt update
RUN cd /opt/nvidia/deepstream/deepstream && ./install.sh && ./user_additional_install.sh && ./update_rtpmanager.sh
# RUN ./install.sh && ./user_additional_install.sh
#&& ./update_rtpmanager.sh
# RUN apt install -y python3-gi python3-dev python3-gst-1.0 python3-numpy python3-opencv


RUN apt install python3-gi python3-dev python3-gst-1.0 python-gi-dev git meson \
    python3 python3-pip python3.10-dev cmake g++ build-essential libglib2.0-dev \
    libglib2.0-dev-bin libgstreamer1.0-dev libtool m4 autoconf automake libgirepository1.0-dev libcairo2-dev -y

RUN apt-get install -y libgstrtspserver-1.0-0 gstreamer1.0-rtsp libgirepository1.0-dev gobject-introspection gir1.2-gst-rtsp-server-1.0
RUN cd /opt/nvidia/deepstream/deepstream/sources/
RUN curl -O -L  https://github.com/NVIDIA-AI-IOT/deepstream_python_apps/releases/download/v1.1.11/pyds-1.1.11-py3-none-linux_aarch64.whl 
RUN pip3 install pyds-1.1.11-py3-none-linux_aarch64.whl
ENTRYPOINT [ "bash" ]
