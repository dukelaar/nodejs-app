FROM dukelaar/dukelaar

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for production
# RUN npm ci --only=production
RUN npm install --registry  https://artifactory-iva.si.francetelecom.fr/artifactory/api/npm/npmproxy

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
