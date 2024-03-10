FROM node:20.11.1 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build 

FROM node:20.11.1-slim AS final
WORKDIR /app 
COPY --from=build /app .
#COPY --from=build /app/package*.json ./
EXPOSE 3000
CMD ["npm","start"]


