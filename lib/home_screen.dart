import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/products_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Products> getProducts() async {
    const url = "https://webhook.site/92960c13-bc4d-4224-b286-1cd26d7b7ea3";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return Products.fromJson(data);
    }

    return Products.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<Products>(
                future: getProducts(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  snapshot.data!.data[index].shop!.name
                                      .toString(),
                                ),
                                subtitle: Text(
                                  snapshot.data!.data[index].shop!.shopemail
                                      .toString(),
                                ),
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                  snapshot.data!.data[index].shop!.image
                                      .toString(),
                                )),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data?.data[index].images?.length,
                                    itemBuilder: ((context, position) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data
                                                    ?.data[index]
                                                    .images?[position]
                                                    .url as String))),
                                      );
                                    })),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data?.data.length,
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
