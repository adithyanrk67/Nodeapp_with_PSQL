FROM ubuntu:22.04

RUN apt update && apt install -y nodejs npm

WORKDIR /home/my-website

RUN npm init -y
RUN npm install express pg ejs
RUN npm install -g pm2 -y

COPY server.js /home/my-website
COPY views /home/my-website/views

EXPOSE 3040

CMD ["pm2-runtime", "start", "server.js"]
