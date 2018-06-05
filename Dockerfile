FROM centos:7

LABEL maintainer="munikumare@gmail.com"

RUN  yum install -y wget && \
     yum install -y java-1.8.0-openjdk 

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre

ENV PATH ${PATH}:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre/bin/

ARG ANT_DOWNLOAD_URI=http://archive.apache.org/dist/ant/binaries/

ENV ANT_VERSION 1.9.6

RUN cd  \
    && wget -q ${ANT_DOWNLOAD_URI}apache-ant-${ANT_VERSION}-bin.tar.gz  \
    && tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz  \
    && mv apache-ant-${ANT_VERSION} /opt/ant  \
    && rm -v apache-ant-${ANT_VERSION}-bin.tar.gz

ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin



 CMD ["sh","-c","cd /root/SFDCDevOps && ant deploy"]
# ENTRYPOINT "/bin/bash"
