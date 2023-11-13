import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programme_information_management_system/Departments/Department.dart';
import 'package:programme_information_management_system/Programme/Programme.dart';
import 'package:programme_information_management_system/Settings/Settings.dart';


class LandingPage extends StatefulWidget {
  final TabController tabController;

  const LandingPage({Key? key, required this.tabController}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;
  PageController _pageController = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to automatically change the page every 2 seconds
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentPage < imagePaths.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  List<String> imagePaths = [
    'assets/page-1/images/rectangle-2.png',
    'assets/DSC03931.JPG',
    'assets/DSC03938.JPG',
    'assets/DSC03941.JPG',
    'assets/DSC04026.JPG',
  ];

  TextStyle safeGoogleFont(
    String fontName, { 
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) {
    return GoogleFonts.getFont(
      fontName,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 1120 * fem,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 390 * fem,
                    height: 193 * fem,
                    child: PageView(
                      controller: _pageController, // Use PageController
                      children: imagePaths.map((imagePath) {
                        return Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25 * fem),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              // ... Rest of your code
              Positioned(
                left: 0 * fem,
                top: 10 * fem,
                child: Container(
                  width: 390 * fem,
                  height: 233 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 155 * fem,
                        top: 153 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 80 * fem,
                            height: 80 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40 * fem),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/page-1/images/ellipse-1-bg.png',
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x3f000000),
                                    offset: Offset(0 * fem, 4 * fem),
                                    blurRadius: 2 * fem,
                                  ),
                                  BoxShadow(
                                    color: const Color(0x3f000000),
                                    offset: Offset(0 * fem, 4 * fem),
                                    blurRadius: 2 * fem,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 44.5 * fem,
                top: 280 * fem,
                child: Align(
                  child: SizedBox(
                    width: 311 * fem,
                    height: 40 * fem,
                    child: Text(
                      '"In pursuit of tomorrow’s technologist"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 38, 120, 187),
                        // color: Color(0xff00a3ff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22.5 * fem,
                top: 323 * fem,
                child: Align(
                  child: SizedBox(
                    width: 339 * fem,
                    height: 90 * fem,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Our Vision\n',
                            style: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 21, 96, 156),
                              // color: Color(0xff469d38),
                            ),
                          ),
                          const TextSpan(
                            text:
                                '"A centre of excellence in science and technology enriched with GNH values."',
                            style: TextStyle(
                              fontSize: 17,
                               color: Color.fromARGB(255, 42, 101, 146), 
                            ),
                            ),
                            
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 33 * fem,
                top: 423 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 688 * fem),
                  width: 320 * fem,
                  height: 1249 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20 * fem, 20 * fem, 0 * fem, 11 * fem),
                        width: 279 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 119 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to the DepartmentsPage when 7 Departments is clicked
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => DepartmentPage()),
                                      // );
                                      // TabController.animateTo(1);
                                      widget.tabController.animateTo(2);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                      padding: EdgeInsets.fromLTRB(12 * fem, 27 * fem, 5 * fem, 28 * fem),
                                      width: 133 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 116 * fem,
                                            ),
                                            child: Text(
                                              '7\nDepartments',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to the ProgrammesPage when 10 Programmes is clicked
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => ProgrammePage()),
                                      // );
                                      // _tabController.animateTo(2);
                                      widget.tabController.animateTo(2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(13 * fem, 27 * fem, 13 * fem, 28 * fem),
                                      width: 133 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20 * fem),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 107 * fem,
                                            ),
                                            child: Text(
                                              '10\nProgrammes',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 31 * fem,
                            ),
                            Container(
                              width: double.infinity,
                              height: 119 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to the NewProgrammesPage when 3 New Programmes is clicked
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => ProgrammePage()),
                                      // );
                                      // _tabController.animateTo(2);
                                      widget.tabController.animateTo(2);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                      padding: EdgeInsets.fromLTRB(12 * fem, 7 * fem, 14 * fem, 7 * fem),
                                      width: 133 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20 * fem),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 107 * fem,
                                            ),
                                            child: Text(
                                              '3\nNew\nProgrammes',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to the NotificationsPage when 1 Notifications is clicked
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => Settings()),
                                      // );
                                      // _tabController.animateTo(1);
                                      widget.tabController.animateTo(2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(11 * fem, 23 * fem, 11 * fem, 32 * fem),
                                      width: 133 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20 * fem),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 111 * fem,
                                            ),
                                            child: Text(
                                              '1\nNotifications',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 31 * fem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 38.5 * fem,
                top: 750 * fem,
                child: Align(
                  child: SizedBox(
                    width: 319 * fem,
                    height: 320 * fem,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text:
                              'The College of Science and Technology (CST) is the first institute in the country to offer undergraduate degree programmes in engineering under the Royal University of Bhutan.  The college aspires to be a centre of excellence in the field of science and technology-enriched with GNH values by offering quality programmes that are relevant to the need of the job market both within and outside the country.',
                            style: TextStyle(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                            ),
                          ),     
                          
                          TextSpan(
                            text:
                              '\n\nCollege of Science and Technology (CST), is responsible to oversee the tertiary education system in the Kingdom of Bhutan in the field of science and technology. Our campus offers high-quality learning, teaching and research spaces to better meet the needs of students, academics and researchers.',
                            style: TextStyle(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                            ),
      
                          ),       
                          TextSpan(
                            text:
                              '\n\nAll the academic programmes offered by the College are validated and adopted by the Royal University of Bhutan (RUB) and National Accreditation Council of Bhutan.',
                            style: TextStyle(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff000000),
                            ),
      
                          ),               
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
