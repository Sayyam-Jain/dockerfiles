FROM nvcr.io/nvidia/l4t-tensorrt:r8.5.2.2-devel
RUN apt-get update && apt-get install -y ffmpeg
RUN apt-get install -y libopenblas-dev
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN rm -rf requirements.txt
CMD ["bash"]
