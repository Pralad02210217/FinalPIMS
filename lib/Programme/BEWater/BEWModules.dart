import 'package:flutter/material.dart';
import 'Modules/Page1.dart'; // Import Page1
import 'Modules/Page2.dart'; // Import Page2
import 'Modules/Page3.dart'; // Import Page3
import 'Modules/Page4.dart';

class newModules extends StatelessWidget {
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
  final List<Widget> pages = [Page1(), Page2(), Page3(), Page4()]; // Use the imported page Widgets
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: DropdownButton<int>(
                value: currentPageIndex,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Year 1'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Year 2'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Year 3'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Year 4'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    currentPageIndex = value!;
                  });
                },
                style: TextStyle(
                  color: Colors.blue,
                ),
                icon: Icon(Icons.arrow_drop_down),
                elevation: 4,
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: pages
                    .asMap()
                    .entries
                    .map((entry) => buildPage(entry.value, entry.key))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(Widget page, int index) {
    double offset = (index - currentPageIndex).toDouble();
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: offset * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: page,
    );
  }
}
