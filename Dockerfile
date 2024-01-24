FROM dustynv/jetson-inference:r32.7.1
RUN apt-get update && apt-get install ffmpeg -y && rm -rf /jeson-inference
RUN add-apt-repository ppa:alex-p/tesseract-ocr5 -y && apt-get update
RUN apt install tesseract-ocr libtesseract-dev -y
RUN python3 -m pip install --upgrade pip
RUN pip3 install cryptography natsort pytesseract
ENTRYPOINT [ "bash" ]
