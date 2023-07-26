import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import '../functions.dart';
import '../widgets/button.dart';
class ElectionInfo extends StatefulWidget {
  final Web3Client ethClient;
  const ElectionInfo(
      {Key? key, required this.ethClient})
      : super(key: key);

  @override
  _ElectionInfoState createState() => _ElectionInfoState();
}

class _ElectionInfoState extends State<ElectionInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70,),
            Text('ELECTION', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[800], fontSize: 30),),
            const SizedBox(height: 15,),
            const Divider(thickness: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.blue[100]
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<List>(
                              future: getPresidentNum(widget.ethClient),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('PRESIDENT : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                                        Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          FutureBuilder<List>(
                              future: getGNSNum(widget.ethClient),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('GnS : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                                        Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          FutureBuilder<List>(
                              future: getSNTNum(widget.ethClient),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('SnT : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                                        Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<List>(
                              future: getSenatorNum(widget.ethClient),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('SENATORS: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                                        Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          FutureBuilder<List>(
                              future: getMNCNum(widget.ethClient),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('MnC : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                                        Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          FutureBuilder<List>(
                              future: getANCNum(widget.ethClient),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('AnC : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                                        Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder<List>(
                future: getTotalVotes(widget.ethClient),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink[50]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL VOTES CASTED  : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 5,),
            const Divider(thickness: 2,),
            const SizedBox(height: 10,),
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
                                      height: 60,
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
                                            Text(presiSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                            Button(buttonText: 'VOTE',fontWeight: FontWeight.w700, textColor: Colors.green[600], buttonBgColor: Colors.green[100], splashColor: Colors.green[400], onPressed: () { votePres(i, widget.ethClient); }, height: 50, width: 60, borderRadius: 12,),
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
                                      height: 60,
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
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                            Button(buttonText: 'VOTE',fontWeight: FontWeight.w700, textColor: Colors.green[600], buttonBgColor: Colors.green[100], splashColor: Colors.green[400], onPressed: () { voteGNS(i, widget.ethClient); }, height: 50, width: 60, borderRadius: 12,),
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
                                      height: 60,
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
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                            Button(buttonText: 'VOTE',fontWeight: FontWeight.w700, textColor: Colors.green[600], buttonBgColor: Colors.green[100], splashColor: Colors.green[400], onPressed: () { voteSNT(i, widget.ethClient); }, height: 50, width: 60, borderRadius: 12,),
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
                                      height: 60,
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
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                            Button(buttonText: 'VOTE',fontWeight: FontWeight.w700, textColor: Colors.green[600], buttonBgColor: Colors.green[100], splashColor: Colors.green[400], onPressed: () { voteMNC(i, widget.ethClient); }, height: 50, width: 60, borderRadius: 12,),
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
                                      height: 60,
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
                                            Text(secSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                            Button(buttonText: 'VOTE',fontWeight: FontWeight.w700, textColor: Colors.green[600], buttonBgColor: Colors.green[100], splashColor: Colors.green[400], onPressed: () { voteANC(i, widget.ethClient); }, height: 50, width: 60, borderRadius: 12,),
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
                                      height: 60,
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
                                            Text(senSnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue[400]),),
                                            Button(buttonText: 'VOTE',fontWeight: FontWeight.w700, textColor: Colors.green[600], buttonBgColor: Colors.green[100], splashColor: Colors.green[400], onPressed: () { voteSen(i, widget.ethClient); }, height: 50, width: 60, borderRadius: 12,),
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
