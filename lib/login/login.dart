import 'package:flutter/material.dart';

import 'package:aqp_dev/login/signin_page.dart';
import 'package:aqp_dev/login/signup_page.dart';
import 'package:aqp_dev/login/forgot_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PageController _pageController = PageController();
  int _selectedPageIndex = 0; // Default selected option is sign-in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login Page'),
      ),
      body: Row(
        children: [
          // Left side: List of options with borders
          Container(
            width: 200,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey),
              ),
            ),
            child: ListView(
              children: [
                ListTile(
                  title: Text('Sign in'),
                  onTap: () {
                    _navigateToPage(0);
                  },
                  selected: _selectedPageIndex == 0,
                ),
                Divider(),
                ListTile(
                  title: Text('Sign up'),
                  onTap: () {
                    _navigateToPage(1);
                  },
                  selected: _selectedPageIndex == 1,
                ),
                Divider(),
                ListTile(
                  title: Text('Forgot Password?'),
                  onTap: () {
                    _navigateToPage(2);
                  },
                  selected: _selectedPageIndex == 2,
                ),
              ],
            ),
          ),
          // Right side: Display content based on selected option with borders
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey),
                ),
              ),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedPageIndex = index;
                  });
                },
                children: [
                  SigninPage(),
                  SignupPage(),
                  ForgotPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
