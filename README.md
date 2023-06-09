# Mini Project 1 Analisis Kinerja Bisnis E-Commerce dengan SQL 
Menganalisis tiga aspek yang berkaitan dengan kinerja bisnis perusahaan. Ketiga aspek tersebut adalah pertumbuhan pelanggan, kualitas produk dan tipe pembayaran.  

## Ringkasan
Dalam suatu perusahaan mengukur performa bisnis sangatlah penting untuk melacak, memantau, dan menilai keberhasilan atau kegagalan dari berbagai proses bisnis. Oleh karena itu, dalam paper ini akan menganalisa performa bisnis untuk sebuah perusahan eCommerce,  dengan memperhitungkan beberapa metrik bisnis yaitu pertumbuhan pelanggan, kualitas produk, dan tipe pembayaran.

### 1. Data Preparation
Menjadikan data mentah menjadi data yang siap diolah. 
#### ERD (Entity Relationship Diagram)

![ERD](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/4b90e146-3e31-42f3-b076-1c69156150a8)

Sebelum memulai memproses data, tahap paling awal yang dilakukan adalah mempersiapkan data mentah menjadi data terstruktur dan siap diolah. Pada case ini, pertama-tama memasukkan data dengan format csv ke dalam tabel-tabel database mengunakan PostgreSQL. Kemudian entity relationship antar tabel-tabel tersebut. 

Berikut merupakan langkah-langkah untuk membuat ERD (Entity Relationship Diagram):
1) Pertama download file “Dataset.rar”, kemudian ekstrak file tersebut.
2) Kemudian membuat database baru beserta tabel-tabelnya untuk data yang sudah disiapkan. Pada saat membuat tabel perhatikan data type tiap kolom. 
3) Kemudian importing data csv ke dalam database.
4) Selanjutnya membuat entity relationship antar tabel. Untuk membuatnya, perhatikan kolom-kolom yang dapat berfungsi sebagai primary key. Pada data case ini kolom product_id, order_id, zip_code_prefix, seller_id, customer_id menjadi primary key. Primary key tesebut dapat dihubungkan secara one-to-many relation / many-to-many relation ke tabel-tabel yang mempunyai kolom sama. Dalam hal ini perlu diperhatikan kesesuaian data type masing-masing kolom. 
Setelah selesai melakukan entity relationship, export ERD dalam bentuk gambar. 

### 2. Analisis Pertumbuhan Aktivitas Pelanggan Tahunan
Menganalisis aktivitas customer seperti jumlah customer aktif, jumlah customer baru, jumlah customer yang melakukan repeat order dan rata-rata transaksi yang dilakukan customer setiap tahun.

Berikut merupakan tabel yang berisi rata-rata jumlah customer aktif bulanan (average_monthly_active_user), jumlah customer baru (jumlah_new_customer), jumlah customer yang melakukan pembelian secara berulang/lebih dari satu kali (jumlah_repeating_customer) dan rata-rata jumlah order yang dilakukan customer (avg_orders_per_customer) pada masing-masing tahun 2016, 2017 dan 2018.

![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/07a1dda5-ab46-4cd5-89ce-bfb754ea02f8)

#### 1) Customer Aktif Bulanan
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/9c747bf1-a674-45bf-879a-702918b33e43)
Berdasarkan grafik Monthly Active User per Tahun, Rata-rata jumlah customer aktif bulanan tertinggi pada tahun 2018. sedangkan paling rendah pada tahun 2016. Kenaikan jumlah customer paling signifikan terjadi pada tahun 2016 ke 2017.
#### 2) Jumlah Customer Baru per Tahun 
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/5b048679-923b-4bc7-91f9-fef39b4e2e49)
Berdasarkan grafik New Customer per Year, Rata-rata jumlah customer baru terjadi kenaikan setiap tahun. Kenaikan signifikan terjadi pada tahun 2016 ke 2017. sedangkan jumlah customer baru paling banyak terjadi pada tahun 2018. 
#### 3) Jumlah Customer yang Melakukan Repeat Order
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/4ffa88f0-0703-44e9-a0e9-631e4b5f6eb8)
Berdasarkan grafik Repeat Order Customer per Year, Jumlah customer yang melakukan repeat order mengalami kenaikan signifikan pada tahun 2016 ke 2017. Namun mengalami penurunan pada tahun 2017 ke 2018.  
#### 4) Rata-rata Frekuensi Order per Tahun 
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/c2262539-fcd4-45fb-ac2d-05f0e9f32093)
Berdasarkan grafik rata-rata frekuensi order per tahun, rata-rata frekuensi order mengalami kenaikan signifikan pada tahun 2016 ke 2017. Namun mengalami penurunan pada tahun 2017 ke 2018.  

### 3. Analisis Kualitas Kategori Produk Tahunan
Menganalisis kualitas produk dalam eCommerce dapat memberikan keputusan dalam mengembangkan bisnis. Pada tahap ini akan menganalisis kinerja dari masing-masing kategori produk yang ada dan bagaimana kaitannya dengan pendapatan perusahaan.

Berikut merupakan tabel yang berisi total revenue per tahun, jumlah cancel order per tahun, top kategori produk yang menghasilkan revenue terbesar per tahun, kategori produk yang mengalami cancel order terbanyak per tahun.
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/1a389286-0eb6-4a95-926d-13f204f0dc0f)
#### 1) Tota Revenue per Tahun
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/8160fe6b-19b3-4f65-a32b-5d7d787e778b)

Berdasarkan grafik, revenue perusahaan tertinggi terjadi pada tahun 2018. sedangkan paling rendah pada tahun 2016. Kenaikan revenue paling signifikan terjadi pada tahun 2016 ke 2017.
#### 2) Jumlah Cancel Order per Tahun
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/c76857a7-d85e-49dc-9029-cecd0d4ae62f)

Berdasarkan grafik, jumlah cancel order tertinggi terjadi pada tahun 2018. sedangkan paling rendah pada tahun 2016. Kenaikan jumlah cancel order paling signifikan terjadi pada tahun 2016 ke 2017.
#### 3) Top Kategori dengan Revenue Tertinggi per Tahun
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/59f94f91-4d94-4784-a19b-6a71d8d0b252)

Berdasarkan grafik, top produk pada tahun 2016 adalah produk furniture, tahun 2017 adalah produk bed_bath_table dan tahun 2018 adalah health beauty. Sedangkan revenue paling tinggi terjadi pada tahun 2018 dengan total revenue 866810,34. 
#### 4) Kategori dengan Cancel Tertinggi per Tahun
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/93aff06c-c015-43a3-bbc2-17ec76a91af0)

Berdasarkan grafik, produk dengan jumlah cancel tertinggi pada tahun 2016 adalah produk toys, tahun 2017 adalah produk sport_leisure dan tahun 2018 adalah health beauty. Sedangkan jumlah cancel paling tinggi terjadi pada tahun 2018 dengan total cancel order sebanyak 27. 

### 4. Analisis Penggunaan Jenis Pembayaran Tahunan
Dalam bisnis e-commerce, tipe pembayaran yang umum digunakan adalah open payment types. Hal ini menjadikan customer dapat menyesuaikan dan memilih tipe pembayaran yang tersedia. Pada tahap ini akan menganalisis kinerja dari tipe pembayaran yang ada dan memberikan
insight untuk menciptakan strategi kerjasama dengan perusahaan penyedia jasa pembayaran dengan lebih baik.

Berikut merupakan tabel yang berisi jumlah masing-masing tipe pembayaran tiap-tiap tahun. 
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/b5045cf2-bd5d-46e2-acd6-0effac5fb598)

#### Jumlah Penggunaan Tipe Pembayaran per Tahun
![image](https://github.com/hadasadida/Mini-Project-1_Analyzing-eCommerce-Business-Performance-with-SQL/assets/124650679/7adcf5ed-d1a7-4b0c-8ec8-8974e9542368)

Berdasarkan grafik, payment types yang paling banyak digunakan adalah credit card baik pada tahun 2017 maupun 2018. Sedangkan payment types dengan voucher mengalami penurunan dari tahun 2017 ke 2018. Hal ini mungkin terjadi karena kerja sama/promosi perusahaan dengan kartu debit tertentu dan terjadi penurunan promosi dengan voucher. 























