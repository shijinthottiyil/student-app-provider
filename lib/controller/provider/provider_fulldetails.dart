import 'package:flutter/material.dart';
import '../../view/screens/edit_student.dart';

class ProviderFullDetails with ChangeNotifier {
  void gotoEdit(
    BuildContext context,
    String age,
    String place,
    int index,
    String name,
    String phone,
    String photo,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditStudent(
            age: age,
            place: place,
            index: index,
            name: name,
            phone: phone,
            image: photo,
            photo: '',
          );
        },
      ),
    );
  }
}
