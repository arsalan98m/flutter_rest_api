import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/photo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Photo> photosList = [];

  // Future<List<Post>> getPost() async {
  //   const url = "https://jsonplaceholder.typicode.com/posts";
  //   final response = await http.get(Uri.parse(url));
  //   final data = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     for (Map i in data) {
  //       postsList.add(Post.fromJson(i as Map<String, dynamic>));
  //     }

  //     return postsList;
  //   }

  //   return postsList;
  // }

  Future<List<Photo>> getPhotos() async {
    const url = "https://jsonplaceholder.typicode.com/photos";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photo photo = Photo(id: i["id"], title: i["title"], url: i["url"]);

        photosList.add(photo);
      }

      return photosList;
    }

    return photosList;
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
                future: getPhotos(),
                builder: ((context, AsyncSnapshot<List<Photo>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          subtitle: Text(snapshot.data![index].id.toString()),
                          title: Text(snapshot.data![index].title.toString()),
                        );
                      },
                      itemCount: photosList.length,
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
