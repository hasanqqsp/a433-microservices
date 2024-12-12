# Menggunakan image node.js versi terbaru sebagai base image
FROM node:latest

# Menentukan direktori kerja di dalam container
WORKDIR /app

# Menyalin package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Menginstall dependencies
RUN npm install

# Menyalin seluruh file ke dalam container
COPY . .

# Menjalankan perintah untuk menjalankan index.js
CMD ["node", "index.js"]