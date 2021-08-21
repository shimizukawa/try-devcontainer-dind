FROM node:14-slim
WORKDIR /frontend/apps
COPY ./apps ./
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]