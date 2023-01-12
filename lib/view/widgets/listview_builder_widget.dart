import 'dart:io';

import 'package:flutter/material.dart';
import '../../db/model/data_model.dart';
import '../screens/student_full_details.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final List<StudentModel> studentListData;
  final String? queryString;
  const ListViewBuilderWidget({
    super.key,
    required this.studentListData,
    this.queryString,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final data = studentListData[index];
        if (data.name.toLowerCase().contains(queryString!.toLowerCase())) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullDetails(
                        age: data.age,
                        place: data.place,
                        index: index,
                        name: data.name,
                        phone: data.phone,
                        photo: data.photo,
                      ),
                    ),
                  );
                },
                title: Text(data.name),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: FileImage(File(data.photo)),
                ),
              ),
              const Divider()
            ],
          );
        } else {
          return Container();
        }
      },
      itemCount: studentListData.length,
    );
  }
}
