import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SigninPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getUser(String email, String password) async {
    const String apiUrl = 'http://aqp:8080/user/';

    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("User created successfully");
      } else {
        print("Error creating user. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error during POST request: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign in",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          // Text fields for email and password
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 16),
          // Button to trigger login action
          ElevatedButton(
            onPressed: () {
              // check if user is in the data base, if they are, set authenticated to true

              print('Email: ${emailController.text}');
              print('Password: ${passwordController.text}');

              print(getUser(emailController.text, passwordController.text));
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
