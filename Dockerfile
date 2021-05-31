FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install default-jdk tomcat9 maven git -y
EXPOSE 80
EXPOSE 443
RUN cd /tmp && mkdir boxfuse && cd boxfuse
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn validate && mvn package
RUN cd target
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
RUN service tomcat9 restart
