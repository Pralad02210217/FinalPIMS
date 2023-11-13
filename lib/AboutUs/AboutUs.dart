import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AboutUsPage()));

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xFF0028A8),
        centerTitle: true,
      ),
      body: AboutUsContent(),
    );
  }
}

class AboutUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16.0),
          child: Image.asset(
            'assets/cst.jpg', // Replace with the path to your logo image
            height: 100, // Set the height of the logo
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 96, 156), // Title text color
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Programme Information Management System',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 41, 76, 102), // Title text color
                ),
              ),
              SizedBox(height: 16),
              Text(
                'The primary objective of the PIMS project is to eliminate the challenge of accessing academic information by designing a focused software solution. PIMS centralizes and streamlines the display of program and module information, making it easily accessible for students and faculty. This system enhances the educational experience by providing an organized and intuitive interface to access essential academic resources.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Content text color
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              Text(
                'About Development',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 96, 156),
                  // color: Colors.blue, // Title text color
                ),
              ),
              
              SizedBox(height: 16),
              Text(
                'Developed as a mini-project, our app, the Programme Information Management System (PIMS), is the outcome of our team''s collective efforts to streamline academic information access.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Content text color
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
            ],
            
          ),
          
        ),
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Developed By',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 96, 156),
                  //color: Colors.blue, // Title text color
                ),
              ),
              SizedBox(height: 8),
              DeveloperCard(
                name: 'Pralad Mishra',
              ),
              DeveloperCard(
                name: 'Aniketh Powdel',
              ),
              DeveloperCard(
                name: 'Loday Tempa Gyeltshen',
              ),
              DeveloperCard(
                name: 'Tshering Yangdon',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;

  const DeveloperCard({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.orange, // Orange border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.person, size: 32, color: Color.fromARGB(255, 0, 40, 168)), // Developer icon
          SizedBox(width: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Name text color
            ),
          ),
        ],
      ),
    );
  }
}
