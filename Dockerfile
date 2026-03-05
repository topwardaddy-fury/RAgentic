FROM node@sha256:e4bf2a82ad0a4037d28035ae71529873c069b13eb0455466ae0bc13363826e34
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "index.js"]
