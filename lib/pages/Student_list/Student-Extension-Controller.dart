part of 'Student-List-Screen.dart';

extension ExtensionStudentController on StudentListScreenState {


  Future<List<StudentModel>> fetchStudentData() async {
    return students;
  }

}