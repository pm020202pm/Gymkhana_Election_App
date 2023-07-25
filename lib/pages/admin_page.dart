import 'package:flutter/material.dart';
import 'package:gymkhana/pages/voters.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import '../constants.dart';
import '../functions.dart';
import '../widgets/button.dart';
import '../widgets/custom_textfield.dart';
import 'candidates.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Client? httpClient;
  Web3Client? ethClient;
  TextEditingController electionName = TextEditingController();
  TextEditingController durationMinutes = TextEditingController();
  TextEditingController candidateName = TextEditingController();
  TextEditingController voterAddress = TextEditingController();
  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80,),
              Text('ADMIN', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[800], fontSize: 30),),
              const SizedBox(height: 15,),
              const Divider(thickness: 1,),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(child: CustomTextField(controller: electionName, obscureText: false, boxHeight: 60, hintText: 'Enter election name',)),
                  const SizedBox(width: 15,),
                  Expanded(child: CustomTextField(controller: durationMinutes, obscureText: false, boxHeight: 60, hintText: 'duration (minutes)',)),
                ],
              ),
              const SizedBox(height: 10,),
              Button(
                  splashColor: Colors.blue[400],
                  buttonText: 'START ELECTION',
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.blue[800],
                  buttonBgColor: Colors.blue[100],
                  onPressed: () async {
                    int minute = int.parse(durationMinutes.text);
                    await startElection(electionName.text,minute,  ethClient!);
                    electionName.clear();
                    durationMinutes.clear();
                  },
                  height: 50, width: double.infinity, borderRadius: 15
              ),
              const SizedBox(height: 60,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomTextField(controller: candidateName, obscureText: false, boxHeight: 60, labelText: 'Candidate name',),
                        const SizedBox(height: 15,),
                        Button(
                            splashColor: Colors.purple[400],
                            buttonText: 'See Registered\nCandidate',
                            textColor: Colors.purple[800],
                            buttonBgColor: Colors.purple[200],
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> CandidateList(ethClient: ethClient!)));
                            },
                            height: 43, width: 180, borderRadius: 15
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    children: [
                      Button(
                          splashColor: Colors.green[400],
                          buttonText: 'Register as President',
                          textColor: Colors.green[800],
                          buttonBgColor: Colors.green[200],
                          onPressed: () async {
                            await addPresident(candidateName.text, ethClient!);
                            candidateName.clear();
                          },
                          height: 32, width: 180, borderRadius: 10
                      ),
                      const SizedBox(height: 9,),
                      Row(
                        children: [
                          Button(
                              splashColor: Colors.green[400],
                              buttonText: 'GnS',
                              textColor: Colors.green[800],
                              buttonBgColor: Colors.green[200],
                              onPressed: () async {
                                await addGNS(candidateName.text, ethClient!);
                                candidateName.clear();
                              },
                              height: 32, width: 40, borderRadius: 10
                          ),
                          const SizedBox(width: 6,),
                          Button(
                              splashColor: Colors.green[400],
                              buttonText: 'SnT',
                              textColor: Colors.green[800],
                              buttonBgColor: Colors.green[200],
                              onPressed: () async {
                                await addSNT(candidateName.text, ethClient!);
                                candidateName.clear();
                              },
                              height: 32, width: 40, borderRadius: 10
                          ),
                          const SizedBox(width: 6,),
                          Button(
                              splashColor: Colors.green[400],
                              buttonText: 'MnC',
                              textColor: Colors.green[800],
                              buttonBgColor: Colors.green[200],
                              onPressed: () async {
                                await addMNC(candidateName.text, ethClient!);
                                candidateName.clear();
                              },
                              height: 32, width: 40, borderRadius: 10
                          ),
                          const SizedBox(width: 6,),
                          Button(
                              splashColor: Colors.green[400],
                              buttonText: 'AnC',
                              textColor: Colors.green[800],
                              buttonBgColor: Colors.green[200],
                              onPressed: () async {
                                await addANC(candidateName.text, ethClient!);
                                candidateName.clear();
                              },
                              height: 32, width: 40, borderRadius: 10
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Button(
                          splashColor: Colors.green[400],
                          buttonText: 'Register as Senator',
                          textColor: Colors.green[800],
                          buttonBgColor: Colors.green[200],
                          onPressed: () async {
                            await addSenator(candidateName.text, ethClient!);
                            candidateName.clear();
                          },
                          height: 32, width: 180, borderRadius: 10
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const SizedBox(height: 40,),
              CustomTextField(controller: voterAddress, obscureText: false, boxHeight: 60, labelText: 'Voter address',),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Button(
                      splashColor: Colors.green[400],
                      buttonText: 'Register Voter',
                      textColor: Colors.green[800],
                      buttonBgColor: Colors.green[200],
                      onPressed: () async {
                        await authorizeVoter(voterAddress.text, ethClient!);
                        voterAddress.clear();
                      },
                      height: 50, width: 140, borderRadius: 15
                  ),
                  const SizedBox(width: 20,),
                  Button(
                      splashColor: Colors.green[400],
                      buttonText: 'See Registered Voters',
                      textColor: Colors.green[800],
                      buttonBgColor: Colors.green[200],
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> VoterList(ethClient: ethClient!)));
                      },
                      height: 50, width: 180, borderRadius: 15
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
