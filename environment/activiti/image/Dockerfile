FROM openjdk:8-jdk

ENV ACTIVITI_VERSION 6.0.0
ENV TOMCAT_VERSION 8.5.9
ENV MYSQL_CONNECTOR_JAVA_VERSION 5.1.44

# Tomcat
RUN wget http://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/catalina.tar.gz && \
    tar xzf /tmp/catalina.tar.gz -C /opt && \
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm /tmp/catalina.tar.gz && \
    rm -rf /opt/tomcat/webapps/examples && \
    rm -rf /opt/tomcat/webapps/docs

# To install jar files first we need to deploy war files manually
RUN wget https://github.com/Activiti/Activiti/releases/download/activiti-${ACTIVITI_VERSION}/activiti-${ACTIVITI_VERSION}.zip -O /tmp/activiti.zip && \
    unzip /tmp/activiti.zip -d /opt/activiti && \
    unzip /opt/activiti/activiti-${ACTIVITI_VERSION}/wars/activiti-app.war -d /opt/tomcat/webapps/activiti-app && \
    unzip /opt/activiti/activiti-${ACTIVITI_VERSION}/wars/activiti-rest.war -d /opt/tomcat/webapps/activiti-rest && \
    unzip /opt/activiti/activiti-${ACTIVITI_VERSION}/wars/activiti-admin.war -d /opt/tomcat/webapps/activiti-admin && \
    rm -f /tmp/activiti.zip

# Add mysql connector to application
RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VERSION}.zip -O /tmp/mysql-connector-java.zip && \
    unzip /tmp/mysql-connector-java.zip -d /tmp && \
    cp /tmp/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VERSION}-bin.jar /opt/tomcat/webapps/activiti-rest/WEB-INF/lib/ && \
    cp /tmp/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VERSION}-bin.jar /opt/tomcat/webapps/activiti-app/WEB-INF/lib/ && \
    rm -rf /tmp/mysql-connector-java.zip /tmp/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VERSION}

COPY fs/opt/tomcat/conf/server.xml /opt/tomcat/conf/server.xml
COPY fs/opt/tomcat/conf/tomcat-users.xml /opt/apache-tomcat-${TOMCAT_VERSION}/conf/tomcat-users.xml

EXPOSE 8080

ENTRYPOINT ["sh", "/opt/tomcat/bin/catalina.sh"]
