part of 'Student-List-Screen.dart';

extension ExtensionStudentController on StudentListScreenState {
  void getAllStudents() {
    displayAllStudents = students;
  }

  void _searchFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      getAllStudents();
    } else {
      displayAllStudents = students
          .where((studentName) =>
              studentName.name!.toUpperCase().contains(enteredKeyword.toUpperCase()))
          .toList();
    }
  }
}
