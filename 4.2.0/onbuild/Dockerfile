FROM index.xxxxx.com/node:4.2.0

RUN mkdir -p /app
WORKDIR /app

ONBUILD COPY . /app
ONBUILD RUN npm install
