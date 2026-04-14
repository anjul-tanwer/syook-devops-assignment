FROM node:18

WORKDIR /app

COPY app.js .

RUN npm init -y && npm install express mongoose

EXPOSE 5000

CMD ["node", "app.js"]
