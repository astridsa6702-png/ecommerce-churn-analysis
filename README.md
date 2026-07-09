# E-Commerce Business Performance: Customer Satisfaction & Logistics Analysis

## 1. Project Overview
Proyek ini adalah platform analisis bisnis komprehensif yang didedikasikan untuk mengupas performa operasional, logistik, dan komersial dari dataset e-commerce Olist (Brazil). 

Proyek ini dirancang secara modular dengan pendekatan multi-fase, dengan membedah data mentah dari berbagai sudut pandang strategis guna menghasilkan rekomendasi yang konkret untuk tingkat eksekutif.

### Modul Analisis yang Tersedia (Fase Aktif):
*   Fase 1: Customer Satisfaction Analysis: Menemukan akar penyebab utama bad reviews pelanggan.
*   Fase 2: Geographic & Logistics Performance: Memetakan bottleneck rute pengiriman antarnegara bagian.
*   Fase 3: Product Category Matrix (Revenue vs Quality): Mengaudit kategori produk yang menghasilkan omset tinggi namun memiliki masalah kualitas.
*   *(Fase berikutnya akan terus diperbarui seiring berjalannya eksplorasi data)*

### Data Source
Dataset yang digunakan dalam analisis ini adalah **Brazilian E-Commerce Public Dataset by Olist** yang diambil langsung dari Kaggle. 

**Link Dataset:** [Kaggle - Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data)

*Catatan: Dataset ini berisi 100 ribu data pesanan dari tahun 2016 hingga 2018 di Brazil, yang mencakup informasi status pesanan, harga, performa pembayaran, lokasi pelanggan, hingga ulasan produk asli.*

## 2. Tech Stack
* Database Engine: SQLite (DB Browser for SQLite)
* Data Visualization: Microsoft Excel

## 3. Data Cleaning & Mitigasi Anomali
Pada tahap awal, ditemukan anomali berupa penggandaan data pada tabel `customers` yang membengkak hingga 1,2 juta baris. Untuk menjaga integritas data dan akurasi metrik bisnis, mitigasi dilakukan dengan:
1. Menggunakan tabel `orders` (~ 99 ribu baris valid) sebagai basis utama analisis transaksi.
2. Menggunakan sub-query `SELECT DISTINCT` saat melakukan `JOIN` ke tabel lokasi pelanggan guna memangkas data duplikat secara bersih.

## 4. Key SQL Query
   Query yang digunakan dapat dilihat dalam file bernama:
   - `query_analisis.sql`
   - `rute_logistik_bermasalah.sql`
   - `analisa_produk.sql`

# Visualization & Insights

**Key Insights Fase 1:**

<img width="518" height="372" alt="late_delivery_chart" src="https://github.com/user-attachments/assets/a763b004-73e5-43c4-8f95-742406729546" />


   - Keterlambatan logistik merupakan pemicu utama review yang rendah. Dari seluruh paket yang           pengirimannya telat, 53% di antaranya berujung pada review "Kecewa" (rating 1-2) dari               pelanggan.
   - Sebagai perbandingan, kelompok dengan review "Puas" (rating 4-5), tingkat keterlambatan hanya       sebesar 3.5%

**Key Insights Fase 2:**

<img width="742" height="457" alt="rute_logistik" src="https://github.com/user-attachments/assets/5a6b43c4-e80f-408f-ac47-4ec82a236169" />


   - Sentralisasi Gudang di Sao Paulo (SP). Seluruh top 9 rute dengan kasus keterlambatan tertinggi      di platfrm berasal dari penjual yang berlokasi di wilayah SP.
   - Bottleneck Utama Rute SP ke RJ. Pengiriman lintas wilayah dari SP ke Rio de Janeiro (RJ)            menyumbang tumpukan masalah terbesar kedua dengan 1396 paket telat dan persentase                   keterlambatan sebesar 14.41%.
   - Efek Jarak Geografis. Rute dengan jarak tempuh lebih jauh seperti menuju Bahia (BA) dan Ceara       (CE) mengalami lonjakan persentasi keterlambatan yang tinggi (masing-masing 14.33% dan 14.81%).

**Key Insights Fase 3:**

<img width="766" height="517" alt="Analisa_produk" src="https://github.com/user-attachments/assets/711604f0-ef07-4ee0-8edf-1cd8a011376a" />


   - Kategori Andalan (beleza_saude). Kategori kecantikan & kesehatan menjadi penyumbang pendapatan tertinggi platform sebesar 1.263.138, sekaligus menjaga tingkat kepuasan pelanggan yang sangat baik dengan rata-rata rating 4,14. Kategori ini adalah produk andalan utama platform yang wajib dipertahankan kualitasnya.
   - Produk yang perlu diperhatikan. Kategori perlengkapan rumah (cama_mesa_banho) mencatatkan jumlah pesanan terbanyak (9.417 orders), namun memiliki performa kualitas terendah di tiga besar dengan rating rata-rata jatuh ke angka 3,9. Hal ini mengindikasikan adanya isu massal pada ekspektasi kualitas produk atau kesesuaian deskripsi dari seller. Hal yang sama juga terjadi pada kategori informatica_acessorios dan moveis_decoracao yang ratingnya di bawah 4.

# Business Recommendations
Berdasarkan temuan data, berikut adalah rekomendasi strategis untuk manajemen operasional:
1. Pembangunan Gudang Regional. Perusahaan direkomendasikan untuk membangun gudang penyimpanan regional baru di wilayah RJ (Rio de Janeiro) untuk memotong rantai pasok transportasi antarprovinsi.
2. Kompensasi Proaktif Otomatis. Mengirimkan voucher diskon belanja otomatis ke aplikasi pelanggan jika sistem mendeteksi paket telat melewati batas estimasi, guna meredam potensi rating bintang 1-2.
3. Restrukturisasi SLA Mitra Kurir Lintas Wilayah. Melakukan evaluasi mendalam atau mengganti vendor kurir pihak ketiga khusus rute jarak jauh (SP-BA dan SP-CE) dengan menerapkan penalti finansial tegas jika late percentage melebihi batas 10%.
4. Audit Seller untuk Kategori Kritis (Rating < 4.0). Disarankan untuk melakukan audit performa dan pengetatan kurasi kualitas produk khusus untuk seller di kategori `cama_mesa_banho`, `informatica_acessorios`, dan `moveis_decoracao`. Berikan sanksi berupa penurunan visibilitas toko bagi seller yang konsisten menyumbang rating di bawah bintang 3 guna menyelamatkan kepuasan pelanggan jangka panjang.
