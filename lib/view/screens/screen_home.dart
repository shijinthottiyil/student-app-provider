import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/provider_screen_home.dart';
import '../../db/functions/db_functions.dart';
import 'list_student.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/fab_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return SafeArea(
        child: Scaffold(
      appBar: AppBarWidget(
        appBarTitle: 'Student Database',
        actionsWidgets: [
          IconButton(
            onPressed: () {
              Provider.of<ProviderScreenHome>(context, listen: false)
                  .gotoSearch(context);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: ListStudent(),
      ),
      floatingActionButton: FabWidget(
        icon: Icons.add,
        onPressedFunction: () {
          Provider.of<ProviderScreenHome>(context, listen: false)
              .gotoAddStudent(context);
        },
      ),
    ));
  }
}
