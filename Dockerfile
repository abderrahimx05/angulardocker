#first stage of building angular image
FROM node:lts-bullseye AS build
RUN mkdir -p /app

WORKDIR  /app

COPY package.json /app/
RUN npm install

COPY . /app/
RUN npm run build --prod


#finle stage
FROM nginx:alpine
COPY --from=build /app/dist/helpdesk /usr/share/nginx/html
