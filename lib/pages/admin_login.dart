import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import '../constants.dart';
import '../widgets/button.dart';
import '../widgets/custom_textfield.dart';
import 'admin_page.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);
  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  Client? httpClient;
  Web3Client? ethClient;
  TextEditingController adminKey = TextEditingController();
  late String privateKey;


  void userNotRegisteredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(''),
          content: const Text('You are not Admin'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(controller: adminKey, obscureText: true, boxHeight: 60, labelText: 'Owner Key',),
              const SizedBox(height: 40,),
              Button(
                  splashColor: Colors.green[400],
                  buttonText: 'Enter as Admin',
                  textColor: Colors.green[800],
                  buttonBgColor: Colors.green[200],
                  onPressed: () async {
                    setState(() {
                      privateKey=adminKey.text;
                    });
                    if(privateKey != ''){
                      if(privateKey == owner_private_key){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminPage()));
                      }
                      else{
                        userNotRegisteredDialog();
                      }
                    }
                  },
                  height: 50, width: double.infinity, borderRadius: 15
              )
            ],
          ),
        ),
      ),
    );
  }
}
