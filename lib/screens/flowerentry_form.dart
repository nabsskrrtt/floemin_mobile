import 'package:flutter/material.dart';
import 'package:floemin/widgets/left_drawer.dart';

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
  @override
  Widget build(BuildContext context) {
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
    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Bunga berhasil tersimpan'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bunga: $_flower'),
                              Text('Deskripsi: $_desc'),
                              Text('Harga: $_price'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                              _formKey.currentState!.reset();
                            },
                          ),
                        ],
                      );
                    },
                  );
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