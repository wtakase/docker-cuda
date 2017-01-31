FROM centos:7
MAINTAINER wtakase <wataru.takase@kek.jp>

ENV CUDA_VERSION 8.0.44-1
RUN curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub && \
    rpm --import 7fa2af80.pub && \
    yum install -y epel-release \
                   http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-${CUDA_VERSION}.x86_64.rpm && \
    yum install -y cuda
ENV PATH=/usr/local/cuda/bin:$PATH LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

RUN yum install -y openssh-server openssh-client
RUN rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
EXPOSE 22
ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD /run.sh
