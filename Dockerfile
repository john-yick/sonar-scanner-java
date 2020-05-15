FROM openjdk:8-jdk-alpine

ENV SONAR_SCANNER_VERSION 4.0.0.1744

RUN apk add --update maven

ADD https://bintray.com/sonarsource/SonarQube/download_file?file_path=org%2Fsonarsource%2Fscanner%2Fcli%2Fsonar-scanner-cli%2F${SONAR_SCANNER_VERSION}%2Fsonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip
RUN unzip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -d /usr/lib && \
    ln -s /usr/lib/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner

RUN mvn -v
RUN which ~/.m2
