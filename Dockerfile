From debian

LABEL Maintainer="Wanderson Pereira <wanderson.coord@gmail.com>"

# Install Dependences
RUN apt-get update \
 -qq && apt-get install -y -qq apt-transport-https \
 ca-certificates \
 gnupg-agent  \
 build-essential \
 software-properties-common \
 libssl-dev \
 libffi-dev \
 python3-dev \
 unixodbc-dev \
 curl

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update

RUN apt-get -y install docker-ce docker-ce-cli containerd.io
RUN service docker start

# Install awscli
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN export PATH=/usr/local/bin:$PATH
RUN pip3 install awscli --upgrade --user

CMD ["bash"]