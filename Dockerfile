FROM openjdk:8-jre-alpine

ENV SONAR_SCANNER_VERSION 4.0.0.1744
ENV MVN_VERSION 3.6.3

ADD https://bintray.com/sonarsource/SonarQube/download_file?file_path=org%2Fsonarsource%2Fscanner%2Fcli%2Fsonar-scanner-cli%2F${SONAR_SCANNER_VERSION}%2Fsonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip
RUN unzip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -d /usr/lib && \
    ln -s /usr/lib/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner

ADD https://mirror.bit.edu.cn/apache/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.zip /tmp/apache-maven-${MVN_VERSION}-bin.zip
RUN unzip /tmp/apache-maven-${MVN_VERSION}-bin.zip
RUN ls
RUN export PATH=/apache-maven-${MVN_VERSION}/bin:$PATH
RUN mvn -v