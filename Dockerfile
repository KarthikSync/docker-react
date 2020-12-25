FROM node:alpine as builder

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#Install some dependencies
COPY package.json ./
RUN npm install

COPY . .

RUN  npm run build 

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
