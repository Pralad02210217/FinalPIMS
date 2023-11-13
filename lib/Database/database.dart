import 'package:postgres/postgres.dart';

class DatabaseService {
  late PostgreSQLConnection _connection;

  PostgreSQLConnection get connection => _connection;

  Future<void> connect() async {
    _connection = PostgreSQLConnection(
      'ep-green-resonance-78022097.ap-southeast-1.aws.neon.tech',
      5432, // Replace with your PostgreSQL port
      'PIMS', // Replace with your database name
      username: '02210217.cst',
      password: 'kaNvYSH7P6tz',
      useSSL: true, // Enable SSL
    );
    await _connection.open();
  }

  Future<List<Map<String, dynamic>>?> fetchStudents(String deptId) async {
 final result = await _connection.query('SELECT * FROM department WHERE deptid = @deptId', substitutionValues: {'deptId': deptId});

    final students = <Map<String, dynamic>>[];

    for (final row in result) {
      final studentData = <String, dynamic>{};
      for (final entry in row.toColumnMap().entries) {
        studentData[entry.key] = entry.value;
      }
      students.add(studentData);
    }

    return students;
  }
  Future<List<Map<String, dynamic>>?> fetchStaff(String hodid) async {
  final result = await _connection.query('SELECT * FROM staff WHERE sid = @hodid', substitutionValues: {'hodid': hodid});

  final students = <Map<String, dynamic>>[];

  for (final row in result) {
    final studentData = <String, dynamic>{};
    for (final entry in row.toColumnMap().entries) {
      studentData[entry.key] = entry.value;
    }
    students.add(studentData);
  }

  return students;
}


  Future<bool> isConnected() async {
    return !_connection.isClosed;
  }

  // Add more methods for other database operations if necessary

  Future<void> closeConnection() async {
    await _connection.close();
  }
}
