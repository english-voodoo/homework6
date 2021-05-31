FROM tomcat
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install maven git -y
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR $CATALINA_HOME/webapps
RUN echo $CATALINA_HOME && ls -l $CATALINA_HOME/webapps
RUN ls -l /tmp/boxfuse-sample-java-war-hello/target/ && cp /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war $CATALINA_HOME/webapps