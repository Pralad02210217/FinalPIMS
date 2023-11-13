import 'package:flutter/material.dart';
import 'ITPreviousHoD.dart';
import 'ITStaff.dart';
import 'package:programme_information_management_system/DateRetrival/data_retrival.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ITDepartmentPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       
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
        StaffsTab(),
        PreviousHodsTab(),
      ],
    );
  }
}

class InformationTab extends StatefulWidget {
  @override
  _InformationTabState createState() => _InformationTabState();
}


class _InformationTabState extends State<InformationTab> {
  final DataRetrievalService dataRetrievalService = DataRetrievalService();
  List<Map<String, dynamic>> students = [];
  String _displayedData = '';
  String _DeptName = 'initial';
  String _Established = '';
  String _HodName = '';
  String _HoDEmail = '';

  bool _connectedToDatabase = false;

  @override
  void initState() {
    super.initState();
    fetchData('D04'); // Fetch data automatically when the page loads.
  }

  Future<void> fetchData(String deptId) async {
    final isConnectionSuccessful = await dataRetrievalService.testDatabaseConnection();

    if (isConnectionSuccessful) {
      _connectedToDatabase = true;
    }

    if (_connectedToDatabase) {
      final departmentDetails = await dataRetrievalService.getStudents(deptId);

      if (departmentDetails != null) {
        final List<Map<String, dynamic>> combinedData = [];

        for (final department in departmentDetails) {
          final hodid = department['hodid'];
          final staffDetails = await dataRetrievalService.getStaff(hodid);

          if (staffDetails != null) {
            department['staffDetails'] = staffDetails;
          }

          combinedData.add(department);
        }

        setState(() {

          for (final data in students) {
            _DeptName = data['dname'];
            _Established =  data['Established_date'];

            final staffDetails = data['staffDetails'];

            if (staffDetails != null) {
              for (final staff in staffDetails) {
                _HodName = staff['name'];
                _HoDEmail = staff['email'];
              }
            }
          }
        });
      }
    }
    else{
      _DeptName = 'Database not working';
    }
  }

  
  @override
  Widget build(BuildContext context) {
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
                            padding: EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
                            child: Text(
                              'The Department of Information Technology aims to develop Information Technology Professionals with specializations in Networking, Software Engineering, or Information Security who will be able to contribute to the development of computing technology in the country through Research, Innovation, Creativity, and Enterprise with ethical and professional responsibility.',
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
              'Name of Institute:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
              shimmerDuration: 1000,
              child: Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Title of the Award:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SkeletonAnimation(
              shimmerColor: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
              shimmerDuration: 1000,
              child: Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Courses Offered:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SkeletonAnimation(
        shimmerColor: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
        shimmerDuration: 1000,
        child: Container(
          width: 150,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[300],
          ),
        ),
      ),
            const SizedBox(height: 16),
            const Text(
              'Award Granting Body:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'The Royal University of Bhutan',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Established Date:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SkeletonAnimation(
        shimmerColor: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
        shimmerDuration: 1000,
        child: Container(
          width: 150,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[300],
          ),
        ),
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
              title: const Text('Programme'),
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
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          'Programme Offered:',
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
                        child: Row(
                          children: [
                            const Icon(
                              Icons.school,
                              color: Color(0xFF000000),
                            ),
                            const SizedBox(width: 8),
                           SkeletonAnimation(
                              shimmerColor: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                              shimmerDuration: 1000,
                              child: Container(
                                width: 150,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[300],
                                ),
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
            border: Border.all(color: Colors.grey), // Add border styling as needed
            borderRadius: BorderRadius.circular(8.0), // Add border radius as needed
          ),
          child: ExpansionTile(
          title: const Text('Current Head of Department'),
          children: [
            Container(
              margin: const EdgeInsets.all(1.0),
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
            ClipOval(
              child: Container(
                
                width: 100.0,
                height: 100.0,
                color: Colors.white, // Oval background color (you can replace this)
                child: Center(
                  child: Image.network(
                    '', // Add your image URL here
                    width: 110.0,
                    height: 110.0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                      shimmerDuration: 1000,
                      child: Container(
                        width: 150,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SkeletonAnimation(
                        shimmerColor: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                        shimmerDuration: 1000,
                        child: Container(
                          width: 150,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SkeletonAnimation(
                              shimmerColor: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                              shimmerDuration: 1000,
                              child: Container(
                                width: 150,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                ),
              ],
            ),
          ],
              ),
            ),
          ],
        ),
        ),

      ],
    );
  }

  Widget _buildProgrammeItem(String programmeName, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 16),
        Text(
          programmeName,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class StaffsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add your staff details here
    return StaffContent();
  }
}

class PreviousHodsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add your previous HoDs details here
    return PreviousHodsContent();
  }
}
