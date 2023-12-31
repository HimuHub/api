import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hometwo extends StatefulWidget {
  const Hometwo({super.key});

  @override
  State<Hometwo> createState() => _HometwoState();
}

class _HometwoState extends State<Hometwo> {
  List<Photos> photosList = [];
  Future<List<Photos>> getPhotos() async {
    final Response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: getPhotos(),
              builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        title: Text(snapshot.data![index].title.toString()),
                      );
                    });
              }),
        )
      ],
    ));
  }
}

class Photos {
  String title, url;

  Photos({required this.title, required this.url});
}
