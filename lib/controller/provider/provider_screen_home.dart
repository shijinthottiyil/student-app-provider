import 'package:flutter/material.dart';
import '../../view/screens/add_student.dart';
import '../../view/screens/search_student.dart';

class ProviderScreenHome with ChangeNotifier {
  void gotoAddStudent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const AddStudent();
        },
      ),
    );
  }

  void gotoSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: Search(),
    );
  }
}
