import 'package:flutter/material.dart';
import 'package:navi_app/main.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    String title = 'Welcome';

    return AppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title),
        IconButton(
          icon: Icon(Icons.print),
          onPressed: () {
            // Add your search functionality here
          },
        ),
        IconButton(
          icon: Icon(Icons.waterfall_chart_rounded),
          onPressed: () {
            // Add your search functionality here
          },
        ),
        IconButton(
          icon: Icon(Icons.lightbulb),
          onPressed: () {
            // Add your search functionality here
          },
          tooltip: "idea",
        ),
      ],
    ));
  }
}
