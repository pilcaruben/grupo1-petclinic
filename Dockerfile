FROM chrismerchan/alpine-java
LABEL maintainer="rpilca@est.ups.edu.ec"

# SIN slash inicial:
COPY target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /home/springpetclinic-2.3.0.jar

CMD ["java","-jar","/home/springpetclinic-2.3.0.jar"]
