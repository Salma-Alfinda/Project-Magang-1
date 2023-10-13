# Gunakan node:alpine sebagai base image
FROM node:alpine

# Set direktori kerja di dalam kontainer
WORKDIR /app

# Menyalin package.json dan package-lock.json ke dalam kontainer
COPY package*.json ./

# Menginstal dependensi
RUN npm install

# Menyalin seluruh proyek ke dalam kontainer
COPY . .

# Membuat build produksi (opsional)
RUN npm run build

# Menjalankan aplikasi React
CMD ["npm", "start"]
