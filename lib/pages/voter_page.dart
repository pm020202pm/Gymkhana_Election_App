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
            const SizedBox(height: 80,),
            Text('ELECTION', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[800], fontSize: 30),),
            const SizedBox(height: 15,),
            const Divider(thickness: 2,),
            FutureBuilder<List>(
                future: getPresidentNum(widget.ethClient),
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
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL PRESIDENT : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL GNS : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL SNT : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL MNC : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL ANC : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            FutureBuilder<List>(
                future: getSenatorNum(widget.ethClient),
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
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL SENATORS: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
                            Text(snapshot.data![0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple[400]),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
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
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL VOTES CASTED : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green[400]),),
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
            const Text('PRESIDENT CANDIDATES'),
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
            const SizedBox(height: 5,),
            const Text('GNS SECRETARY CANDIDATES'),
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
            const SizedBox(height: 5,),
            const Text('SNT SECRETARY CANDIDATES'),
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
            const SizedBox(height: 5,),
            const Text('MNC SECRETARY CANDIDATES'),
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
            const SizedBox(height: 5,),
            const Text('ANC SECRETARY CANDIDATES'),
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
            const SizedBox(height: 5,),
            const Text('SENATOR CANDIDATES'),
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
