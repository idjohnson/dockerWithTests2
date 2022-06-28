FROM node:17.6.0 as base

WORKDIR /code

FROM base as prod
ENV NODE_ENV=production
COPY . .
RUN npm ci --production
CMD [ "node", "server.js" ]
