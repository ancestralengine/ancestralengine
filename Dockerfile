# Use a lightweight base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Copy source
COPY . .

# Build static assets
RUN npm run build

# Install static server
RUN npm install -g serve

# Cloud Run listens on 8080
EXPOSE 8080

# Serve the built app
CMD ["serve", "-s", "dist", "-l", "8080"]
