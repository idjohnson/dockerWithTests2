FROM node:17.6.0 as base

WORKDIR /code

COPY ../package.json package.json

FROM base as prod
ENV NODE_ENV=production
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
