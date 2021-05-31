FROM tomcat
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install maven git -y
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps.dist/
RUN chown -R tomcat:tomcat /usr/local/tomcat/webapps.dist/