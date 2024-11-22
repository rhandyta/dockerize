# Step 1: Build the application
FROM node:22 AS builder
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the Next.js app
RUN npm run build

# Step 2: Run the application
FROM node:18 AS runner
WORKDIR /app

# Copy build artifacts from builder
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/public ./public

# Install production dependencies
RUN npm install --only=production

# Expose the default Next.js port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
