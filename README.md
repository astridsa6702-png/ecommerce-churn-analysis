# E-Commerce Business Performance: Customer Satisfaction & Logistics Analysis

## 1. Project Overview
Proyek ini merupakan analisis bisnis komprehensif  yang bertujuan untuk mengidentifikasi penyebab utama penurunan kepuasan pelanggan (bad reviews) dan memetakan titik penyumbatan pada jalur logistik pengiriman barang perusahaan.

## 2. Tech Stack
**Database Engine: SQLite (DB Browser for SQLite)
**Data Visualization: Microsoft Excel

## 3. Data Cleaning & Mitigasi Anomali
Pada tahap awal, ditemukan anomali berupa penggandaan data pada tabel 'customers' yang membengkak hingga 1,2 juta baris. Untuk menjaga integritas data dan akurasi metrik bisnis, mitigasi dilakukan dengan:
1. Menggunakan tabel 'orders' (~ 99 ribu baris valid) sebagai basis utama analisis transaksi.
2. Menggunakan sub-query 'SELECT DISTINCT' saat melakukan JOIN ke tabel lokasi pelanggan guna memangkas data duplikat secara bersih.

## 4. Key SQL Query
   Query yang digunakan dapat dilihat dalam file bernama:
   - "query_analisis.sql"
   - "rute_logistik_bermasalah.sql"

# Visualization & Insights

**Key Insights Fase 1:**

<img width="518" height="372" alt="late_delivery_chart" src="https://github.com/user-attachments/assets/a763b004-73e5-43c4-8f95-742406729546" />


   - Keterlambatan logistik merupakan pemicu utama review yang rendah. Dari seluruh paket yang           pengirimannya telat, 53% di antaranya berujung pada review "Kecewa" (rating 1-2) dari               pelanggan.
   - Sebagai perbandingan, kelompok dengan review "Puas" (rating 4-5), tingkat keterlambatan hanya       sebesar 3.5%

**Key Insights Fase 2:**

<img width="742" height="457" alt="rute_logistik" src="https://github.com/user-attachments/assets/351b11df-5fab-4fb4-83f1-ef76b515abc6" />


   - Sentralisasi Gudang di Sao Paulo (SP). Seluruh top 9 rute dengan kasus keterlambatan tertinggi      di platfrm berasal dari penjual yang berlokasi di wilayah SP.
   - Bottleneck Utama Rute SP ke RJ. Pengiriman lintas wilayah dari SP ke Rio de Janeiro (RJ)            menyumbang tumpukan masalah terbesar kedua dengan 1396 paket telat dan persentase                   keterlambatan sebesar 14.41%.
   - Efek Jarak Geografis. Rute dengan jarak tempuh lebih jauh seperti menuju Bahia (BA) dan Ceara       (CE) mengalami lonjakan persentasi keterlambatan yang tinggi (masing-masing 14.33% dan 14.81%).


# Business Recommendations
Berdasarkan temuan data, berikut adalah rekomendasi strategis untuk manajemen operasional:
1. Pembangunan Gudang Regional. Perusahaan direkomendasikan untuk membangun gudang penyimpanan regional baru di wilayah RJ (Rio de Janeiro) untuk memotong rantai pasok transportasi antarprovinsi.
2. Kompensasi Proaktif Otomatis. Mengirimkan voucher diskon belanja otomatis ke aplikasi pelanggan jika sistem mendeteksi paket telat melewati batas estimasi, guna meredam potensi rating bintang 1-2.
3. Restrukturisasi SLA Mitra Kurir Lintas Wilayah: Melakukan evaluasi mendalam atau mengganti vendor kurir pihak ketiga khusus rute jarak jauh (SP-BA dan SP-CE) dengan menerapkan penalti finansial tegas jika late percentage melebihi batas 10%.
