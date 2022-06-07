# develop stage
FROM node:14.14-alpine

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json .
RUN npm install
RUN npm run build

RUN npm install -g serve
RUN serve -s dist

# COPY . .

# CMD npm run dev --host