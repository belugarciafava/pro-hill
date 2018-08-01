FROM openjdk:8-jre-alpine
WORKDIR /app
ADD ./target/pro-hill-1.0-SNAPSHOT.jar /app/
CMD ["java", "-Xmx256m","-Dspring.profiles.active=prod","-jar", "/app/pro-hill-1.0-SNAPSHOT.jar"]