FROM maven:3.6-openjdk-8-slim
WORKDIR /usr/src/test
COPY . .
RUN mvn clean compile vertx:package
EXPOSE 8888 8888
CMD java -jar target/*.jar
