FROM node:19-alpine

WORKDIR /root

CMD ["foundryVTTSource/resources/app/main.js", "--dataPath=/root/foundryVTTData"]
