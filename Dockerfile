FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget zip && \
  apt-get install -y python2.7 python-pip && \
#  apt-get install python3.6 python3-pip python3.6-tk -y && \
  rm -rf /var/lib/apt/lists/*

# Add files.

COPY ./ /root/
# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

#RUN pip3 install -r requirements.txt

RUN pip2 install -r requirements.txt

#RUN python3 setup.py install

RUN python2 setup.py install
# Define default command.
CMD ["bash"]

