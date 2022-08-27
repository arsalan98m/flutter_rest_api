import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> postsList = [];
  Future<List<Post>> getPost() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map i in data) {
        postsList.add(Post.fromJson(i as Map<String, dynamic>));
      }

      return postsList;
    }

    return postsList;
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
                future: getPost(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" ${index + 1} :  ${postsList[index].title}"),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      itemCount: postsList.length,
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
