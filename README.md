# E-Commerce Business Performance: Customer Satisfaction & Logistics Analysis

## 1. Project Overview
Proyek ini adalah platform analisis bisnis komprehensif yang didedikasikan untuk mengupas performa operasional, logistik, dan komersial dari dataset e-commerce Olist (Brazil). 

Proyek ini dirancang secara modular dengan pendekatan multi-fase, dengan membedah data mentah dari berbagai sudut pandang strategis guna menghasilkan rekomendasi yang konkret untuk tingkat eksekutif.

### Modul Analisis yang Tersedia (Fase Aktif):
*   Fase 1: Customer Satisfaction Analysis. Menemukan akar penyebab utama bad reviews pelanggan.
*   Fase 2: Geographic & Logistics Performance. Memetakan bottleneck rute pengiriman antarnegara bagian.
*   Fase 3: Product Category Matrix (Revenue vs Quality). Mengaudit kategori produk yang menghasilkan omset tinggi namun memiliki masalah kualitas.
*   Fase 4: Payment Behavior Analysis. Memetakan tren pembayaran dan perilaku cicilan pelanggan
*   Fase 5: Analisis Retensi & Loyalitas Pelanggan
*   (_Fase berikutnya akan terus diperbarui seiring berjalannya eksplorasi data_)

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
   - `payment_behavior.sql`
   - `bulan_cicilan.sql`
   - `repeat_order.sql`
   - `churn_logistik.sql`

# Visualization & Insights

**Key Insights Fase 1:**

<img width="518" height="372" alt="late_delivery_chart" src="https://github.com/user-attachments/assets/a763b004-73e5-43c4-8f95-742406729546" />


   - Keterlambatan logistik merupakan pemicu utama review yang rendah. Dari seluruh paket yang           pengirimannya telat, 53% di antaranya berujung pada review "Kecewa" (rating 1-2) dari               pelanggan.
   - Sebagai perbandingan, kelompok dengan review "Puas" (rating 4-5), tingkat keterlambatan hanya       sebesar 3.5%

**Key Insights Fase 2:**

<img width="742" height="457" alt="rute_logistik" src="https://github.com/user-attachments/assets/5a6b43c4-e80f-408f-ac47-4ec82a236169" />


   - Sentralisasi Gudang di Sao Paulo (SP). Seluruh top 9 rute dengan kasus keterlambatan tertinggi      di platfrm berasal dari penjual yang berlokasi di wilayah SP.
   - _Bottleneck_ Utama Rute SP ke RJ. Pengiriman lintas wilayah dari SP ke Rio de Janeiro (RJ)          menyumbang tumpukan masalah terbesar kedua dengan 1396 paket telat dan persentase                   keterlambatan sebesar 14.41%.
   - Efek Jarak Geografis. Rute dengan jarak tempuh lebih jauh seperti menuju Bahia (BA) dan Ceara       (CE) mengalami lonjakan persentasi keterlambatan yang tinggi (masing-masing 14.33% dan 14.81%).

**Key Insights Fase 3:**

<img width="766" height="517" alt="Analisa_produk" src="https://github.com/user-attachments/assets/711604f0-ef07-4ee0-8edf-1cd8a011376a" />


   - Kategori Andalan (`beleza_saude`). Kategori kecantikan & kesehatan menjadi penyumbang pendapatan tertinggi platform sebesar 1.263.138, sekaligus menjaga tingkat kepuasan pelanggan yang sangat baik dengan rata-rata rating 4,14. Kategori ini adalah produk andalan utama platform yang wajib dipertahankan kualitasnya.
   - Produk yang perlu diperhatikan. Kategori perlengkapan rumah (`cama_mesa_banho`) mencatatkan jumlah pesanan terbanyak (9.417 orders), namun memiliki performa kualitas terendah di tiga besar dengan rating rata-rata jatuh ke angka 3,9. Hal ini mengindikasikan adanya isu massal pada ekspektasi kualitas produk atau kesesuaian deskripsi dari seller. Hal yang sama juga terjadi pada kategori `informatica_acessorios` dan `moveis_decoracao` yang ratingnya di bawah 4.

**Key Insights Fase 4:**

<img width="671" height="482" alt="payment_behaviour" src="https://github.com/user-attachments/assets/424f7d40-c67e-45ce-b79d-f2a559f791a4" />

   - Dominasi Mutlak Kartu Kredit: Metode `credit_card` mendominasi kue perputaran uang platform secara mutlak dengan menguasai 79% total omset (mencapai 12.444.708,88 dari total 76.061 transaksi). Angka ini jauh meninggalkan `boleto` yang berada di posisi kedua (18%).
   - Nilai Keranjang Belanja (_Ticket Size_) Tertinggi. Pengguna kartu kredit tidak hanya menang dari segi kuantitas, tetapi juga mencatatkan rata-rata nilai belanja tertinggi per transaksi, yaitu 162,99.
   - Rata-rata Tenor Cicilan Sehat. Secara keseluruhan, rata-rata durasi cicilan pengguna kartu kredit berada di angka 3,5 bulan, mengindikasikan perputaran piutang yang relatif sehat bagi mitra finansial platform.
   - Metode Non-Cicilan Cenderung Konservatif. Metode pembayaran instan lunas seperti `boleto` (144,85) dan `debit_card` (141,44) memiliki rata-rata belanja yang lebih rendah, sementara pengguna `voucher` hanya menghabiskan rata-rata 62,50 per transaksi.


<img width="700" height="467" alt="bulan_cicilan" src="https://github.com/user-attachments/assets/9654884a-14e7-48f7-af01-9a3d4c350c64" />


   - Fenomena Lonjakan Angka Psikologis (Tenor Genap). Terjadi anomali distribusi data yang sangat masif pada pilihan tenor tertentu. Konsumen secara drastis menumpuk pada tenor 10 bulan (5.328 pesanan dengan total nilai 2,21 Juta) dan 8 bulan (4.268 pesanan dengan total nilai 1,31 Juta)
   - Penolakan Terhadap Tenor Ganjil Jangka Panjang. Kebiasaan konsumen Brazil di platform ini sangat menghindari tenor ganjil di atas 6 bulan. Sebagai contoh, tenor 9 bulan hanya mencatatkan 644 pesanan dan tenor 11 bulan hancur di angka 23 pesanan saja. Hal ini membuktikan bahwa keputusan memilih cicilan sangat dipengaruhi oleh program promosi eksternal (seperti kampanye 0% installment / cicilan bebas bunga untuk tenor genap).

**Key Insights Fase 5:**

<img width="593" height="352" alt="repeat_order" src="https://github.com/user-attachments/assets/e2bcfcc4-f912-4f26-bfc0-5353be0c07bf" />

   - _One-Time Buyer Syndrome_ (Krisis Retensi Akut). Grafik secara ekstrem menunjukkan adanya masalah _retention_ yang sangat fatal di platform Olist. Sebanyak 97.0% pelanggan hanya berbelanja 1 kali seumur hidup kemudian langsung meninggalkan platform (_churn_).
   - Rendahnya Loyalitas Pengguna. Angka _Repeat Order Rate_ total platform ini (pelanggan yang kembali belanja 2 kali atau lebih) hanya menyentuh 3.0% (2.76% untuk 2 kali order, dan sisanya di bawah 0.2%).
   - Implikasi Bisnis Tinggi. Tingkat _retensi_ di bawah 5% mengindikasikan bahwa perusahaan terus-menerus "bakar duit" (_high Customer Acquisition Cost_) untuk mendatangkan pengguna baru lewat iklan, namun gagal mempertahankan mereka akibat buruknya _post-purchase experience_ (pengalaman setelah pembelian pertama).

<img width="600" height="357" alt="late_rate" src="https://github.com/user-attachments/assets/619ec064-6d68-48cb-9984-680a69c6791e" />

   - Mematahkan Asumsi Logistik. Hasil analisis secara mengejutkan mematahkan hipotesis awal. Keterlambatan pengiriman paket bukan alasan utama mengapa 97% pelanggan kabur setelah pembelian pertama.
   - Pelanggan Setia Lebih Toleran. Kelompok pelanggan setia (_Loyal_) tercatat memiliki persentase pengalaman paket telat yang lebih tinggi, yaitu 12.78%. Sementara kelompok pelanggan yang kabur (_Churned_) angka keterlambatannya justru lebih rendah di angka 8.19%.
   - Pengalaman logistik yang buruk terbukti tidak langsung memicu penolakan konsumen untuk bertransaksi kembali. Fokus harus dialihkan kepada investigasi ke variabel lain yang lebih krusial, seperti kesesuaian kualitas fisik produk terhadap deskripsi di aplikasi atau strategi harga kompetitor.

# Business Recommendations
Berdasarkan temuan data, berikut adalah rekomendasi strategis untuk manajemen operasional:
1. Pembangunan Gudang Regional. Perusahaan direkomendasikan untuk membangun gudang penyimpanan regional baru di wilayah RJ (Rio de Janeiro) untuk memotong rantai pasok transportasi antarprovinsi.
2. Kompensasi Proaktif Otomatis. Mengirimkan voucher diskon belanja otomatis ke aplikasi pelanggan jika sistem mendeteksi paket telat melewati batas estimasi, guna meredam potensi rating bintang 1-2.
3. Restrukturisasi SLA Mitra Kurir Lintas Wilayah. Melakukan evaluasi mendalam atau mengganti vendor kurir pihak ketiga khusus rute jarak jauh (SP-BA dan SP-CE) dengan menerapkan penalti finansial tegas jika late percentage melebihi batas 10%.
4. Audit Seller untuk Kategori Kritis (Rating < 4.0). Disarankan untuk melakukan audit performa dan pengetatan kurasi kualitas produk khusus untuk seller di kategori `cama_mesa_banho`, `informatica_acessorios`, dan `moveis_decoracao`. Berikan sanksi berupa penurunan visibilitas toko bagi seller yang konsisten menyumbang rating di bawah bintang 3 guna menyelamatkan kepuasan pelanggan jangka panjang.
5. Optimalisasi Kemitraan Perbankan (Campaign 8 & 10 Bulan) Mengingat tenor 8 dan 10 bulan adalah favorit konsumen, perusahaan harus memanfaatkan daya tawar ini untuk bernegosiasi dengan bank penerbit kartu kredit utama guna mendapatkan subsidi biaya transaksi (MDR fee) yang lebih murah pada skema cicilan tersebut.
6. Strategi Insentif Pembayaran Instan (Boleto & Debit). Guna mempercepat perputaran uang tunai (cash flow) langsung dan mengurangi ketergantungan pada pencairan dana kartu kredit, platform direkomendasikan membuat program promo cashback kecil (misal 1-2%) khusus untuk transaksi menggunakan `debit_card` dan `boleto`.
7. Penerapan Post-Purchase Quality Audit Survey. Mengingat tingginya angka _churn_ (97%) bukan disebabkan oleh keterlambatan logistik, sebaiknya meluncurkan survei otomatis spesifik via aplikasi/email 3 hari setelah status barang diterima oleh _first-time buyer_. Fokus survei diarahkan pada kesesuaian fisik produk terhadap deskripsi dan kualitas ekspektasi barang untuk memetakan akar masalah kepergian mereka.
8. Program Akselerasi Transaksi Kedua (_"Welcome Back Coupon"_). Untuk memotong fenomena _One-Time Buyer Syndrome_, disarankan merancang skema insentif khusus berupa kupon diskon transaksi kedua dengan masa kedaluwarsa ketat (misal: diskon 20% hanya berlaku dalam 14 hari sejak transaksi pertama selesai) demi memicu habit belanja ulang sesegera mungkin.
