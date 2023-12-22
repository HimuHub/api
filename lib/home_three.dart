import 'dart:convert';

import 'package:api/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homethree extends StatefulWidget {
  const Homethree({super.key});

  @override
  State<Homethree> createState() => _HomethreeState();
}

class _HomethreeState extends State<Homethree> {
  List<Users> userList = [];
  Future<List<Users>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(Users.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Name'),
                                        Text(snapshot.data![index].name
                                            .toString())
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }))
        ],
      ),
    );
  }
}
