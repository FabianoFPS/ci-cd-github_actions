FROM node:14
WORKDIR /usr/src/app
COPY . .
RUN npm ci --only=prod
EXPOSE 8000
# CMD NODE_URLS=http://*:$PORT npm start
CMD [ "node", "index.js" ]
USER node