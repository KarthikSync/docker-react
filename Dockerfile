FROM node:alpine 

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#Install some dependencies
COPY package.json ./
RUN npm install

COPY . .

RUN  npm run build 

FROM nginx
EXPOSE 80
COPY --from=0 /usr/src/app/build /usr/share/nginx/html
