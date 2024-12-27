import 'package:floemin/screens/flower_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:floemin/models/flower_entry.dart';
import 'package:floemin/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:floemin/screens/flower_detail_page.dart';

class FlowerEntryPage extends StatefulWidget {
  const FlowerEntryPage({super.key});

  @override
  State<FlowerEntryPage> createState() => _FlowerEntryPageState();
}

class _FlowerEntryPageState extends State<FlowerEntryPage> {
  Future<List<FlowerEntry>> fetchFlower(CookieRequest request) async {
    if (request.jsonData['user_id'] == null) {
        final userResponse = await request.get('http://127.0.0.1:8000/auth/get_user/');
        request.jsonData['user_id'] = userResponse['id'];
    }
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;
    List<FlowerEntry> listFlower = [];
    for (var d in data) {
      if (d != null) {
        var flower = FlowerEntry.fromJson(d);
        if (flower.fields.user == request.jsonData['user_id']) {
          listFlower.add(flower);
        }
      }
    }
    return listFlower;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flower Entry List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.white],
          ),
        ),
        child: FutureBuilder(
          future: fetchFlower(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    Text(
                      'Belum ada data bunga pada floemin mobile',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff59A5D8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlowerDetailPage(
                            flower: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Rp${snapshot.data![index].fields.price}",
                                style: TextStyle(color: Colors.pink[700]),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${snapshot.data![index].fields.description}",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.inventory_2, color: Colors.grey[600]),
                                const SizedBox(width: 5),
                                Text(
                                  "${snapshot.data![index].fields.stocks}",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}