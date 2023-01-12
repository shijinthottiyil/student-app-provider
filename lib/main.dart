import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'view/screens/screen_home.dart';
import '../db/model/data_model.dart';
import './controller/provider/provider_for_student_app.dart';
import './controller/provider/provider_screen_home.dart';
import './controller/provider/provider_addstudent.dart';
import './controller/provider/provider_fulldetails.dart';
import './controller/provider/provider_liststudent.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ProviderForStudentApp();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderScreenHome();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderAddStudent();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProviderFullDetails();
          },
        ),
        ChangeNotifierProvider(create: (context) {
          return ProviderListStudent();
        }),
      ],
      child: MaterialApp(
        title: 'Student Database',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 19, 17, 21),
        ),
        home: const ScreenHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
