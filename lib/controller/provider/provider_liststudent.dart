import 'package:flutter/material.dart';
import '../../view/screens/student_full_details.dart';

class ProviderListStudent with ChangeNotifier {
  void gotoFullDetails(
    BuildContext context,
    String name,
    String age,
    String phone,
    String place,
    String photo,
    int index,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return FullDetails(
            name: name,
            age: age,
            phone: phone,
            place: place,
            photo: photo,
            index: index,
          );
        }),
      ),
    );
  }
}
