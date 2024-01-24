# Dockerfiles
    Latest Dependencies for AI applications for x86-64 based systems  


Based on tensorrt:23.04-py3

#### To Build
   ```docker build -t samajh/deps:23.04-py3 . ```

## Features
````
1. Supports Nvidia ffmpeg Cuda
2. Supports Intel ffmpeg QSV
3. Contains NvCodec with Pytorch binding
4. Contains python-opencv with Cuda support
````

    Note: Timm based models fail on Tensort versions 8.6 and above due to bug in Nvidia TensorRT.
    Nvidia has already been notified. To user VIT/ Timm based models deprecate Tensorrt Version to 8.5 as this one contains Version 8.6.1