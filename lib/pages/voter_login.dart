
import 'package:flutter/material.dart';
import 'package:gymkhana/pages/voter_page.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

import '../constants.dart';
import '../functions.dart';
import '../widgets/button.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Client? httpClient;
  Web3Client? ethClient;
  final formKey = GlobalKey<FormState>();
  TextEditingController address = TextEditingController();
  TextEditingController key = TextEditingController();
  bool isArrayed = false;

  void userNotRegisteredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('You are not registered as a voter.'),
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: address, obscureText: false, boxHeight: 60, labelText: 'Address',
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Voter address cannot be empty';
                    }
                    if (!(RegExp(r'^0x[0-9a-fA-F]{40}$').hasMatch(address.text))) {
                      return 'Invalid Ethereum address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                CustomTextField(
                  controller: key, obscureText: true, boxHeight: 60, labelText: 'Key',
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Secret key cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40,),
                Button(
                  splashColor: Colors.green[400],
                    buttonText: 'Enter credentials to vote',
                    textColor: Colors.green[800],
                    buttonBgColor: Colors.green[200],
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        setState(() {
                          voter_private_key=key.text;
                          voter_address = address.text;
                        });
                        final isVoterRegistered = await isVoterPresent(address.text, ethClient!);
                        if(isVoterRegistered==true){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectionInfo(ethClient: ethClient!)));
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
      ),
    );
  }
}
