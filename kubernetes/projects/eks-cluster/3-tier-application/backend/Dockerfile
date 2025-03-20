# Use the official Node.js image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the backend code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the Node.js server
CMD ["node", "server.js"]