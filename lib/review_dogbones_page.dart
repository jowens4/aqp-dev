import 'package:flutter/material.dart';

class ReviewDogbonesPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "REVIEWDOGBONESPAGE",
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
              // Add your login logic here
              print('Email: ${emailController.text}');
              print('Password: ${passwordController.text}');
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
