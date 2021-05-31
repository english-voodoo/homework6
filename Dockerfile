FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install default-jdk tomcat9 maven git -y
EXPOSE 8080
RUN cd /tmp && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd /tmp/boxfuse-sample-java-war-hello && ls -l && mvn validate && mvn package
RUN cd /tmp/boxfuse-sample-java-war-hello/target && ls -l && cp ./hello-1.0.war /var/lib/tomcat9/webapps/ && ls -l /var/lib/tomcat9/webapps/
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
