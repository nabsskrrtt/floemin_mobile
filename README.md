# floemin mobile version

A new Flutter project.

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

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
