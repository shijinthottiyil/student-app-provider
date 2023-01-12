import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/provider_for_student_app.dart';
import '../../controller/provider/provider_addstudent.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/sizedbox_widget.dart';
import '../widgets/elevatedbutton_widget.dart';
import '../widgets/textformfield_widget.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appBarTitle: 'Fill The Details',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: Provider.of<ProviderAddStudent>(
                context,
                listen: false,
              ).formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ProviderForStudentApp>(
                    builder: (context, value, child) => Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: value.image?.path == null
                            ? const CircleAvatar(
                                backgroundColor: Colors.black38,
                                radius: 60,
                                child: Icon(
                                  Icons.image,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(
                                  File(
                                    value.image!.path,
                                  ),
                                ),
                                radius: 60,
                              ),
                      ),
                    ),
                  ),
                  const SizedBoxWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonWidget(
                        onPressedFn: Provider.of<ProviderForStudentApp>(context,
                                listen: false)
                            .getPhoto,
                        data: 'Add An Image',
                        iconData: Icons.image_outlined,
                      )
                    ],
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    hintText: 'Full Name',
                    textControllers: Provider.of<ProviderAddStudent>(
                      context,
                      listen: false,
                    ).nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    hintText: 'Age',
                    keyboardType: TextInputType.number,
                    textControllers: Provider.of<ProviderAddStudent>(
                      context,
                      listen: false,
                    ).ageController,
                    validator: (
                      value,
                    ) {
                      if (value == null || value.isEmpty) {
                        return 'Required Age ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    textControllers: Provider.of<ProviderAddStudent>(
                      context,
                      listen: false,
                    ).phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Phone Number';
                      } else if (value.length != 10) {
                        return 'Require valid Phone Number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBoxWidget(),
                  TFFWidget(
                    hintText: 'Place',
                    textControllers: Provider.of<ProviderAddStudent>(
                      context,
                      listen: false,
                    ).placeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Require Place ';
                      } else {
                        return null;
                      }
                    },
                  ),
                  ElevatedButtonWidget(
                    data: 'Save',
                    onPressedFn: () {
                      Provider.of<ProviderAddStudent>(context, listen: false)
                          .saveBtn(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
