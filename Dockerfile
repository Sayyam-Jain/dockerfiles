FROM samajh/deepstream:6.4-triton-multiarch
ENV NVIDIA_DRIVER_CAPABILITIES $NVIDIA_DRIVER_CAPABILITIES,video
ENV LOGLEVEL="INFO"
ENV GST_DEBUG=2
ENV GST_DEBUG_FILE=/app/output/GST_DEBUG.log
RUN apt update && apt-get upgrade -y
RUN apt-get install ffmpeg -y
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN rm -rf requirements.txt
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2
WORKDIR '/opt/nvidia/'
ENTRYPOINT ["/bin/bash"]
