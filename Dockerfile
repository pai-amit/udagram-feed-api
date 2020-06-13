# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./
COPY tsconfig*.json ./

# Copy app source
COPY . .

# Install dependencies
RUN npm install
RUN npm run build 

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
CMD ["node", "./www/server.js"]
