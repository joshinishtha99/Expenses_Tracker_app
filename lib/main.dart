import 'package:expense/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:expense/widgets/bottomnavigationbar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/model/add_date.dart';

void main() async {
  print("Before ensureInitialized");
  WidgetsFlutterBinding.ensureInitialized();
  print("Before Firebase.initializeApp");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Before Hive.initFlutter");
  await Hive.initFlutter();
  print("Before Hive.registerAdapter");
  print("Before Hive.openBox");
  Hive.registerAdapter(AdddataAdapter());
  try {

  await Hive.openBox<Add_data>('data');
} catch (e) {
  print('Error opening box: $e');
}

  print("Before runApp");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}
