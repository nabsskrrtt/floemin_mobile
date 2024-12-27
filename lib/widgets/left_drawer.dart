import 'package:floemin/screens/list_flowerentry.dart';
import 'package:flutter/material.dart';
import 'package:floemin/screens/menu.dart';
import 'package:floemin/screens/flowerentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Column(
                  children: [
                    Text(
                      'Floemin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                      "Jangan lupa bahagia hari ini!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Bunga'),
              // Bagian redirection ke FlowerEntryFormPage
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FlowerEntryFormPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Daftar Bunga'),
              onTap: () {
                  // Route menu ke halaman mood
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FlowerEntryPage()),
                  );
              },
            ),
        ],
      ),
    );
  }
}