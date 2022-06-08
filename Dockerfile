FROM node:10.15.0
RUN npm install npm@6.4.1
WORKDIR /usr/src/app
COPY package.json /usr/src/app
COPY package-lock.json /usr/src/app
RUN npm install     
COPY . .
WORKDIR /usr/src/app/views
RUN npm install
RUN npx browserslist@latest --update-db && npx browserslist@latest
WORKDIR /usr/src/app
CMD ["npm", "run", "dev"]
