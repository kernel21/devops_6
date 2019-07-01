FROM tomcat:8
MAINTAINER d.ermizin <kernel218@gmail.com>
# copy war-file to webapps dir
COPY hello-1.0.war /usr/local/tomcat/webapps/hello.war
# announcement working port
EXPOSE 8080
# run tomcat with war-file
CMD ["catalina.sh", "run"]
