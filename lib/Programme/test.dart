// lib/Programme/Programme.dart

import 'package:flutter/material.dart';
import 'package:programme_information_management_system/Programme/BEA/BEA.dart';
import 'package:programme_information_management_system/Programme/BECivil/BEC.dart';
import 'package:programme_information_management_system/Programme/BEECE/BEECE.dart';
import 'package:programme_information_management_system/Programme/BEElectrical/BEE.dart';
import 'package:programme_information_management_system/Programme/BEGeology/BEG.dart';
import 'package:programme_information_management_system/Programme/BEICE/BEICE.dart';
import 'package:programme_information_management_system/Programme/BEWater/BEW.dart';
import 'BEIT/BEIT.dart';

class ProgrammePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(), // Create a custom SearchBar widget
          SizedBox(height: 20),
          ProgrammeList(), // Create a custom ProgrammeList widget
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
        borderRadius: BorderRadius.circular(50), // Create a rounded shape
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a program...',
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ProgrammeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list of program data, e.g., ProgrammeData objects
    List<ProgrammeData> programs = [
       ProgrammeData(
        name: 'M.E. Construction Management',
        image: 'assets/mconst.jpg',
      ),
       ProgrammeData(
        name: 'M.E Renewable Energy',
        image: 'assets/mere.jpg',
      ),
      ProgrammeData(
        name: 'B.E Information Technology',
        image: 'assets/beit.jpg',
      ),
      ProgrammeData(
        name: 'B.E Civil Engineering',
        image: 'assets/becivil.jpg',
      ),
      ProgrammeData(
        name: 'B.E Architecture',
        image: 'assets/bearch.jpg',
      ),
      ProgrammeData(
        name: 'B.E Electrical Engineering',
        image: 'assets/beelectical.jpg',
      ),
      ProgrammeData(
        name: 'B.E Electronics & Communication',
        image: 'assets/beece.jpg',
      ),
      ProgrammeData(
        name: 'B.E Geology',
        image: 'assets/begelo.jpg',
      ),
       ProgrammeData(
        name: 'B.E Instrumentation and Controls',
        image: 'assets/beice.jpg',
      ),
      // Add more program data for other programs
    ];

    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical, // Make the list scroll vertically
        children: programs.map((program) {
          return ProgrammeCard(
            name: program.name,
            image: program.image,
            
          );
        }).toList(),
      ),
    );
  }
}

class ProgrammeData {
  final String name;
  final String image;

  ProgrammeData({
    required this.name,
    required this.image,
  });
}

class ProgrammeCard extends StatelessWidget {
  final String name;
  final String image;

  ProgrammeCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ITDepartmentPage when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WProgramPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 100,
            ),
            SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
