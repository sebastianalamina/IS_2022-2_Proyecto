# develop stage
FROM node:14.14-alpine as develop-stage

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH


COPY package.json .
RUN npm install

COPY . .

CMD npm run dev --host