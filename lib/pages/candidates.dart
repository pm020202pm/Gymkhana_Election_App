import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import '../functions.dart';
import '../widgets/button.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]
                  ),
                  child: const Text('PRESIDENT CANDIDATES')),
            ),
            FutureBuilder<List>(
              future: getPresidentNum(widget.ethClient),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data![0].toInt(); i++)
                          FutureBuilder<List>(
                              future: presidentInfo(i, widget.ethClient),
                              builder: (context, presiSnapshot) {
                                if (presiSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(presiSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              })
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]
                  ),
                  child: const Text('GnS SECRETARY CANDIDATES')),
            ),
            FutureBuilder<List>(
              future: getGNSNum(widget.ethClient),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data![0].toInt(); i++)
                          FutureBuilder<List>(
                              future: gnsInfo(i, widget.ethClient),
                              builder: (context, secSnapshot) {
                                if (secSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              })
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]
                  ),
                  child: const Text('SnT SECRETARY CANDIDATES')),
            ),
            FutureBuilder<List>(
              future: getSNTNum(widget.ethClient),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data![0].toInt(); i++)
                          FutureBuilder<List>(
                              future: sntInfo(i, widget.ethClient),
                              builder: (context, secSnapshot) {
                                if (secSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              })
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]
                  ),
                  child: const Text('MnC SECRETARY CANDIDATES')),
            ),
            FutureBuilder<List>(
              future: getMNCNum(widget.ethClient),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data![0].toInt(); i++)
                          FutureBuilder<List>(
                              future: mncInfo(i, widget.ethClient),
                              builder: (context, secSnapshot) {
                                if (secSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              })
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]
                  ),
                  child: const Text('AnC SECRETARY CANDIDATES')),
            ),
            FutureBuilder<List>(
              future: getANCNum(widget.ethClient),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data![0].toInt(); i++)
                          FutureBuilder<List>(
                              future: ancInfo(i, widget.ethClient),
                              builder: (context, secSnapshot) {
                                if (secSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              })
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]
                  ),
                  child: const Text('SENATOR CANDIDATES')),
            ),
            FutureBuilder<List>(
              future: getSenatorNum(widget.ethClient),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data![0].toInt(); i++)
                          FutureBuilder<List>(
                              future: senatorInfo(i, widget.ethClient),
                              builder: (context, senSnapshot) {
                                if (senSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[200]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(senSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              })
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
