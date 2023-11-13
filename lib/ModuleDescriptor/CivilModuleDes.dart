import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: CivilModuleDesPage(),
  ));
}

class CivilModuleDesPage extends StatefulWidget {
  @override
  _CivilModuleDesPageState createState() => _CivilModuleDesPageState();
}

class _CivilModuleDesPageState extends State<CivilModuleDesPage> {
  List<SemesterData> semesters = [
    SemesterData(
      name: 'Semester 1',
      modules: [
        ModuleData(
          name: 'MAT101',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'PHY101',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'CTE101',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CPL101',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'ACS101',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 2',
      modules: [
        ModuleData(
          name: 'CPL102',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'MAT102',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'MAT110',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'DIS101',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'ECD202',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 3',
      modules: [
        ModuleData(
          name: 'DZG101',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE202',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'MAT205',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'NWC201',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE203',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 4',
      modules: [
        ModuleData(
          name: 'CTE204',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE205',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'CTE206',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE207',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'NWC202',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 5',
      modules: [
        ModuleData(
          name: 'CTE305',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE308',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'CTE307', 
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE306',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/10157/mod_resource/content/2/CTE306%20Mobile%20Application%20Development.pdf',
        ),
        ModuleData(
          name: 'DIS302',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/10157/mod_resource/content/2/CTE306%20Mobile%20Application%20Development.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 6',
      modules: [
        ModuleData(
          name: 'DIS302',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'DIS303',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'Elective I',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'MGT401',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'PRW301',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 7',
      modules: [
        ModuleData(
          name: 'DIS404',
          pdfUrl: 
            'https://vle.cst.edu.bt/pluginfile.php/47676/mod_resource/content/1/CTE305%20Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'MAT412',
          pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/44312/mod_resource/content/1/Module%20descriptor-CTE308.pdf',
        ),
        ModuleData(
          name: 'DIS405',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'CTE412',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'Elective II',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ModuleData(
          name: 'IRP401',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
      ],
    ),
    SemesterData(
      name: 'Semester 8',
      modules: [
        ModuleData(
          name: 'IRP401',
          pdfUrl: 'https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf',
          // pdfUrl: 'https://vle.cst.edu.bt/pluginfile.php/43964/mod_resource/content/1/Module%20Descriptor.pdf',
        ),
        ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(msg: 'Initializing...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IT Module Descriptor'),
        backgroundColor: Color(0xFF0028A8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: semesters.length,
          itemBuilder: (context, index) {
            return SemesterExpansionTile(semester: semesters[index]);
          },
        ),
      ),
    );
  }
}

class SemesterData {
  final String name;
  final List<dynamic> modules;

  SemesterData({
    required this.name,
    required this.modules,
  });
}

class SemesterExpansionTile extends StatelessWidget {
  final SemesterData semester;

  SemesterExpansionTile({
    required this.semester,
  });

  // Future<void> downloadAndShowToast(String url, String pdfName) async {
  //   final status = await Permission.storage.request();
  //   print('Permission status: $status');
  //   if (status.isGranted) {
  //     final directory = Directory('/storage/emulated/0/Download'); // Specify the download folder path

  //     if (await directory.exists()) {
  //       final savedDir = directory.path;
  //       final savedFile = File('$savedDir/$pdfName');

  //       if (await savedFile.exists()) {
  //         // File already exists, show a message
  //         Fluttertoast.showToast(
  //           msg: '$pdfName already downloaded',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //         );
  //       } else {
  //         // File doesn't exist, download it
  //         try {
  //           final response = await http.get(Uri.parse(url));
  //           final bytes = response.bodyBytes;
  //           await savedFile.writeAsBytes(bytes);

  //           // Show a download completed message
  //           Fluttertoast.showToast(
  //             msg: '$pdfName downloaded successfully',
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //           );

  //         } catch (e) {
  //           // Handle download error
  //           print('Download error: $e');
  //           Fluttertoast.showToast(
  //             msg: 'Error downloading $pdfName',
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //           );
  //         }
  //       }
  //     } else {
  //       print('Download directory does not exist');
  //     }
  //   } else {
  //     print('Permission denied');
  //     // Handle permission denied
  //     Fluttertoast.showToast(
  //       msg: 'Permission denied to save the PDF.',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: ExpansionTile(
        title: Text(semester.name),
        children: semester.modules
            .map((module) => module is ModuleData
                // ? ListTile(
                //     title: Text(module.name),
                //     onTap: () async {
                //       final url = module.pdfUrl;
                //       await downloadAndShowToast(url, '${module.name}.pdf');
                //     },
                //   )


                // ?ListTile(
                //   title: Text(module.name),
                //   onTap: () async {
                //       final url = module.pdfUrl;
                //       if (await canLaunch(url)) {
                //         await launch(url);
                //       } else {
                //         Fluttertoast.showToast(
                //           msg: 'Error opening the PDF.',
                //           toastLength: Toast.LENGTH_SHORT,
                //           gravity: ToastGravity.BOTTOM,
                //         );
                //       }
                //   },
                //   )


                ?ListTile(
                  title: Text(module.name),
                  onTap: () async {
                    final url = module.pdfUrl;
                    bool canLaunchUrl = await canLaunch(url);

                    if (canLaunchUrl) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('Do you want to download this PDF?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await launch(url);
                                // Perform download action
                              },
                              child: const Text('Download'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Error opening the PDF.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
                  },
                )
                : ListTile(
                    title: Text(module),
                    onTap: () {
                      // Handle non-ModuleData items as needed
                    },
                  ))
            .toList(),
      ),
    );
  }
}

class ModuleData {
  final String name;
  final String pdfUrl;

  ModuleData({
    required this.name,
    required this.pdfUrl,
  });
}