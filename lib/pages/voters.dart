import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import '../functions.dart';
class VoterList extends StatefulWidget {
  const VoterList({Key? key, required this.ethClient}) : super(key: key);
  final Web3Client ethClient;

  @override
  State<VoterList> createState() => _VoterListState();
}

class _VoterListState extends State<VoterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Voters'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List>(
            future: getVotersNum(widget.ethClient),
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
                          future: voterInfo(i, widget.ethClient),
                          builder: (context, votersnapshot) {
                            if (votersnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListTile(
                                title: Text('Address (${i+1}) :\n${votersnapshot.data![0]}'),
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
