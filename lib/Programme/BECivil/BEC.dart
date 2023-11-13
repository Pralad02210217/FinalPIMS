import 'package:flutter/material.dart';

import 'package:programme_information_management_system/Programme/BEIT/BEITModules.dart';
import 'BECPLs.dart';
import 'BECElectives.dart';

import 'BECLoading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';





void main() {
  runApp(MaterialApp(
    home: CProgramPage(),
  ));
}

class CProgramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Civil Engineering'),
          backgroundColor: const Color(0xFF0028A8),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Information'),
              Tab(text: 'Modules'),
              Tab(text: 'Electives'),
              Tab(text: 'Previous PLs'),
            ],
          ),
        ),
        body: ITDepartmentContent(),
      ),
    );
  }
}
class ITDepartmentContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        InformationTab(),
        Modules(),
        Electives(),
        PreviousPLsTab(),
      ],
    );
  }
}

class InformationTab extends StatefulWidget {
  @override
  _InformationTabState createState() => _InformationTabState();
}


class _InformationTabState extends State<InformationTab> {
  String apiUrl = 'https://node-api-6l0w.onrender.com/api/v1/students/programmedetails/P01';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Data is still being fetched, display a loading placeholder
          return buildLoadingPlaceholder();
        } else if (snapshot.hasError) {
          // An error occurred while fetching data, display an error message
          return buildErrorPlaceholder(snapshot.error.toString());
        } else if (snapshot.hasData) {

        // final jsonData = snapshot.data;
        // final departmentData = jsonData['department'];
        // final jsonString = json.encode(departmentData);
        // final departmentName = departmentData['dname'];
      final jsonData = snapshot.data;

      final Department = jsonData['department'][0];
      final departmentname = Department['dname'];
      final newDepartmentName = departmentname.split(" and ")[0];
      // final establishedDate = Department['established_date'];
      // final datePart = establishedDate.split('T')[0];
      // final programmOffered = Department['nprogram'].toString();
      final programList = jsonData['Programme'][0]; 
      final programName = programList['pname'];
      final programDuration = (programList['programme_duration']).toString();
      final establishedDate = programList['established_date'];
      final establishedDataPart =establishedDate.split('T')[0];
      final lastReviewDate = programList['last_reviwed_date'];
      final reviewdDatePart = lastReviewDate.split('T')[0];
     
      final StaffList = jsonData['staff'][0];
      final hodname = StaffList['name'];
      final email = StaffList['email'];
      final link = StaffList['imageurl'];

          // Data has been successfully fetched
          return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Container(
      color: const Color.fromARGB(255, 255, 255, 255), // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 188,
            child: Stack(
              children: [
                Container(
                  width: 400, // Match the width of the blue container
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: const Image(
                      image: NetworkImage('https://cst.edu.bt/images/Campus/cstcampus2.jpg'), // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color(0x960028a8), // Positioned rectangle color
                    ),
                    child: const Center( // Center the text
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
                        children: [
                          Text('AIM:', style: TextStyle(fontSize: 16, color: Colors.white)),
                          SizedBox(height: 4), // Add some spacing
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
                            child: Text(
                              'The Bachelor of Engineering in Civil Engineering aims to develop students with a thorough background in both theoretical and practical aspects of the core principles of Bachelor of Engineering in Civil Engineering, and of the underlying scientific fundamentals.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 5, // Limit the number of lines to fit within the container
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFF97E0C),
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        height: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Department:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              newDepartmentName,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Title of the Award:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              programName,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Programme Duration:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              programDuration,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Established Date: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              establishedDataPart,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Last Review Date:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              reviewdDatePart,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
        const SizedBox(height: 16),
     Container(
      decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Add border styling as needed
            borderRadius: BorderRadius.circular(15.0), // Add border radius as needed
          ),
       child: ExpansionTile(
              title: const Text('Programme Batch'),
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF97E0C),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          'Current Batch of Students',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F3),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color(0xFFF97E0C),
                            width: 2.0,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.school,
                              color: Color(0xFF000000),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Fourth Years : 11th batch',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F3),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color(0xFFF97E0C),
                            width: 2.0,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.school,
                              color: Color(0xFF000000),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'First Years : 14th batch',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
     ),



       
          const SizedBox(height: 10),
          
          
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ExpansionTile(
              title: const Text('Present Programme Leader'),
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFF87D0C),
                      width: 3.0,
                    ),
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  width: double.infinity,
                  height: 118,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 12.0),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundColor: const Color.fromARGB(255, 199, 198, 198),
                          backgroundImage: NetworkImage(link),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                hodname,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                                'Master in Blockchain',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                email,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
        

        } else {
          // Data is null or empty
          return buildErrorPlaceholder('Data not available');
        }
      },
    );
  }

  Widget buildLoadingPlaceholder() {
    return CProgramPage1();
  }

  Widget buildErrorPlaceholder(String errorMessage) {
    return Center(
      child: Text('Error: $errorMessage'),
    );
  }

  Future<dynamic> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 30));


      if (response.statusCode == 200) {
        final dynamic apiResponse = json.decode(response.body);
        // print(apiResponse); // Print the JSON data in the terminal
        return apiResponse;
      } else {
        print('API Error: Failed to load data');
        return null; // Return null to indicate an error.
      }
    } catch (e) {
      print('Error: $e');
      print('Network Error: Failed to load data');
      return null; // Return null to indicate an error.
    }
  }
}




class Modules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add your staff details here
    return newModules();
  }
}
class Electives extends StatelessWidget {
  @override
  Widget build(BuildContext){
    return newElectives();
  }
}

class PreviousPLsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add your previous HoDs details here
    return PreviousPLContent();
  }
}
