import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/fab_widget.dart';
import '../widgets/sizedbox_widget.dart';
import '../widgets/text_widget.dart';
import '../../controller/provider/provider_fulldetails.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({
    Key? key,
    required this.name,
    required this.age,
    required this.phone,
    required this.place,
    required this.photo,
    required this.index,
  }) : super(
          key: key,
        );
  final String name;
  final String age;
  final String phone;
  final String place;
  final String photo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          appBarTitle: 'Full Details Of Student',
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBoxWidget(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 30,
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(
                      File(
                        photo,
                      ),
                    ),
                  ),
                ),
                const SizedBoxWidget(height: 70.0),
                TextWidget(
                  data: "Full Name: $name",
                ),
                const SizedBoxWidget(),
                TextWidget(
                  data: "Age: $age",
                ),
                const SizedBoxWidget(),
                TextWidget(
                  data: "Phone Number: $phone",
                ),
                const SizedBoxWidget(),
                TextWidget(
                  data: "place: $place",
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FabWidget(
          icon: Icons.edit,
          onPressedFunction: (() {
            Provider.of<ProviderFullDetails>(context, listen: false).gotoEdit(
              context,
              age,
              place,
              index,
              name,
              phone,
              photo,
            );
          }),
        ),
      ),
    );
  }
}
