import 'package:flutter/material.dart';

class DogboneScreen extends StatefulWidget {
  @override
  _DogboneScreenState createState() => _DogboneScreenState();
}

class _DogboneScreenState extends State<DogboneScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dogbones'),
      ),
      body: Row(
        children: [
          // Left side: List of options with borders
          Container(
            width: 200, // Adjust the width as needed
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey),
              ),
            ),
            child: ListView(
              children: [
                ListTile(
                  title: Text('Post'),
                  onTap: () {
                    _navigateToPage(0);
                  },
                ),
                Divider(), // Add a divider for visual separation
                ListTile(
                  title: Text('Get'),
                  onTap: () {
                    _navigateToPage(1);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('View'),
                  onTap: () {
                    _navigateToPage(2);
                  },
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
                  setState(() {});
                },
                children: [
                  DogbonePage(
                    title: 'Post Module',
                    content: 'Post module content.',
                  ),
                  DogbonePage(
                    title: 'Get Module',
                    content: 'Get module content.',
                  ),
                  DogbonePage(
                    title: 'View Module',
                    content: 'View module content.',
                  ),
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

class DogbonePage extends StatelessWidget {
  final String title;
  final String content;

  DogbonePage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            content,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
