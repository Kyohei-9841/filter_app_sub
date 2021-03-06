import 'package:flutter/material.dart';
import './FirstPage.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(MyApp()); /*1*/
void main() async {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: FirstPage(),
    );
  }
}
