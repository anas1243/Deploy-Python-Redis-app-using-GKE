FROM jenkins/jenkins:lts
USER root
RUN  apt-get update -y
RUN  apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN  mkdir -p /etc/apt/keyrings
RUN  curl -fsSL https://download.docker.com/linux/debian/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN  apt-get update  -y &&  apt-get install -y docker-ce docker-ce-cli
RUN usermod -aG docker jenkins
RUN apt-get update -y && apt-get install -y ca-certificates curl -y
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update -y && apt-get install -y kubectl