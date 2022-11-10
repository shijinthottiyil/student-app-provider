import 'package:flutter/material.dart';

import '../../db/functions/db_functions.dart';
import 'widgets/add_student.dart';
import 'widgets/list_student.dart';
import 'widgets/search_student.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          title: const Center(
            child: Text(
              'Student Database',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Search(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: FloatingActionButton.extended(
            icon: const Icon(
              Icons.add,
            ),
            backgroundColor: const Color.fromARGB(255, 9, 7, 14),
            label: const Text(
              'Add new Student',
            ),
            onPressed: () {
              Navigator.of(
                context,
              ).push(
                MaterialPageRoute(
                  builder: (
                    context,
                  ) =>
                      const AddStudent(),
                ),
              );
            },
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: ListStudent(),
        ),
      ),
    );
  }
}
