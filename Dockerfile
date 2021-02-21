FROM node:14.13.1-slim as builder

WORKDIR /app

COPY package.json /app

RUN yarn install && yarn cache clean

COPY . /app

RUN yarn run build

FROM node:14.13.1-slim as deploy

RUN yarn global add serve

WORKDIR /app

COPY --from=builder /app/build .

CMD ["serve", "-p", "3000", "-s", "."]

