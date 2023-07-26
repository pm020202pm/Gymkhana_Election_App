import 'package:flutter/material.dart';
import 'package:gymkhana/pages/home.dart';
import 'package:gymkhana/pages/result.dart';
import 'package:gymkhana/pages/voter_login.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import '../constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Client? httpClient;
  Web3Client? ethClient;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login' : (context) => Login(),
        '/result' : (context) => Result(ethClient: ethClient!),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
