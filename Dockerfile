#
# Oracle Java 6 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java6
#

# Pull base image.
FROM centos:6.6

# Use our repo
RUN sed -i 's/mirror.centos.org/mirrors.usc.edu/g' /etc/yum.repos.d/CentOS-Base.repo
# Update to latest
RUN yum -y update
# wget command
RUN yum -y install wget
#
RUN cd /tmp
# Get Java
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64-rpm.bin
RUN chmod a+x ./jdk-6u45-linux-x64-rpm.bin 
# Add Tomcat
# RUN yum -y install tomcat6.x86_64

# RUN yum remove java-1.5.0-gcj.x86_64
# RUN yum remove java-1.8.0-openjdk-headless.x86_64

# install sun's java
RUN ./jdk-6u45-linux-x64-rpm.bin

# RUN rm -f /etc/alternatives/java
# RUN ln -s /usr/java/jdk1.6.0_45/bin/java /etc/alternatives/java

RUN wget http://supergsego.com/apache/tomcat/tomcat-6/v6.0.44/bin/apache-tomcat-6.0.44.tar.gz
RUN yum -y install tar
RUN tar zxvf apache-tomcat-6.0.44.tar.gz
RUN mv apache-tomcat-6.0.44 /usr/share/
RUN ln -s /usr/share/apache-tomcat-6.0.44 /usr/share/tomcat6
RUN ln -s /usr/share/tomcat6/bin/catalina.sh /etc/init.d/tomcat6

EXPOSE 8080

#  RUN \
#  echo oraclehared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
#  add-apt-repository -y ppa:webupd8team/java && \
#  apt-get update && \
#  apt-get install -y oracle-java6-installer && \
#  rm -rf /var/lib/apt/lists/* && \
#  rm -rf /var/cache/oracle-jdk6-installer

# Define working directory.
# WORKDIR /data

# Define commonly used JAVA_HOME variable
# ENV JAVA_HOME /usr/lib/jvm/java-6-oracle

# Define default command.
CMD ["bash"]

