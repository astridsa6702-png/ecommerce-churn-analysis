# ecommerce-churn-analysis
Analyzing delivery performance and customer satisfaction using SQL and Excel.

1. Business Problem
   Mengindentifikasi penyebab utama pelanggan memberikan rating rendah yang berpotensi membuat         mereka tidak mau belanja lagi (churn)

2. Tech Stack
   - Database engine     : SQLite (DB Browser for SQLite)
   - Data visualization  : Microsoft Excel
  
3. Data Cleaning Notes
   Pada tahap awal analisis, ditemukan anomali penggandaan data pada tabel 'customers' (mencapai       1,2 juta baris). Untuk menjaga akurasi analisis, mitigasi dilakukan dengan mengubah pendekatan      query menggunakan tabel 'orders' sebagai basis utama analisis (berjumlah ~ 99 ribu baris yang       valid).

4. Key SQL Query
   Query yang digunakan dapat dilihat dalam file bernama "query_analisis.sql"

**Visualization & Insights**

<img width="518" height="372" alt="late_delivery_chart" src="https://github.com/user-attachments/assets/a763b004-73e5-43c4-8f95-742406729546" />

Key insights:
  - Keterlambatan logistik merupakan pemicu utama review yang rendah. Dari seluruh paket yang           pengirimannya telat, 53% di antaranya berujung pada review "Kecewa" (rating 1-2) dari pelanggan.
  - sebagai perbandingan, kelompok dengan review "Puas" (rating 4-5), tingkat keterlambatan hanya       sebesar 3.5%

**Recommendations**
1. Evaluasi kurir: Tim operasional harus mengevaluasi performa mitra logistik pihak ketiga, khususnya di wilayah yang sering mengalami keterlambatan.
2. Kompensasi (Proactive Retention): Perusahaan direkomendasikan untuk mengirimkan voucher kompensasi secara otomatis ke aplikasi pelanggan ketika sistem mendeteksi pengiriman paket yang telah melewati tanggal estimasi, sebelumm pelanggan memberikan rating rendah.
