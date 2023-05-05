FROM node:16-alpine

# RUN npm install -g vite
RUN npm install -g @vue/cli
RUN npm install @vue/cli-service -g
RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# EXPOSE 8080
# CMD ["npm", "run", "serve"]


EXPOSE 8080
CMD [ "http-server", "dist" ]

# EXPOSE 8080
# CMD ["run", "vue-cli-service serve"]