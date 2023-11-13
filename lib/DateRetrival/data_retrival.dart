
import 'package:programme_information_management_system/Database/database.dart';

class DataRetrievalService {
  final DatabaseService databaseService = DatabaseService();

  Future<bool> testDatabaseConnection() async {
    await databaseService.connect();
    final isConnected = await databaseService.isConnected();
    await databaseService.closeConnection();
    return isConnected;
  }

 

  Future<List<Map<String, dynamic>>?> getStudents(String deptId) async {
    await databaseService.connect();
    final students = await databaseService.fetchStudents(deptId);
    await databaseService.closeConnection();
    return students;
  }

  Future<List<Map<String, dynamic>>?> getStaff(String hodid) async {
  await databaseService.connect();
  final students = await databaseService.fetchStaff(hodid);
  await databaseService.closeConnection();
  return students;
}

  // Add more methods for other data retrieval operations if needed
}
