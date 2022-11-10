import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'db/model/data_model.dart';
import 'screens/home/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(
      StudentModelAdapter(),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Database',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 19, 17, 21),
      ),
      home: const ScreenHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
