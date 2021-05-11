FROM safepic/kali-light

RUN echo "Acquire::http::proxy \"http://apt.rd.francetelecom.fr:3142\";" > /etc/apt/apt.conf.d/95proxies
RUN echo "Acquire::https::proxy \"http://apt.rd.francetelecom.fr:3142\";" > /etc/apt/apt.conf.d/95proxies
RUN apt update  
RUN apt install npm -y

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8081
CMD [ "node", "index.js" ]
