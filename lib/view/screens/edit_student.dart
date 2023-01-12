import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/provider_for_student_app.dart';
import '../../db/functions/db_functions.dart';
import '../../db/model/data_model.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/elevatedbutton_widget.dart';
import '../widgets/sizedbox_widget.dart';
import '../widgets/textformfield_widget.dart';

class EditStudent extends StatefulWidget {
  EditStudent(
      {Key? key,
      required this.name,
      required this.age,
      required this.phone,
      required this.place,
      required this.image,
      required this.index,
      required String photo})
      : super(key: key);

  final String name;
  final String age;
  final String phone;
  final String place;
  String image;
  final int index;

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController domainNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    ageController = TextEditingController(text: widget.age);
    phoneNumberController = TextEditingController(text: widget.phone);
    domainNameController = TextEditingController(text: widget.place);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appBarTitle: 'Edit Student',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ProviderForStudentApp>(
                    builder: (context, value, child) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: value.image?.path == null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(
                                    File(widget.image),
                                  ),
                                  radius: 60,
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(
                                    File(value.image!.path),
                                  ),
                                  radius: 60,
                                ),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonWidget(
                          data: 'Add An Image',
                          iconData: Icons.image_outlined,
                          onPressedFn: Provider.of<ProviderForStudentApp>(
                                  context,
                                  listen: false)
                              .getPhoto),
                    ],
                  ),
                  TFFWidget(
                    textControllers: nameController,
                    hintText: 'Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Full Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    textControllers: ageController,
                    hintText: 'Age',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Age ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    keyboardType: TextInputType.number,
                    hintText: 'Phone Number',
                    textControllers: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Phone Number';
                      } else if (value.length != 10) {
                        return 'Enter valid Phone Number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    hintText: 'Place',
                    textControllers: domainNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Place Name ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  ElevatedButtonWidget(
                    data: 'Save',
                    iconData: Icons.save,
                    onPressedFn: () {
                      if (_formKey.currentState!.validate()) {
                        onEditStudentButtonClicked(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onEditStudentButtonClicked(ctx) async {
    final studentmodel = StudentModel(
      name: nameController.text,
      age: ageController.text,
      phone: phoneNumberController.text,
      place: domainNameController.text,
      photo: Provider.of<ProviderForStudentApp>(context, listen: false)
          .image!
          .path,
    );
    editList(widget.index, studentmodel);
    Navigator.of(context).pop();
  }
}
