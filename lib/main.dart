import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kpu_app/firebase_options.dart';
import 'package:kpu_app/home_page.dart';

void main() async {
  //mengintegrasikan aplikasi flutter dengan firbase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
