FROM samajh/deepstream:7.0-triton-x86_64
ENV NVIDIA_DRIVER_CAPABILITIES $NVIDIA_DRIVER_CAPABILITIES,video
ENV LOGLEVEL="INFO"
ENV CUDA_VER=12.2
RUN apt update && apt-get install ffmpeg -y
COPY requirements.txt .
RUN cd /opt/nvidia/deepstream/deepstream/ && git clone https://github.com/marcoslucianops/DeepStream-Yolo 
RUN cd DeepStream-Yolo && make -C nvdsinfer_custom_impl_Yolo clean && make -C nvdsinfer_custom_impl_Yolo
RUN pip3 install -r requirements.txt
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2
ENTRYPOINT ["/bin/bash"]
