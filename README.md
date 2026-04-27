# 🎬 CineScope - Movie App (Flutter)

---

## 📌 Project Overview

**CineScope** adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna menemukan, mencari, dan menyimpan film favorit mereka. Aplikasi ini terintegrasi dengan Public Movie API (seperti TMDB API) untuk menampilkan data film secara real-time, termasuk kategori **Popular, Top Rated, dan Upcoming**.

Aplikasi ini dikembangkan dengan fokus pada:

- 🧩 Struktur kode modular  
- ⚡ Performa yang responsif  
- 🎨 Pengalaman pengguna yang interaktif  
- 📡 Dukungan offline (caching)  

Dengan tampilan **dark mode modern**, CineScope menghadirkan pengalaman visual yang nyaman dan elegan.

---

## 🚀 Features

### 🏠 Home & Discovery
- Menampilkan daftar film berdasarkan kategori:
  - Popular  
  - Top Rated  
  - Upcoming  
- Navigasi kategori dengan UI yang clean dan interaktif  

---

### 🔍 Search Movie
- Pencarian film berdasarkan judul  
- Menggunakan **async/await + FutureBuilder**  
- UI tetap responsif tanpa lag  

---

### 🎞️ Movie Detail
- Informasi lengkap film:
  - Poster  
  - Deskripsi  
- Tampilan detail clean & readable  
- Bisa menambahkan ke favorit ❤️  

---

### ❤️ Favorites
- Menyimpan film favorit  
- Data tersimpan secara lokal  
- Akses cepat melalui menu favorit  

---

### 📡 Offline Support
- Menggunakan **SharedPreferences**  
- Menampilkan data terakhir saat offline  
- Tidak menampilkan halaman kosong  

---

### ⚠️ Error Handling
- Pesan error user-friendly  
- Tidak menampilkan error teknis  
- Tetap fallback ke data cache  

---

### ✨ Shimmer Loading
- Efek loading modern  
- Transisi halus  
- Meningkatkan user experience  

---

## 🏗️ Architecture & Structure

Aplikasi ini menggunakan pendekatan:

- **Separation of Concerns (SoC)**
- **Provider (State Management)**

---

## 📂 Folder Structure

```
lib/
├── models/       # Data model (Movie)
├── services/     # API & caching
├── providers/    # State management
├── views/        # UI screens
├── widgets/      # Reusable components
```

---

## 🔧 Layer Responsibility

- **Services** → Mengelola API & data (fetch + cache)  
- **Providers** → State management & business logic  
- **Views** → Tampilan UI  
- **Widgets** → Komponen reusable  

---

## 📈 Scalability & Maintainability

Aplikasi dirancang agar mudah dikembangkan:

- ✅ Struktur modular  
- ✅ Logic terpisah dari UI  
- ✅ Reusable components  
- ✅ Mudah menambah fitur tanpa merusak sistem  

Contoh:
- Fitur **Favorite** ditambahkan tanpa mengubah API service  
- Halaman **Detail** dibuat tanpa mengganggu Home  

---

## ⚙️ Technologies Used

- Flutter  
- Dart  
- Provider (State Management)  
- HTTP (API Request)  
- SharedPreferences (Local Storage)  
- Shimmer (Loading Effect)  

---

## 📸 Screenshots

Tambahkan screenshot di sini:

- Home Page  
- Search Feature  
- Loading (Shimmer)  
- Favorite Page  
- Detail Page  

---

## 📦 Installation

```bash
flutter pub get
flutter run
```

---

## 🔑 API Configuration

Gunakan API dari:
https://www.themoviedb.org/

Tambahkan API Key di file:

```
lib/services/api_service.dart
```

Contoh:

```dart
const apiKey = "YOUR_API_KEY";
```

---

## 🔮 Future Improvements

- Pagination / Load More  
- User Authentication  
- TV Shows Integration  
- Advanced Filtering  

---

## 📝 Conclusion

CineScope berhasil menggabungkan:

- 🔗 Integrasi API real-time  
- 🎨 UI modern & responsif  
- 🧩 Arsitektur modular  

Aplikasi ini dirancang agar scalable dan mudah dikembangkan tanpa mengorbankan stabilitas dan kualitas kode.

---