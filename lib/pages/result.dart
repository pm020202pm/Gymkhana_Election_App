import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import '../constants.dart';
import '../functions.dart';
class Result extends StatefulWidget {
  const Result({Key? key, required this.ethClient}) : super(key: key);
  final Web3Client ethClient;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late bool isEnded=false;

  Future<void> isElectionEnded(Web3Client ethClient) async {
    DeployedContract contract = await loadContract();
    final function = contract.function('isElectionEnded');
    final result = await ethClient.call(contract: contract, function: function, params: []);
    setState(() {
      isEnded =result.first as bool;
    });
  }


  @override
  void initState() {
    isElectionEnded(widget.ethClient);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]
                    ),
                    child: FutureBuilder<List>(
                      future: getPresIndex(widget.ethClient),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('PRESIDENT ELECTION IS STILL LIVE', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                Text('COME BACK LATER'),
                              ],
                            ),
                          );
                        }
                        else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]
                                  ),
                                  child: const Text('President'),
                                ),

                                FutureBuilder<List>(
                                      future: presidentInfo(snapshot.data![0].toInt(), widget.ethClient),
                                      builder: (context, candidatesnapshot) {
                                        if (candidatesnapshot.connectionState == ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // const Text('Congratulations !', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                                              const SizedBox(height: 10,),
                                              Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                              Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
                                            ],
                                          );
                                        }
                                      }),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: FutureBuilder<List>(
                      future: getGNSIndex(widget.ethClient),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ELECTION IS STILL LIVE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                Text('COME BACK LATER'),
                              ],
                            ),
                          );
                        }
                        else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]
                                  ),
                                  child: const Text('GNS General Secretary'),
                                ),
                                FutureBuilder<List>(
                                    future: gnsInfo(snapshot.data![0].toInt(), widget.ethClient),
                                    builder: (context, candidatesnapshot) {
                                      if (candidatesnapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // const Text('Congratulations !', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                                            const SizedBox(height: 10,),
                                            Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                            // const SizedBox(height: 10,),
                                            Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
                                          ],
                                        );
                                      }
                                    }),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: FutureBuilder<List>(
                      future: getSNTIndex(widget.ethClient),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ELECTION IS STILL LIVE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                Text('COME BACK LATER'),
                              ],
                            ),
                          );
                        }
                        else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]
                                  ),
                                  child: const Text('SNT General Secretary'),
                                ),
                                FutureBuilder<List>(
                                    future: sntInfo(snapshot.data![0].toInt(), widget.ethClient),
                                    builder: (context, candidatesnapshot) {
                                      if (candidatesnapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // const Text('Congratulations !', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                                            const SizedBox(height: 10,),
                                            Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                            // const SizedBox(height: 10,),
                                            Text('You got '+candidatesnapshot.data![0][1].toString()+' points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
                                          ],
                                        );
                                      }
                                    }),

                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: FutureBuilder<List>(
                      future: getMNCIndex(widget.ethClient),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ELECTION IS STILL LIVE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                Text('COME BACK LATER'),
                              ],
                            ),
                          );
                        }
                        else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]
                                ),
                                child: const Text('MNC General Secretary'),
                              ),
                              FutureBuilder<List>(
                                  future: mncInfo(snapshot.data![0].toInt(), widget.ethClient),
                                  builder: (context, candidatesnapshot) {
                                    if (candidatesnapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // const Text('Congratulations !', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 10,),
                                          Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                          // const SizedBox(height: 10,),
                                          Text('You got '+candidatesnapshot.data![0][1].toString()+' points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
                                        ],
                                      );
                                    }
                                  }),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: FutureBuilder<List>(
                      future: getANCIndex(widget.ethClient),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ELECTION IS STILL LIVE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                Text('COME BACK LATER'),
                              ],
                            ),
                          );
                        }
                        else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]
                                ),
                                child: const Text('ANC General Secretary'),
                              ),
                              FutureBuilder<List>(
                                  future: ancInfo(snapshot.data![0].toInt(), widget.ethClient),
                                  builder: (context, candidatesnapshot) {
                                    if (candidatesnapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // const Text('Congratulations !', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 10,),
                                          Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                          // const SizedBox(height: 10,),
                                          Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
                                        ],
                                      );
                                    }
                                  }),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: FutureBuilder<List>(
                      future: getSenIndex(widget.ethClient),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ELECTION IS STILL LIVE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                Text('COME BACK LATER'),
                              ],
                            ),
                          );
                        }
                        else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]
                                  ),
                                  child: const Text('Senator winner'),
                                ),
                                FutureBuilder<List>(
                                    future: senatorInfo(snapshot.data![0].toInt(), widget.ethClient),
                                    builder: (context, candidatesnapshot) {
                                      if (candidatesnapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // const Text('Congratulations !', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                                            const SizedBox(height: 10,),
                                            Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                            // const SizedBox(height: 10,),
                                            Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
                                          ],
                                        );
                                      }
                                    }),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
