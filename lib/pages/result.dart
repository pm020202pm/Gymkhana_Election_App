import 'package:flutter/material.dart';
import 'package:gymkhana/widgets/button.dart';
import 'package:web3dart/web3dart.dart';
import '../constants.dart';
import '../functions.dart';
import '../widgets/gradient_text.dart';
class Result extends StatefulWidget {
  const Result({Key? key, required this.ethClient}) : super(key: key);
  final Web3Client ethClient;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late bool isEnded=false;
  List<List<dynamic>> senatorArray = [];
  bool isArrayLoaded = false;

  Future<void> isElectionEnded(Web3Client ethClient) async {
    DeployedContract contract = await loadContract();
    final function = contract.function('isElectionEnded');
    final result = await ethClient.call(contract: contract, function: function, params: []);
    setState(() {
      isEnded =result.first as bool;
    });
  }

  Future<void> senatorSort(Web3Client ethClient) async {
    var num = await getSenatorNum(ethClient!);
    for (int i = 0; i<num[0].toInt(); i++ ){
      var result = await senatorInfo(i, ethClient!);
      senatorArray.add(result[0]);
    }
    senatorArray.sort((a,b) => (b[1].toInt()).compareTo(a[1].toInt()));
    senatorArray.forEach((element) {print(element);});
    setState(() {
      isArrayLoaded = true;
    });
  }


  @override
  void initState() {
    isElectionEnded(widget.ethClient);
    senatorSort(widget.ethClient);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<List>(
          future: getPresIndex(widget.ethClient),
    builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            isEnded == false) {
          return Center(
              child: Column(
                children: [
                  Text('ELECTION IS STILL LIVE', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.grey[500]),),
                  const SizedBox(height: 20,),
                  Text('Come Back Later', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.grey[500]),),
                ],
              ));
        }
        else {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 65, 10, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GradientText(
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  text: 'Congratulations Winners!',
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),),
                const SizedBox(height: 10,),
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
                              child: CircularProgressIndicator()
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
                                            const SizedBox(height: 10,),
                                            Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                            Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
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
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: 180,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]
                            ),
                            child: const Text('General Secretaries'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 145,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300]
                                ),
                                child: FutureBuilder<List>(
                                  future: getGNSIndex(widget.ethClient),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    else {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.infinity,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey[400]
                                              ),
                                              child: const Text('GnS'),
                                            ),
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
                                                      const SizedBox(height: 10,),
                                                      Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                                      const SizedBox(height: 5,),
                                                      Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
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
                                width: 145,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300]
                                ),
                                child: FutureBuilder<List>(
                                  future: getSNTIndex(widget.ethClient),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    else {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.infinity,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey[400]
                                              ),
                                              child: const Text('SnT'),
                                            ),
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
                                                      const SizedBox(height: 10,),
                                                      Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                                      const SizedBox(height: 5,),
                                                      Text('You got '+candidatesnapshot.data![0][1].toString()+' points', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
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
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 145,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300]
                                ),
                                child: FutureBuilder<List>(
                                  future: getMNCIndex(widget.ethClient),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    else {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.infinity,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey[400]
                                              ),
                                              child: const Text('MnC'),
                                            ),
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
                                                      const SizedBox(height: 10,),
                                                      Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                                      SizedBox(height: 5,),
                                                      Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
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
                                width: 145,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300]
                                ),
                                child: FutureBuilder<List>(
                                  future: getANCIndex(widget.ethClient),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting || isEnded==false) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    else {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: double.infinity,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey[400]
                                              ),
                                              child: const Text('AnC'),
                                            ),
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
                                                      const SizedBox(height: 10,),
                                                      Text(candidatesnapshot.data![0][0].toString().toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey[700]),),
                                                      const SizedBox(height: 5,),
                                                      Text('You got ${candidatesnapshot.data![0][1]} points', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey[600]),),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child:
                      (isArrayLoaded==true)
                          ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300]
                              ),
                              child: const Text('Senators'),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: senatorArray.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: Colors.grey[400]
                                                ),
                                                child: Text((index+1).toString()),
                                              ),
                                              const SizedBox(width: 8,),
                                              Text(senatorArray[index][0].toString().toUpperCase(),style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey[600], fontSize: 17),),
                                            ],
                                          ),
                                          Text("${senatorArray[index][1]} Points", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[600]),),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                          : const Center(child: CircularProgressIndicator())
                  ),
                ),
              ],
            ),
          );
        }
    }),
    ),
      )
    );
}
}
