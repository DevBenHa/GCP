FROM openjdk:8-jdk-alpine
COPY target/account.war /home/appmobid/app/account.war
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dpath.property=/home/appmobid/data","-Dconfig.mobid.cors=http://localhost","-jar","/home/appmobid/app/account.war"]
