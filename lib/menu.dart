import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2306275191';
  final String name = 'Nabila Maharani Putri';
  final String className = 'PBP B';

  // Modified items list to include color for each button
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Bunga", Icons.mood, Colors.pink[100]!), // Light pink
    ItemHomepage("Tambah Bunga", Icons.add, Colors.yellow[100]!), // Light yellow
    ItemHomepage("Logout", Icons.logout, Colors.green[100]!), // Light green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Floemin',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Floemin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Using the custom color from ItemHomepage instead of theme color
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color; // Added color property

    ItemHomepage(this.name, this.icon, this.color); // Modified constructor
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   MyHomePage({super.key});

//   final String npm = '2306275191'; // NPM
//   final String name = 'Nabila Maharani Putri'; // Nama
//   final String className = 'PBP B'; // Kelas

//   final List<ItemHomepage> items = [
//       ItemHomepage("Lihat Bunga", Icons.mood),
//       ItemHomepage("Tambah Bunga", Icons.add),
//       ItemHomepage("Logout", Icons.logout),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
//     return Scaffold(
//       // AppBar adalah bagian atas halaman yang menampilkan judul.
//       appBar: AppBar(
//         // Judul aplikasi "Floemin" dengan teks putih dan tebal.
//         title: const Text(
//           'Floemin',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
//         backgroundColor: Theme.of(context).colorScheme.primary,
//       ),
//       // Body halaman dengan padding di sekelilingnya.
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         // Menyusun widget secara vertikal dalam sebuah kolom.
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Row untuk menampilkan 3 InfoCard secara horizontal.
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InfoCard(title: 'NPM', content: npm),
//                 InfoCard(title: 'Name', content: name),
//                 InfoCard(title: 'Class', content: className),
//               ],
//             ),

//             // Memberikan jarak vertikal 16 unit.
//             const SizedBox(height: 16.0),

//             // Menempatkan widget berikutnya di tengah halaman.
//             Center(
//               child: Column(
//                 // Menyusun teks dan grid item secara vertikal.

//                 children: [
//                   // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
//                   const Padding(
//                     padding: EdgeInsets.only(top: 16.0),
//                     child: Text(
//                       'Welcome to Floemin',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   ),

//                   // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
//                   GridView.count(
//                     primary: true,
//                     padding: const EdgeInsets.all(20),
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     crossAxisCount: 3,
//                     // Agar grid menyesuaikan tinggi kontennya.
//                     shrinkWrap: true,

//                     // Menampilkan ItemCard untuk setiap item dalam list items.
//                     children: items.map((ItemHomepage item) {
//                       return ItemCard(item);
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemCard extends StatelessWidget {
//   // Menampilkan kartu dengan ikon dan nama.

//   final ItemHomepage item; 
  
//   const ItemCard(this.item, {super.key}); 

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       // Menentukan warna latar belakang dari tema aplikasi.
//       color: Theme.of(context).colorScheme.secondary,
//       // Membuat sudut kartu melengkung.
//       borderRadius: BorderRadius.circular(12),
      
//       child: InkWell(
//         // Aksi ketika kartu ditekan.
//         onTap: () {
//           // Menampilkan pesan SnackBar saat kartu ditekan.
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
//             );
//         },
//         // Container untuk menyimpan Icon dan Text
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           child: Center(
//             child: Column(
//               // Menyusun ikon dan teks di tengah kartu.
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   item.icon,
//                   color: Colors.white,
//                   size: 30.0,
//                 ),
//                 const Padding(padding: EdgeInsets.all(3)),
//                 Text(
//                   item.name,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
  
// }

// class ItemHomepage {
//     final String name;
//     final IconData icon;

//     ItemHomepage(this.name, this.icon);
// }

// class InfoCard extends StatelessWidget {
//   // Kartu informasi yang menampilkan title dan content.

//   final String title;  // Judul kartu.
//   final String content;  // Isi kartu.

//   const InfoCard({super.key, required this.title, required this.content});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // Membuat kotak kartu dengan bayangan dibawahnya.
//       elevation: 2.0,
//       child: Container(
//         // Mengatur ukuran dan jarak di dalam kartu.
//         width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
//         padding: const EdgeInsets.all(16.0),
//         // Menyusun title dan content secara vertikal.
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8.0),
//             Text(content),
//           ],
//         ),
//       ),
//     );
//   }
// }