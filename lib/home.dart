import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _selectedPageIndex = 0; // Default selected option is sign-in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
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
                  title: Text('Home 1'),
                  onTap: () {
                    _navigateToPage(0);
                  },
                  selected: _selectedPageIndex == 0,
                ),
                Divider(),
                ListTile(
                  title: Text('Home 2'),
                  onTap: () {
                    _navigateToPage(1);
                  },
                  selected: _selectedPageIndex == 1,
                ),
                Divider(),
                ListTile(
                  title: Text('Home 3'),
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
                  Placeholder(),
                  Placeholder(),
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
