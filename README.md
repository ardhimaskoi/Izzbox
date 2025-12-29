# 🎬 Izzbox — Aplikasi Movie Diary Berbasis Flutter

Izzbox adalah aplikasi movie diary berbasis Flutter yang terinspirasi dari Letterboxd.  
Aplikasi ini berfokus pada pengembangan frontend, pengelolaan state lokal, serta interaksi pengguna tanpa menggunakan backend.

Project ini dibuat sebagai portofolio pengembangan mobile, khususnya untuk menunjukkan pemahaman dasar hingga menengah dalam pengembangan aplikasi Flutter.

---

## ✨ Fitur Utama

- Menampilkan daftar film lengkap dengan poster
- Menandai film sebagai Liked dan Watched
- Menulis review pribadi untuk film
- Halaman profil yang menampilkan:
  - Jumlah film yang ditonton
  - Jumlah film yang disukai
  - Daftar film yang direview oleh pengguna
- Tampilan dark theme yang konsisten

---

## 🧠 Konsep yang Diterapkan

- Local state management menggunakan `setState`
- Single source of truth untuk data film
- Pengiriman state antar halaman melalui constructor
- Pemisahan struktur kode:
  - `models` → data
  - `pages` → halaman UI
  - `widgets` → komponen reusable
- Pengambilan keputusan UI/UX yang sederhana dan tidak berlebihan

---

## 🛠️ Teknologi yang Digunakan

- Flutter
- Dart
- Material Design
- Network Image (TMDB public image CDN untuk keperluan demo)
- Tanpa backend (frontend-only)

---


