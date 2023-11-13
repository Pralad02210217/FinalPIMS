import 'package:flutter/material.dart';
import 'Modules/Electives.dart'; // Import Page1





class newElectives extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwipePageDemo(),
    );
  }
}

class SwipePageDemo extends StatefulWidget {
  @override
  _SwipePageDemoState createState() => _SwipePageDemoState();
}

class _SwipePageDemoState extends State<SwipePageDemo> {
  final List<Widget> pages = [Electives()];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: pages
            .asMap()
            .entries
            .map((entry) => buildPage(entry.value, entry.key))
            .toList(),
      ),
    );
  }

  Widget buildPage(Widget page, int index) {
    double offset = (index - currentPageIndex).toDouble();
    return SizedBox(
      height: MediaQuery.of(context).size.height, // Set a finite height
      child: AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        top: offset * MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: page,
      ),
    );
  }
}
