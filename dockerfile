FROM devops2018/tomcat:centos7-base
MAINTAINER "Prasad"
RUN touch /opt/file1
RUN mkdir /opt/dir1
RUN yum install git -y
WORKDIR /opt
RUN git clone https://github.com/polarapu/Batch106.git
RUN yum install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.33/bin/apache-tomcat-10.1.33.tar.gz
RUN tar -xvf apache-tomcat-10.1.33.tar.gz
COPY tomcat-users.xml /opt/apache-tomcat-10.1.33/conf/
EXPOSE 8082
#ENV export JAVA_HOME=/opt/java
#CMD ls -l /opt
RUN yum install maven -y
RUN git clone https://github.com/polarapu/maven-project1.git
RUN cd maven-project1 &&  mvn clean install && cp target/devops106.war /opt
ENTRYPOINT ["java", "-jar", "/opt/devops106.war"]
