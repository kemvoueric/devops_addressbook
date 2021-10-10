FROM tomcat:8.0-alpine
COPY  target/addressbook.war   /usr/local/tomcat/addressbook
