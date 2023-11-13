import 'package:flutter/material.dart';
import 'package:programme_information_management_system/ModuleDescriptor/ArchitectModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/CivilModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/ECEModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/EModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/GeoModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/ICEModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/ITModuleDes.dart';
import 'package:programme_information_management_system/ModuleDescriptor/WaterModuleDes.dart';

class ModuleDescriptorPage extends StatefulWidget {
  @override
  _ModuleDescriptorPageState createState() => _ModuleDescriptorPageState();
}

class _ModuleDescriptorPageState extends State<ModuleDescriptorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module Descriptor'),
        backgroundColor: const Color(0xFF0028A8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProgramCard(
                name: 'Information Technology Engineering',
                image: 'assets/undraw_Software_engineer_re_tnjc.png',
                pageToNavigate: ITModuleDesPage(),
              ),
              ProgramCard(
                name: 'Civil Engineering',
                image: 'assets/undraw_QA_engineers_dg5p.png',
                pageToNavigate: CivilModuleDesPage(),
              ),
              ProgramCard(
                name: 'Geology Engineering',
                image: 'assets/undraw_QA_engineers_dg5p.png',
                pageToNavigate: GeoModuleDesPage(),
              ),
              ProgramCard(
                name: 'Architecture',
                image: 'assets/undraw_urban_design_kpu8.png',
                pageToNavigate: ArchitectModuleDesPage(),
              ),
              ProgramCard(
                name: 'Electrical Engineering',
                image: 'assets/undraw_electricity_k2ft.png',
                pageToNavigate: EModuleDesPage(),
              ),
              ProgramCard(
                name: 'Electronic and Communication Engineering',
                image: 'assets/undraw_circuit_sdmr.png',
                pageToNavigate: ECEModuleDesPage(),
              ),
              ProgramCard(
                name: 'Water Engineering',
                image: 'assets/undraw_Science_re_mnnr.png',
                pageToNavigate: WaterModuleDesPage(),
              ),
              ProgramCard(
                name: 'Instrumentation and Controls Engineering',
                image: 'assets/undraw_circuit_sdmr.png',
                pageToNavigate: ICEModuleDesPage(),
              ),
              // Add more program cards for other programs
            ],
          ),
        ), 
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String name;
  final String image;
  final Widget pageToNavigate;

  ProgramCard({
    required this.name,
    required this.image,
    required this.pageToNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageToNavigate));
          // Add functionality to display program details
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2), // Adjust the left padding as needed
                child: Container(
                  width: 150,
                  height: 50,
                  // padding: EdgeInsets.only(left: 2), // Padding on the left side of the image
                  child: Image.asset(image),
                ),
              ),
              // Container(
              //   width: 150,
              //   height: 50,
              //   child: Image.asset(image),
              // ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               const Icon(Icons.arrow_forward), // Arrow icon
            ],
          ),
        ),
      ),
    );
  }
}
