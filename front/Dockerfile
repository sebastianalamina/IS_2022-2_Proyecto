# develop stage
FROM node:14.14-alpine

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

RUN npm install -g serve
CMD serve -s dist



# CMD npm run dev --host