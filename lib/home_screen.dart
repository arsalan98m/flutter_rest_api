import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;

  Future<void> getUsers() async {
    const url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUsers(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReuseableRow(
                                  title: 'Name',
                                  value: data[index]["name"],
                                ),
                                ReuseableRow(
                                  title: 'Username',
                                  value: data[index]["username"],
                                ),
                                ReuseableRow(
                                  title: 'Email',
                                  value: data[index]["email"],
                                ),
                                ReuseableRow(
                                  title: 'Latitude',
                                  value: data[index]["address"]["geo"]["lat"],
                                ),
                                ReuseableRow(
                                  title: 'Longitude',
                                  value: data[index]["address"]["geo"]["lng"],
                                ),
                                ReuseableRow(
                                  title: 'City',
                                  value: data[index]["address"]["city"],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                    );
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReuseableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
