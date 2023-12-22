import 'dart:convert';

import 'package:api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Sample> postlist = [];
  Future<List<Sample>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postlist.clear();
      for (Map<String, dynamic> i in data) {
        postlist.add(Sample.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(postlist[index].title.toString()),
                                Text(postlist[index].title.toString())
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
