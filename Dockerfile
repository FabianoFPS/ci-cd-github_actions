# BUILD STAGE
FROM node:14.18.1-slim AS BUILDER
LABEL maintainer="Fabiano F. P. Stoffel <ffpthai@gmail.com> (https://www.linkedin.com/in/fabianostoffel/)"

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build

# RUN ls -la

# RUN STAGE
FROM node:14.18.1-alpine3.13

# RUN apk add busybox=1.32.1-r7 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

WORKDIR /app

COPY --from=BUILDER /usr/src/app/dist ./dist
COPY --from=BUILDER /usr/src/app/node_modules ./node_modules

EXPOSE 8000

# creat group and user
# RUN groupadd -r groupuserrunapp && useradd -g groupuserrunapp userrunapp
# set ownership and permissions
# RUN chown -R groupuserrunapp:userrunapp /app
# switch to user
# USER userrunapp

USER node

# RUN pwd && ls -la

CMD [ "node", "./dist/index.js" ]
