FROM node:20-alpine

# -S => Add System User
# -G => Add the user to a group
# Basically run the app as non-root user
RUN addgroup app && adduser -S -G app app

USER app

WORKDIR /app

# This is done before copying the rest of the files to take advantage of Docker's cache
# If the package.json and package-lock.json files haven't changed, Docker will use the cached deps
COPY package*.json ./

USER root

RUN chown -R app:app .

USER app

RUN npm install

COPY . .

EXPOSE 5173

CMD npm run dev
