FROM node:21-alpine

WORKDIR /app

COPY package.json package-lock.json /app/
RUN npm install

COPY . /app

CMD [ "node", "app.js" ]
