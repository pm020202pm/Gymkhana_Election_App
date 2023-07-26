
import 'package:flutter/material.dart';
import 'package:gymkhana/pages/result.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import '../functions.dart';
import '../widgets/button.dart';
import 'admin_login.dart';
import 'voter_login.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Client? httpClient;
  Web3Client? ethClient;
  TextEditingController controller = TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                buttonText: 'Admin Page',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: Colors.blue[800],
                buttonBgColor: Colors.blue[200],
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin()));
                },
                height: 60, width: 200, borderRadius: 15
            ),
            const SizedBox(height: 20,),
            Button(
                buttonText: 'Voter Page',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: Colors.green[800],
                buttonBgColor: Colors.green[200],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                height: 60, width: 200, borderRadius: 15
            ),
            const SizedBox(height: 20,),
            Button(
                buttonText: 'See Result',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: Colors.purple[400],
                buttonBgColor: Colors.purple[100],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Result(ethClient: ethClient!)));
                },
                height: 60, width: 200, borderRadius: 15
            ),
          ],
        ),
      ),
    );
  }
}
