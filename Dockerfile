FROM debian:sid-slim

RUN apt update && apt install -y curl unzip
RUN curl https://bun.sh/install | bash

WORKDIR /app
COPY package.json bun.lockb /
RUN /root/.bun/bin/bun install

COPY . .
EXPOSE 3000
ENTRYPOINT ["/root/.bun/bin/bun", "index.js"]
