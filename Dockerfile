# Dockerfile untuk submission 1 Dicoding Belajar Membangun Arsitektur Microservices

# Gunakan image resmi Node.js 14 sebagai base image
FROM node:14

# Setel direktori kerja di dalam container
WORKDIR /app

# Salin konten direktori saat ini ke dalam container di /app
COPY . /app

# Setel environment variable
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Install dependensi produksi dan bangun aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080
EXPOSE 8080

# Setel perintah default yang akan dijalankan saat container dimulai
CMD ["npm", "start"]