import 'package:flutter/material.dart';
import 'package:programme_information_management_system/Departments/ArchitectDepartment/ADepartment.dart';
import 'package:programme_information_management_system/Departments/ECEDepartment/ECEDepartment.dart';
import 'package:programme_information_management_system/Departments/EDepartment/EDepartment.dart';
import 'package:programme_information_management_system/Departments/ScienceDepartment/ScienceDepartment.dart';

import 'CDepartment/CDepartment.dart';
import 'ITDepartment/ITDepartment.dart';

class DepartmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(),
          SizedBox(height: 20),
          DepartmentList(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a department...',
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class DepartmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DepartmentData> departments = [
      DepartmentData(
        name: 'Information Technology Department',
        image: 'assets/undraw_Software_engineer_re_tnjc.png',
        pageToNavigate: ITDepartmentPage(),
      ),
      DepartmentData(
        name: 'Civil Department',
        image: 'assets/undraw_QA_engineers_dg5p.png',
        pageToNavigate: CDepartmentPage(),
      ),
      DepartmentData(
        name: 'Architecture Department',
        image: 'assets/undraw_urban_design_kpu8.png',
        pageToNavigate: ADepartmentPage(),
      ),
      DepartmentData(
        name: 'Electrical Department',
        image: 'assets/undraw_electricity_k2ft.png',
        pageToNavigate: EDepartmentPage(),
      ),
      DepartmentData(
        name: 'Electronic and Communication Department',
        image: 'assets/undraw_circuit_sdmr.png',
        pageToNavigate: ECEDepartmentPage(),
      ),
      DepartmentData(
        name: 'Science And Humanities Department',
        image: 'assets/undraw_Science_re_mnnr.png',
        pageToNavigate: ScienceDepartmentPage(),
      ),
      // Add more department data for other departments
    ];

    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: departments.map((department) {
          return DepartmentCard(
            name: department.name,
            image: department.image,
            pageToNavigate: department.pageToNavigate,
            onTap: () {
              // Define navigation when the department card is tapped

            },
          );
        }).toList(),
      ),
    );
  }
}

class DepartmentData {
  final String name;
  final String image;
    final Widget pageToNavigate; 

  

  DepartmentData({
    required this.name,
    required this.image,
    required this.pageToNavigate,
  });
}

class DepartmentCard extends StatelessWidget {
  final String name;
  final String image;
  final Widget pageToNavigate; 
  
  final VoidCallback onTap;

  DepartmentCard({
    required this.name,
    required this.image,
    required this.pageToNavigate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.grey[200],
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pageToNavigate));
                      // Add functionality to display department details
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 245, 173, 4),
                    ),
                    label: Text('Display'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
