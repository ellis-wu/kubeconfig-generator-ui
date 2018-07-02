# Building stage
FROM node:8.9-alpine AS build-env
LABEL maintainer="Ellis Wu<ellis.w@inwinstack.com>"

WORKDIR /kg-ui
COPY . /kg-ui/
RUN npm install && npm run build

# Running stage
FROM nginx:stable-alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-env /kg-ui/dist/ /usr/share/nginx/html

EXPOSE 80
