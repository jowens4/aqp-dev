import 'package:flutter/material.dart';

class ForgotPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Recover Password",
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

          // Button to trigger login action
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
              print('Email: ${emailController.text}');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
