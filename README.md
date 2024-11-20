# floemin mobile version

## Tugas 7: Elemen Dasar Flutter

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya!
Stateless Widget adalah widget yang statis/tetap di mana state/keadaannya tidak dapat berubah setelah dibuat. Widget ini cocok untuk tampilan yang tidak memerlukan perubahan data secara dinamis. Contoh pada proyek: MyApp, MyHomePage, ItemCard, dan InfoCard adalah stateless widget karena tampilannya tetap dan tidak berubah setelah dirender.
Stateful Widget adalah widget yang dinamis di mana state/keadaannya dapat berubah selama widget tersebut aktif. Widget ini memungkinkan untuk mengubah tampilan, data, atau konfigurasi secara dinamis. Widget ini memiliki objek State terpisah yang menyimpan data yang bisa berubah. Proyek ini tidak menggunakan stateful widget karena tidak ada perubahan state yang diperlukan.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya?
- MaterialApp: Widget root yang menyediakan konfigurasi tema dan navigasi
- Scaffold: Memberikan struktur layout dasar aplikasi dengan AppBar dan body
- AppBar: Menampilkan bar atas aplikasi yang berisi judul
- Text: Menampilkan teks
- Column: Menyusun widget secara vertikal
- Row: Menyusun widget secara horizontal  
- Container: Membungkus widget lain dan memberikan padding/margin
- Card: Menampilkan informasi dalam bentuk kartu dengan elevasi
- GridView: Menampilkan items dalam layout grid
- Icon: Menampilkan ikon
- InkWell: Memberikan efek sentuhan dan menangani onTap
- Material: Memberikan background dan efek visual material design
- Center: Mengatur widget ke tengah parent
- Padding: Memberikan padding pada widget child
- SizedBox: Memberikan jarak/space kosong

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut?
setState() digunakan untuk memberitahu framework bahwa internal state dari objek telah berubah dan perlu melakukan rebuild widget. Namun dalam proyek ini tidak menggunakan setState() karena menggunakan stateless widget. setState() biasanya digunakan pada stateful widget untuk memperbarui UI ketika ada perubahan data seperti counter, form input, dll.

4.  Jelaskan perbedaan antara const dengan final.
Const adalah nilai yang harus sudah diketahui pada saat compile time dan tidak dapat diubah setelah diinisialisasi. Contoh pada proyek adalah padding, style text yang nilainya tetap.
Final adalah nilai yang bisa diketahui pada saat runtime dan tidak dapat diubah setelah diinisialisasi. Contoh pada proyek adalah variabel nama, npm, dan items yang nilainya diberikan saat runtime.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
- membuat program flutter baru dangan tema Floemin: saya menjalankan flutter create. Setelah proyek Flutter telah terbuat, saya menambahkan file menu.dart dan menuliskan kode di dalamnya
- membuat tiga tombol: dengan cara membuat list of ItemHomepage yang berisi tombol-tombol disertai dengan warna yang saya inginkan. Setelah itu, saya membuat class ItemHomepage yang memiliki atribut nama, icon, dan warna.
-  Memunculkan Snackbar: implementasi snackbar dengan menggunakan InkWell onTap sehingga ketika tombol diklik akan muncul snackbar yang sesuai dengan tombol yang diklik


## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
const digunakan untuk membuat objek yang nilainya konstan yang artinya objek tersebut tidah berubah saat compile time. Menggunakan const menguntungkan karena dapat mempercepat build time. Hal ini karena widget const hanya dibuat sekali dan disimpan di cache sehingga setiap build time, tidak perlu membuat widget baru. 
const digunakan saat:
- ingin membuat widget yang nilainya tidak berubah (statis)
- pada nilai literal seperti strings dan numbers
- pada widget yang child-nya juga const. const tidak digunakan saat
const tidak digunakan saat:
- ingin membuat widget yang nilainya dinamis
- widget yang stateful
- widget yang menggunakan data dari API/Database

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Perbedaan utamanya adalah Column menyusun child widgets secara vertikal sedangkan Row secara horizontal. 
implementasi column:
Column(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
implementasi row:
Row(
  children: [
    Text('Item 1'),
    Text('Item 2'), 
    Text('Item 3'),
  ],
)

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Input yang digunakan pada flowerentry_form.dart adalah TextFormField sebanyak 3 buah untuk mengambil input nama bunga(string), deskripsi bunga(string), dan harga bunga(integer). Masing-masing field tersebut dilengkapi dengan dekorasi, yaitu hintText, labelText, dan border. Selain itu, ada juga validator input kosong, onChanged handler untuk mengupdate state, dan khusus field harga ada validasi input harus angka.
Elemen input Flutter lain yang tidak digunakan:
- Checkbox (untuk hal yg menawarkan 2 opsi)
- Radio (untuk memilih kategori)
- DropdownButton
- DateTimePicker

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Dengan menerapkan kode berikut pada main.dart. 
MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400]),
      ),
      home: MyHomePage(),
    );

Berikutnya mengakses warna primary dan secondary tersebut sesuai kebutuhan dengan cara:

// Mengakses warna primary
Theme.of(context).colorScheme.primary

// Mengakses warna secondary
Theme.of(context).colorScheme.secondary

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

contohnya pada left_drawer.dart:
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
    ));
yang terjadi pada blok kode ini adalah:
- Mengganti halaman saat ini dengan halaman baru (MyHomePage)
- Halaman sebelumnya dihapus dari stack navigasi
- panggunaan pushReplacement mengakibatkan user tidak bisa kembali ke halaman sebelumnya dengan tombol back karena halaman sebelumnya telah direplace dengan halaman saat ini pada stack

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
- Model membantu mengkonversi data JSON ke objek Dart agar mudah dimanipulasi
- Tanpa model bisa terjadi error parsing atau kesulitan mengakses data
- Model juga membantu validasi tipe data

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
- Digunakan untuk melakukan HTTP request (GET, POST, dll) ke server
- Memungkinkan komunikasi antara Flutter dan Django backend

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
- Mengelola session dan cookies untuk autentikasi
- Dibagikan ke semua komponen agar status login konsisten di seluruh aplikasi
- Menggunakan provider untuk state management

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
- User input data di form Flutter
- Data dikonversi ke JSON
- Dikirim ke Django via HTTP request
- Response dari Django diproses
- Ditampilkan di UI Flutter

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Login/Register: Input credentials → kirim ke Django → Django validasi → kirim response
- Django membuat session/token
- Flutter menyimpan cookie/token untuk requests selanjutnya
- Logout: Hapus session di Django dan cookie di Flutter

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial). jawablah pertanyaan ini, singkat saja
- Buat model sesuai struktur JSON
- Implementasi provider untuk CookieRequest
- Buat form input di Flutter
- Hubungkan dengan endpoint Django
- Handle response dan update UI