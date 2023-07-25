import 'package:flutter/material.dart';
import 'package:gymkhana/pages/home.dart';
import 'package:gymkhana/pages/voter_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login' : (context) => Login(),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
