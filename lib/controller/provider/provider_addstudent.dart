import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../db/functions/db_functions.dart';
import '../../db/model/data_model.dart';
import '../provider/provider_for_student_app.dart';

class ProviderAddStudent with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  bool imageAlert = false;
  final formKey = GlobalKey<FormState>();

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final phone = phoneNumberController.text.trim();
    final place = placeController.text.trim();

    if (name.isEmpty ||
        age.isEmpty ||
        phone.isEmpty ||
        place.isEmpty ||
        Provider.of<ProviderForStudentApp>(
          context,
          listen: false,
        ).image!.path.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          content: Text("Sucessfully Student Added .. "),
        ),
      );
    }

    final student = StudentModel(
        name: name,
        age: age,
        phone: phone,
        place: place,
        photo: Provider.of<ProviderForStudentApp>(
          context,
          listen: false,
        ).image!.path);
    addStudent(student);
  }

  void saveBtn(BuildContext context) {
    if (formKey.currentState!.validate() &&
        Provider.of<ProviderForStudentApp>(context, listen: false).image !=
            null) {
      onAddStudentButtonClicked(context);
      Navigator.pop(context);
    } else {
      imageAlert = true;
    }
  }
}
