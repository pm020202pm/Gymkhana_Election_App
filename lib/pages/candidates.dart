import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import '../functions.dart';
class CandidateList extends StatefulWidget {
  const CandidateList({Key? key, required this.ethClient}) : super(key: key);
  final Web3Client ethClient;

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Candidates'),
      ),
        body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List>(
            future: getCandidatesNum(widget.ethClient),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    for (int i = 0; i < snapshot.data![0].toInt(); i++)
                      FutureBuilder<List>(
                          future: candidateInfo(i, widget.ethClient),
                          builder: (context, candidatesnapshot) {
                            if (candidatesnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListTile(
                                title: Text('Name: ' + candidatesnapshot.data![0][0].toString()),
                                subtitle: Text('Points: ' + candidatesnapshot.data![0][1].toString()),
                              );
                            }
                          })
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
