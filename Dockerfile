# Start with fully-featured Node.js base image
FROM node:latest AS build

WORKDIR /home/node/app

# Copy dependency information and install all dependencies
COPY package*.json ./

# Install dependencies from packacke-lock.json
RUN npm ci

# Copy source code (and all other relevant files)
COPY . .

# Build code
RUN npm run build

# Run-time stage
FROM node:current-alpine

WORKDIR /home/node/app

# Copy dependency information and install production-only dependencies
COPY package*.json ./
RUN npm ci --production

# Copy results from previous stage
COPY --from=build /home/node/app/dist ./dist

CMD [ "node", "dist/index.js" ]

# Set non-root user and expose port 8080
USER node
EXPOSE 8080
