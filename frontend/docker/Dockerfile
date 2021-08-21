FROM node:14-slim
WORKDIR /frontend/apps
COPY ./apps/package*.json ./
RUN npm install
COPY ./apps ./
EXPOSE 3000
CMD ["npm", "start"]