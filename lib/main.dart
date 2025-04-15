import 'package:flutter/material.dart';
import 'package:lyra/lyra_db.dart';
import 'package:lyra/navigator/custom_navigator_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  LyraDb.instance;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LYRA [Tononkira Afafi]',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomNavigatorHome(
        key: null,
      ),
    );
  }
}
