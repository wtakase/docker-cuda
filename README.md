Docker cuda
=====

## Build
```
git clone https://github.com/wtakase/docker-cuda
cd docker-cuda
docker build -t wtakase/cuda:8.0-centos7 .
```

## Launch

Assume you have 4 GPU devices:
```
docker run -d -v /path/to/some/where:/home --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 --device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3 wtakase/cuda:8.0-centos7
```
