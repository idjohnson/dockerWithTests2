FROM node:17.6.0 as base

WORKDIR /code

RUN git clone https://github.com/idjohnson/dockerWithTests2.git && cd dockerWithTests2 && git checkout kaniko && cp package.json .. && cp package-lock.json .. && cp server.js .. && cd ..
ENV NODE_ENV=production
RUN npm ci --production
CMD [ "node", "server.js" ]