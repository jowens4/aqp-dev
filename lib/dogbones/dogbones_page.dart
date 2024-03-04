import 'package:flutter/material.dart';
import 'package:aqp_dev/dogbones/enter_dogbones_page.dart';
import 'package:aqp_dev/dogbones/review_dogbones_page.dart';

class DogboneScreen extends StatefulWidget {
  @override
  _DogboneScreenState createState() => _DogboneScreenState();
}

class _DogboneScreenState extends State<DogboneScreen> {
  final PageController _pageController = PageController();
  int _selectedPageIndex = 0; // Default selected option is sign-in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dogbone Page'),
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
                  title: Text('Enter Dogbones'),
                  onTap: () {
                    _navigateToPage(0);
                  },
                  selected: _selectedPageIndex == 0,
                ),
                Divider(),
                ListTile(
                  title: Text('Review Dogbones'),
                  onTap: () {
                    _navigateToPage(1);
                  },
                  selected: _selectedPageIndex == 1,
                ),
                Divider(),
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
                  EnterDogbonesPage(),
                  ReviewDogbonesPage(),
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
