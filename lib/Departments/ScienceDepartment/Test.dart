import 'package:flutter/material.dart';

class PreviousHodsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterLineLayout(),
    );
  }
}

class CenterLineLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LeftProfileSet(),
          Align(
            alignment: Alignment.center, // Center the VerticalLine vertically
            child: VerticalLine(),
          ),
          RightProfileSet(),
        ],
      ),
    );
  }
}


class LeftProfileSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LeftProfileContainer(),
        SizedBox(width: 16.0), // Space between sets
      ],
    );
  }
}

class RightProfileSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16.0), // Space between sets
        RightProfileContainer(),
      ],
    );
  }
}

class LeftProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, 0.0), // Adjust the offset (x, y) as needed
      child: Column(
        children: [
          SizedBox(height: 30.0),
          OvalImageContainer(imageUrl: 'https://cst.edu.bt/images/Campus/cstcampus2.jpg'),
          SizedBox(height: 120.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Color(0xff48992c)), 
            ),
            child: Column(
              children: [
                Text("Tandin Wangchuk", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: 12/12/2013"),
                Text("Ending Tenure: 12/12/2013"),
                Text("Office: 2nd floor ITC"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
          SizedBox(height: 120.0),
          OvalImageContainer(imageUrl: 'https://cst.edu.bt/images/Campus/cstcampus2.jpg'),
          SizedBox(height: 120.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Color(0xff48992c)), 
            ),
            child: Column(
              children: [
                Text("Tandin Wangchuk", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: 12/12/2013"),
                Text("Ending Tenure: 12/12/2013"),
                Text("Office: 2nd floor ITC"),
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
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, 5.0), // Adjust the offset (x, y) as needed
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Color(0xff48992c), width: 1.0), 
            ),
            child: Column(
              children: [
                Text("Tandin Wangchuk", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: 12/12/2013"),
                Text("Ending Tenure: 12/12/2013"),
                Text("Office: 2nd floor ITC"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
          SizedBox(height: 120.0),
          OvalImageContainer(imageUrl: 'https://cst.edu.bt/images/Campus/cstcampus2.jpg'),
          SizedBox(height: 120.0,),
           Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Color(0xff48992c), width: 1.0), 
            ),
            child: Column(
              children: [
                Text("Tandin Wangchuk", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("Starting Tenure: 12/12/2013"),
                Text("Ending Tenure: 12/12/2013"),
                Text("Office: 2nd floor ITC"),
                Text("Contact: 17777777"),
              ],
            ),
          ),
           SizedBox(height: 120.0),
          OvalImageContainer(imageUrl: 'https://cst.edu.bt/images/Campus/cstcampus2.jpg'),
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
          color: Colors.green, // Border color
          width: 4.0, // Border width
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

