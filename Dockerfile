# Imagen base oficial de Node.js
FROM node:20

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de dependencias
COPY package.json yarn.lock ./

# Instala las dependencias usando Yarn
RUN yarn install --frozen-lockfile

# Copia el resto del código fuente al contenedor
COPY . .

# Compila la aplicación NestJS
RUN yarn build

# Expone el puerto por el que corre la app NestJS
EXPOSE 3000

# Comando por defecto para ejecutar la app en modo producción
CMD ["yarn", "start:dev"]

