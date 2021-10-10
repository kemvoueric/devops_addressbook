FROM tomcat:8.0-alpine
COPY  target/webapp.war  /usr/local/tomcat/webapps
