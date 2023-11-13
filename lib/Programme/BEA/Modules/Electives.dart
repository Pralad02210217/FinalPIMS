import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:programme_information_management_system/Programme/BEIT/Modules/Page1.dart';

class Electives extends StatefulWidget {
  @override
  _ElectivesState createState() => _ElectivesState();
}

class _ElectivesState extends State<Electives> {
  List<Map<String, dynamic>> dataSemester1 = [];
  List<Map<String, dynamic>> dataSemester2 = [];
  List<Map<String, dynamic>> dataSemester3 = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

    Future<void> fetchDataFromAPI() async {
    final apiUrl = 'https://node-api-6l0w.onrender.com/api/v1/students/electives/P08';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> jsonData = (json.decode(response.body) as List<dynamic>).cast<Map<String, dynamic>>();

        print(jsonData);
          jsonData.forEach((item) {
          item['eid'] = item['eid'].toString().trim();
        });

        dataSemester1 = jsonData
            .where((item) => item['eid'] == 'E1')
            .toList();
      print(dataSemester1);
        dataSemester2 = jsonData
            .where((item) => item['eid'] == 'E2')
            .toList();

        dataSemester3 = jsonData
            .where((item) => item['eid'] == 'E3')
            .toList();

        setState(() {});
      }
    else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 900,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SectionWidget('Elective 1', dataSemester1),
              const SizedBox(
                height: 20,
              ),
              SectionWidget('Elective 2', dataSemester2),
              const SizedBox(
                height: 20,
              ),
              SectionWidget('Elective 3', dataSemester3),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String sectionTitle;
  final List<Map<String, dynamic>> data;

  SectionWidget(this.sectionTitle, this.data);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(sectionTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: <Widget>[
            FixedColumn(data: data),
            Expanded(
              child: SemesterTable(data: data),
            ),
          ],
        ),
      ],
    );
  }
}

class SemesterTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  SemesterTable({required this.data});
      final Map<String, String> columnNames = {
    'ename': 'Name',
    'specilization': 'Specilization ',
  };

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return SkeletonLoading();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10.0,
        columns: data.first.keys
            .where((key) => key != 'mcode' && key != 'pid' && key != 'eid')
            .map((column) {
          return DataColumn(
            label: Text(columnNames[column] ??column),
            numeric: false,
          );
        }).toList(),
        rows: data.map((row) {
          return DataRow(
            cells: data.first.keys
                .where((key) => key != 'mcode' && key != 'pid' && key != 'eid')
                .map((column) {
              return DataCell(
                Text(row[column].toString() ?? ""),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}

class FixedColumn extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  FixedColumn({required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return SizedBox.shrink(); 
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [DataColumn(label: Text('Code'))],
        rows: data.map((row) {
          return DataRow(
            cells: [DataCell(Text(row['mcode'].toString() ?? ""))],
          );
        }).toList(),
      ),
    );
  }
}
