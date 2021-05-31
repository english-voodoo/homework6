FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install default-jdk tomcat9 maven git -y
EXPOSE 8080
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /tmp/boxfuse-sample-java-war-hello/target
RUN cp ./hello-1.0.war /var/lib/tomcat9/webapps/
RUN ls -l /usr/share/tomcat9/conf/server.xml
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]