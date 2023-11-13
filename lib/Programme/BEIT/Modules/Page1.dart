import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skeleton_text/skeleton_text.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late Future<List<Map<String, String>>> semester1Data;
  late Future<List<Map<String, String>>> semester2Data;

  @override
  void initState() {
    super.initState();
    semester1Data = fetchData('https://node-api-6l0w.onrender.com/api/v1/students/modules/P08/1');
    semester2Data = fetchData('https://node-api-6l0w.onrender.com/api/v1/students/modules/P08/2');
  }

 Future<List<Map<String, String>>>
    fetchData(String apiUrl) async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> apiResponse = json.decode(response.body);
    final List<Map<String, String>> stringData = apiResponse
        .map((item) {
          final Map<String, String> stringItem = {};
          item.forEach((key, value) {
            stringItem[key] = value.toString();
          });
          return stringItem;
        })
        .toList();
    print(stringData);
    return stringData;
  } else {
    throw Exception('Failed to load data');
  }
}



  @override
  Widget build(BuildContext context) {
  return ListView(
    children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 900,
          child: Column(
            children: [
                buildSemesterTable("Semester 1", semester1Data),
                SizedBox(height: 16),
                buildSemesterTable("Semester 2", semester2Data),
                SizedBox(height: 10),
      
            ],
          ),
        ),
      )

    ],
  );
}


  Widget buildSemesterTable(String title, Future<List<Map<String, String>>> data) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        FutureBuilder<List<Map<String, String>>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // return CircularProgressIndicator();
              return SkeletonLoading();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data available.');
            } else {
              print(snapshot.data);
              return Row(
                children: <Widget>[
                  Expanded(
                      child: FixedColumn(data: snapshot.data!),
                    ),
                  Expanded(
                    child: SemesterTable(data: snapshot.data!, columnsToDisplay: ['mid', 'mname','module_credit','lecture_hour','tutorial_hour','theory_ca_marks','theory_exam_marks','practical_ca_marks','module_owner', 'borrowed_module']),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class SkeletonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
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
        Text('Loading...', style: TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}



final Map<String, String> columnHeadersMapping = {
  
  'mname': 'Name',
  'module_credit' : 'Credit',
  'lecture_hour' : 'Lecture Hour',
  'tutorial_hour' : 'Tutorial Hour',
  'practical_hour' : 'Practical Hour',
  'theory_ca_marks' : 'Theory CA Marks',
  'theory_exam_marks' : 'Thoery EX Marks',
  'practical_ca_marks' : 'Practical CA Marks',
  'module_owner': 'Module Owner',
  'module_coordinator' : 'Module Coordinator',
  'borrowed_module' : 'Borrowed Module',

  // Add more key-value pairs for other columns as needed
};
final Map<String, String> moduleOwnerMapping = {
  'D04': 'ITDEPT',
  'D01': 'CIVILDEPT',
  'D02': 'ELECTRICALDEPT',
  'D03': 'ECEDEPT',
  'D05' : 'Sci-Humanties Dept'
  // Add more key-value pairs for other replacements as needed
};

final Map<String, String> moduleBorrowed = {
  'Y' : 'Yes',
  'N' : 'No',
};

class SemesterTable extends StatelessWidget {
  final List<Map<String, String>> data;
  final List<String> columnsToDisplay;

  SemesterTable({required this.data, required this.columnsToDisplay});

  @override
  Widget build(BuildContext context) {
    print(data);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10.0,
        columns: data.first.keys
            .where((key) => columnsToDisplay.contains(key) && key != 'mid') // Filter columns to display
            .map((column) {
              return DataColumn(
                label: Text(columnHeadersMapping[column] ?? column),
                numeric: false,
              );
            }).toList(),
        rows: data.map((row) {
          final moduleOwner = (row['module_owner'] ?? '').trim();
          final borrowedModule = row['borrowed_module'];
          if (borrowedModule != null) {
            row['borrowed_module'] = moduleBorrowed[borrowedModule] ?? borrowedModule;
          }
          if (moduleOwner != null) {
            row['module_owner'] = moduleOwnerMapping[moduleOwner] ?? moduleOwner;
          }
          return DataRow(
            cells: data.first.keys
                .where((key) => columnsToDisplay.contains(key) && key!= 'mid') // Filter columns to display
                .map((column) {
                  return DataCell(
                    Text(row[column] ?? ""),
                  );
                }).toList(),
          );
        }).toList(),
      ),
    );
  }
}





class FixedColumn extends StatelessWidget {
  final List<Map<String, String>> data;

  FixedColumn({required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [DataColumn(label: Text('Module Code'))],
        rows: data.map((row) {
          return DataRow(
            cells: [DataCell(Text(row['mid'] ?? ""))],
          );
        }).toList(),
      ),
    );
  }
}
