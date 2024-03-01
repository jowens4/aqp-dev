import 'package:flutter/material.dart';

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

class SigninPage extends StatelessWidget {
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
              // Add your login logic here
              print('Email: ${emailController.text}');
              print('Password: ${passwordController.text}');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
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
            "Sign up",
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
