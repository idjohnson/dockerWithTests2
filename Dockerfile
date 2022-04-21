FROM node:17.6.0 as base

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

FROM base as test
RUN curl -s -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip -o sonarscanner.zip \
  && unzip -qq sonarscanner.zip \
  && rm -rf sonarscanner.zip \
  && mv sonar-scanner-4.7.0.2747-linux sonar-scanner
COPY sonar-scanner.properties sonar-scanner/conf/sonar-scanner.properties
ENV SONAR_RUNNER_HOME=sonar-scanner
ENV PATH $PATH:sonar-scanner/bin
# RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' sonar-scanner/bin/sonar-scanner

RUN npm ci
COPY . .
COPY .git .git
RUN npm run testnyc

RUN sonar-scanner -Dsonar.settings=sonar-scanner/conf/sonar-scanner.properties

FROM base as prod
ENV NODE_ENV=production
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
