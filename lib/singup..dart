import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        print('account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  TextEditingController emailClt = TextEditingController();
  TextEditingController passClt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup api'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailClt,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passClt,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                login(emailClt.text.toString(), passClt.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                  child: Text('Sign up'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
