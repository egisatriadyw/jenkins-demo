# Use Node.js version 16 on Alpine Linux
FROM alpine:3.18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the entire project files into the working directory in the container
COPY . .

# Run the Vite development server
CMD ["npm", "start"]
