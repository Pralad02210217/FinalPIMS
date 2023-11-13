import 'package:flutter/material.dart';
import 'package:programme_information_management_system/AboutUs/AboutUs.dart';
import 'package:programme_information_management_system/ModuleDescriptor/ModuleDescriptor.dart';
import 'package:programme_information_management_system/Settings/Settings.dart';
import 'HomePage/LandingPage.dart'; // Import LandingPage.dart
import 'Departments/Department.dart'; // Import Department.dart
import 'Programme/Programme.dart'; // Import Programme.dart
import 'login.dart';

void main() => runApp(
      MaterialApp(
        home: DefaultTabController(
          length: 4,
          initialIndex: 1,
          child: MyApp(),
        ),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );

    // Listen for tab changes and update the app bar title
    tabController.addListener(() {
      setState(() {}); // Rebuild the widget when the tab changes
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the currently selected tab index
    final currentIndex = tabController.index;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: MyAppBar(
          currentIndex: currentIndex,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          LandingPage(tabController: tabController),
          DepartmentPage(),
          ProgrammePage(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(controller: tabController),
      drawer: const MyDrawer(),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final int currentIndex;

  MyAppBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final tabTitles = ['Home', 'Departments', 'Programme', 'About Us'];
    return AppBar(
      backgroundColor: const Color(0xFF0028A8),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Text(
        tabTitles[currentIndex],
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      // actions: <Widget>[
      //   IconButton(
      //     icon: const Icon(Icons.brightness_4),
      //     onPressed: () {
      //       // Implement dark mode toggle logic here
      //     },
      //   ),
      // ],
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  final TabController controller;

  MyBottomNavigationBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: const <Widget>[
        Tab(
          icon: Icon(Icons.home),
          text: 'Home',
        ),
        Tab(
          icon: Icon(Icons.business),
          text: 'Departments',
        ),
        Tab(
          icon: Icon(Icons.book),
          text: 'Programme',
        ),
      ],
      labelColor: const Color.fromARGB(255, 0, 40, 168),
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}

//Change this for the menu bar
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: const Color(0xFF0028A8), 
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/cst.jpg'),
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text("Programme Information Management", style: TextStyle(fontSize: 15, color: Colors.white)),
                Text("System", style: TextStyle(fontSize: 15, color: Colors.white)),
                Text("info.cst@rub.edu.bt", style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // DefaultTabController.of(context)!.animateTo(1);
              Navigator.of(context).pop();
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  MyApp(),
                ));
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('Module Descriptor'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ModuleDescriptorPage()));
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const Settings(),
                ));
            },
          ),
          
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              // DefaultTabController.of(context)!.animateTo(0); // Navigate to the About Us page (index 0)
              Navigator.of(context).pop();
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const AboutUsPage(),
                ));
            },
          ), 

          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Login())); // Navigate to the AboutUsPage
              confirmLogout(context);
            },
          ),
        ],
      ),
    );
  }
  
  Future<void> confirmLogout(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to log out?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Logout'),
                onPressed: () {
                  // Implement logout functionality here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  // Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
    );
  }
}
