import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:programme_information_management_system/Programme/BEIT/Modules/Page1.dart';


class PreviousPLContent extends StatelessWidget {
  final String apiUrl = 'https://node-api-6l0w.onrender.com/api/v1/students//department/fullHod/D01';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: SkeletonLoading());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available.'));
          } else {
            final List<dynamic> apiResponse = snapshot.data!;
            return CenterLineLayout(apiResponse: apiResponse);
          }
        },
      ),
    );
  }

  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        final dynamic apiResponse = json.decode(response.body);
        return apiResponse;
      } else {
        print('API Error: Failed to load data');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      print('Network Error: Failed to load data');
      return [];
    }
  }
}
class CenterLineLayout extends StatefulWidget {
  final List<dynamic> apiResponse;

  CenterLineLayout({required this.apiResponse});

  @override
  _CenterLineLayoutState createState() => _CenterLineLayoutState();
}

class _CenterLineLayoutState extends State<CenterLineLayout> {
  @override
  void initState() {
    super.initState();
    print(widget.apiResponse[0]['staffid']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LeftProfileSet(apiResponse: widget.apiResponse),
          Align(
            alignment: Alignment.center, // Center the VerticalLine vertically
            child: VerticalLine(),
          ),
          RightProfileSet(apiResponse: widget.apiResponse),
        ],
      ),
    );
  }
}

class LeftProfileSet extends StatelessWidget {
  final List<dynamic> apiResponse;

  LeftProfileSet({required this.apiResponse});

  @override
  Widget build(BuildContext context) {
    // Create LeftProfileContainer for the first entry in the JSON
    LeftProfileContainer(apiResponse: apiResponse);

    return Row(
      children: [
        LeftProfileContainer(apiResponse: apiResponse),
        SizedBox(width: 16.0), // Space between sets
      ],
    );
  }
}

class RightProfileSet extends StatelessWidget {
  final List<dynamic> apiResponse;

  RightProfileSet({required this.apiResponse});


  @override
  Widget build(BuildContext context) {
      print(apiResponse);
    // Create RightProfileContainer for the first entry in the JSON (if applicable)

    return Row(
      children: [
        SizedBox(width: 16.0), // Space between sets
        RightProfileContainer(apiResponse: apiResponse),
      ],
    );
  }
}


class LeftProfileContainer extends StatelessWidget {
  final dynamic apiResponse;
  LeftProfileContainer({
    required this.apiResponse,
  });
  
  
  @override
  Widget build(BuildContext context) {

    final imageLink= apiResponse[0]['imageurl'];
    final name = apiResponse[1]['name'];
    final starting_tenure = apiResponse[1]['starting_tenure'];
    final dateStartingTenure = starting_tenure.split('T')[0];
    final ending_tenure = apiResponse[1]['ending_tenure'];
    final dateEndingTenure = ending_tenure.split('T')[0];
    final link1 = apiResponse[2]['imageurl'];
    final name1 = apiResponse[3]['name'];
     final starting_tenure1 = apiResponse[3]['starting_tenure'];
    final dateStartingTenure1 = starting_tenure.split('T')[0];
    final ending_tenure1 = apiResponse[3]['ending_tenure'];
    final dateEndingTenure1 = ending_tenure.split('T')[0];

    return Transform.translate(
      offset: Offset(0.0, 0.0), // Adjust the offset (x, y) as needed
      child: Column(
        children: [
          SizedBox(height: 30.0),
          OvalImageContainer(imageUrl: '${imageLink}'),
          SizedBox(height: 120.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.orange), 
            ),
            child: Column(
              children: [
                Text("${name}", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: ${dateStartingTenure}"),
                Text("Ending Tenure: ${dateEndingTenure}"),
                Text("Office: 1st floor ADM"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
          SizedBox(height: 120.0),
          OvalImageContainer(imageUrl: '${link1}'),
          SizedBox(height: 120.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.orange), 
            ),
            child: Column(
              children: [
                Text("${name1}", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: ${dateStartingTenure1}"),
                Text("Ending Tenure: ${dateEndingTenure1}"),
                Text("Office: 1st floor ADM"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RightProfileContainer extends StatelessWidget {
  final dynamic apiResponse;
    RightProfileContainer({
    required this.apiResponse,
  });
  @override
  Widget build(BuildContext context) {
    final link = apiResponse[1]['imageurl'];
    final name = apiResponse[0]['name'];
    final startingTenure = apiResponse[0]['starting_tenure'];
    final dateStartingTenure = startingTenure.split('T')[0]; 
    final endingTenure = apiResponse[0]['ending_tenure'];
    final dateEndingTenure = endingTenure.split('T')[0];
    final name1 = apiResponse[2]['name'];
    final startingTenure1 = apiResponse[2]['starting_tenure'];
    final dateStartingTenure1 = startingTenure.split('T')[0]; 
    final endingTenure1 = apiResponse[2]['ending_tenure'];
    final dateEndingTenure1 = endingTenure.split('T')[0];

    final link2 = apiResponse[3]['imageurl'];
    return Transform.translate(
      offset: Offset(0.0, 5.0), // Adjust the offset (x, y) as needed
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.orange, width: 1.0), 
            ),
            child: Column(
              children: [
                Text("${name}", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: ${dateStartingTenure}"),
                Text("Ending Tenure: ${dateEndingTenure}"),
                Text("Office: 1st floor ADM"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
          SizedBox(height: 120.0),
          OvalImageContainer(imageUrl: '${link}'),
          SizedBox(height: 120.0,),
           Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.orange, width: 1.0), 
            ),
            child: Column(
              children: [
                Text("${name1}", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: ${dateStartingTenure1}"),
                Text("Ending Tenure: ${dateEndingTenure1}"),
                Text("Office: 1st floor ADM"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
           SizedBox(height: 120.0),
          OvalImageContainer(imageUrl: '${link2}'),
        ],
      ),
    );
  }
}


class OvalImageContainer extends StatelessWidget {
  final String imageUrl;

  OvalImageContainer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.orange, // Border color
          width: 2.0, // Border width
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}


class VerticalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.0,
      height: 800.0, // Set a fixed height, adjust as needed
      color: Colors.black,
      child: CustomPaint(
        painter: LinePainter(),
      ),
    );
  }
}


class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final middleX = size.width / 2;

    // Draw the middle vertical line
    final start = Offset(middleX, 0);
    final end = Offset(middleX, size.height);
    canvas.drawLine(start, end, paint);

    // Draw horizontal lines in a zig-zag pattern
    double lineHeight = 100.0; // Start with a height of 100
    bool isLeft = true; // Flag to determine if the next line is left or right

    for (double y = lineHeight; y < size.height; y += lineHeight) {
      final horizontalStart = isLeft
          ? Offset(middleX - 40, y)
          : Offset(middleX, y); // Adjust the starting point
      final horizontalEnd = isLeft
          ? Offset(middleX, y)
          : Offset(middleX + 40, y); // Adjust the ending point
      canvas.drawLine(horizontalStart, horizontalEnd, paint);

      isLeft = !isLeft; // Toggle the flag to switch between left and right

      // Increase the line height to 200 for the next line
      if (y == lineHeight) {
        lineHeight = 200.0;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


