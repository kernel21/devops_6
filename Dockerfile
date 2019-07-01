FROM ubuntu:16.04

MAINTAINER d.ermizin <kernel218@gmail.com>
# update system and install packages
RUN apt-get update
RUN apt-get install -y maven git tomcat8 default-jdk
# set environment for run tomcat without system manager service
ENV CATALINA_HOME /usr/share/tomcat8
ENV CATALINA_BASE /var/lib/tomcat8
ENV PATH $CATALINA_HOME/bin:$PATH
# clone from git and deploy war-file 
RUN mkdir maven_build
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git maven_build
RUN cd maven_build && mvn package
RUN cp /maven_build/target/hello-*.war $CATALINA_BASE/webapps/hello.war
# announcement working port
EXPOSE 8080
# run tomcat with war-file
CMD ["catalina.sh", "run"]
