import 'dart:convert';

import 'package:floemin/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:floemin/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class FlowerEntryFormPage extends StatefulWidget {
  const FlowerEntryFormPage({super.key});

  @override
  State<FlowerEntryFormPage> createState() => _FlowerEntryFormPageState();
}

class _FlowerEntryFormPageState extends State<FlowerEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _flower = "";
	String _desc = "";
	int _price = 0;
  int _stocks = 0;
  String _imgUrl = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
  
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Form Tambah Bunga',
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.white,
  ),
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Bunga",
          labelText: "Bunga",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _flower = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Bunga tidak boleh kosong!";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Deskripsi",
          labelText: "Deskripsi",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _desc = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Deskripsi tidak boleh kosong!";
          }
          return null;
        },
      ),
    ),    
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Price",
          labelText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _price = int.tryParse(value!) ?? 0;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Harga tidak boleh kosong!";
          }
          if (int.tryParse(value) == null) {
            return "Harga harus berupa angka!";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Stock",
          labelText: "Stock",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _stocks = int.tryParse(value!) ?? 0;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Stok tidak boleh kosong!";
          }
          if (int.tryParse(value) == null) {
            return "Stok harus berupa angka!";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Image",
          labelText: "Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _imgUrl = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Image tidak boleh kosong!";
          }
          return null;
        },
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary),
          ),
          onPressed: () async {
              if (_formKey.currentState!.validate()) {
                  // Kirim ke Django dan tunggu respons
                  // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                  final response = await request.postJson(
                      "http://127.0.0.1:8000/create-flutter/",
                      jsonEncode(<String, String>{
                          'bunga': _flower,
                          'description': _desc,
                          'price': _price.toString(),
                          'stocks': _stocks.toString(),
                          'img_url': _imgUrl                       
                      }),
                  );
                  print(response);
                  if (context.mounted) {
                      if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                          content: Text("Mood baru berhasil disimpan!"),
                          ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                      } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              content:
                                  Text("Terdapat kesalahan, silakan coba lagi."),
                          ));
                      }
                  }
              }
          },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),            
          ),
        ),
      ),
    ),
  ],
      )
    ),
  ),
);
  }
}