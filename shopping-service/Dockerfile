FROM node:12.18.0-buster AS builder

# Run as an unprivileged user
WORKDIR /home/node
USER node

# Install app dependencies
COPY package*.json ./
COPY patches patches/
RUN npm ci

# Build app
COPY . .
RUN npm run build

# Remove dev packages
RUN npm prune --production

# Create production image
FROM node:12.18.0-buster-slim

# Run as an unprivileged user
WORKDIR /home/node
USER node

# Install app
COPY package*.json ./
COPY proto proto/
COPY --from=builder /home/node/node_modules node_modules/
COPY --from=builder /home/node/build build/
COPY --from=builder /home/node/user-function.desc .

# Run
EXPOSE 8080
CMD ["npm", "start"]
