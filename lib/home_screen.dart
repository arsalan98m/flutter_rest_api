import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];

  Future<List<User>> getUsers() async {
    const url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map i in data) {
        usersList.add(User.fromJson(i as dynamic));
      }

      return usersList;
    }

    return usersList;
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
                builder: ((context, AsyncSnapshot<List<User>> snapshot) {
                  if (!snapshot.hasData) {
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
                                  value: snapshot.data![index].name.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Username',
                                  value:
                                      snapshot.data![index].username.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Email',
                                  value: snapshot.data![index].email.toString(),
                                ),
                                ReuseableRow(
                                  title: 'Latitude',
                                  value: snapshot.data![index].address.geo.lat
                                      .toString(),
                                ),
                                ReuseableRow(
                                  title: 'Longitude',
                                  value: snapshot.data![index].address.geo.lng
                                      .toString(),
                                ),
                                ReuseableRow(
                                  title: 'City',
                                  value: snapshot.data![index].address.city
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: usersList.length,
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
