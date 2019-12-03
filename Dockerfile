# the base image is a trusted java build (https://registry.hub.docker.com/_/java/)
# FROM java:8

# MAINTAINER gus.doh@gmail.com

FROM ubuntu:18.04

ENV SPARK_HOME /opt/spark

MAINTAINER gus.doh@gmail.com

#&&  apt-get install software-properties-common -y \
#&&  apt-add-repository ppa:webupd8team/java -y \
#&&  apt-get update -y \

####installing [software-properties-common] so that we can use [apt-add-repository] to install Java8
RUN apt-get update -y \
&&  apt-get install wget -y \
&&  apt-get install openjdk-8-jdk-headless -y \
&&  apt-get install supervisor -y


####downloading & unpacking Spark 2.4.4 [prebuilt for Hadoop 2.7 and scala 2.10]
RUN wget https://www-us.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz \
&&  tar -xzf spark-2.4.4-bin-hadoop2.7.tgz \
&&  mv spark-2.4.4-bin-hadoop2.7 /opt/spark


#####adding conf files [to be used by supervisord for running spark master/slave]
COPY master.conf /opt/conf/master.conf
COPY slave.conf /opt/conf/slave.conf
#COPY spark-defaults.conf ${SPARK_HOME}/conf/


#######exposing port 8080 for spark master UI
EXPOSE 8080

#default command: running an interactive spark shell in the local mode
CMD ["/opt/spark/bin/spark-shell", "--master", "local[*]"]
