import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Test.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Staff {
  final String name;
  final String title;
  final String email;
  final String? phone;
  final String imageUrl;

  Staff({
    required this.name,
    required this.title,
    required this.email,
    this.phone,
    required this.imageUrl,
  });
}

void main() {
  runApp(MaterialApp(
    home: StaffContent(),
  ));
}

class StaffContent extends StatefulWidget {
  @override
  _StaffContentState createState() => _StaffContentState();
}

class _StaffContentState extends State<StaffContent> {
  String apiUrl =
      'https://node-api-6l0w.onrender.com/api/v1/students/staff/department/D05';

  List<Staff> staffList = [];
  List<Staff> filteredStaffList = [];
  final titleSortingOrder = {
    'Head of Department': 1,
    'Lecturer': 2,
    'Associate Lecturer': 3,
    'Assistant Lecturer': 4,
    'Technician': 5,
  };
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response =
          await http.get(Uri.parse(apiUrl)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> apiResponse = json.decode(response.body);

        final List<Staff> result = apiResponse.map((data) {
          return Staff(
            name: data['name'],
            title: data['designation'],
            email: data['email'],
            phone: '17700111',
            imageUrl: data['imageurl'],
          );
        }).toList();

        setState(() {
          staffList = result;
          filteredStaffList = result;
          isLoading = false; // Data is loaded, set isLoading to false
          // Sort the filteredStaffList based on the custom sorting order
          filteredStaffList.sort((a, b) {
            final orderA = titleSortingOrder[a.title] ?? 6;
            final orderB = titleSortingOrder[b.title] ?? 6;
            return orderA.compareTo(orderB);
          });
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (query) {
                  filterStaffList(query);
                },
                decoration: InputDecoration(
                  labelText: 'Search Staff',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            if (isLoading) // Display loading indicator when data is being fetched
              // Center(child: CircularProgressIndicator()),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
                shimmerDuration: 1000,
                child: Text('Loading...', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
            if (!isLoading && staffList.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredStaffList.length,
                itemBuilder: (context, index) {
                  Staff staff = filteredStaffList[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(staff.imageUrl),
                        ),
                        title: Text(staff.name),
                        subtitle: Text(staff.title),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(staff.email),
                            Text(staff.phone ?? 'No phone provided'),
                          ],
                        ),
                      ),
                      Divider(
                        height: 5.0,
                        thickness: 2.0,
                      ),
                    ],
                  );
                },
              ),
            if (!isLoading && staffList.isEmpty) // Display a message when there is no data
              Center(child: Text('No data available.')),
          ],
        ),
      ),
    );
  }

  void filterStaffList(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show the complete staff list
        filteredStaffList = staffList;
      } else {
        // If there is a query, filter the staffList based on the query
        filteredStaffList = staffList.where((staff) {
          return staff.name.toLowerCase().contains(query.toLowerCase()) ||
              staff.email.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }

      // Sort the filteredStaffList again based on the custom sorting order
      filteredStaffList.sort((a, b) {
        final orderA = titleSortingOrder[a.title] ?? 6;
        final orderB = titleSortingOrder[b.title] ?? 6;
        return orderA.compareTo(orderB);
      });
    });
  }
}
