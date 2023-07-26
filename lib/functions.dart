import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'constants.dart';

////loading the deployed contract
Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'Election'), EthereumAddress.fromHex(contractAddress));
  return contract;
}

////for calling every function of solidity
Future<String> callFunction(String funcname, List<dynamic> args, Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
      chainId: null,
      fetchChainIdFromNetworkId: true
  );
  return result;
}

////starting election by giving it a name & minnutes
Future<String> startElection(String name, int minutes, Web3Client ethClient) async {
  var response = await callFunction('startElection', [name, BigInt.from(minutes)], ethClient, owner_private_key);
  print('Election started successfully');
  return response;
}

Future<String> addPresident(String name, Web3Client ethClient) async {
  var response = await callFunction('addPresident', [name], ethClient, owner_private_key);
  print('President candidate added successfully');
  return response;
}
Future<String> addGNS(String name, Web3Client ethClient) async {
  var response = await callFunction('addGNS', [name], ethClient, owner_private_key);
  print('GnS candidate added successfully');
  return response;
}
Future<String> addSNT(String name, Web3Client ethClient) async {
  var response = await callFunction('addSNT', [name], ethClient, owner_private_key);
  print('SnT candidate added successfully');
  return response;
}
Future<String> addMNC(String name, Web3Client ethClient) async {
  var response = await callFunction('addMNC', [name], ethClient, owner_private_key);
  print('MnC candidate added successfully');
  return response;
}
Future<String> addANC(String name, Web3Client ethClient) async {
  var response = await callFunction('addANC', [name], ethClient, owner_private_key);
  print('AnC candidate added successfully');
  return response;
}
Future<String> addSenator(String name, Web3Client ethClient) async {
  var response = await callFunction('addSenator', [name], ethClient, owner_private_key);
  print('Seantor candidate added successfully');
  return response;
}


////authorizing voters by owner and adding them to voterList array
Future<String> authorizeVoter(String address, Web3Client ethClient) async {
  var response = await callFunction('authorizeVoter', [EthereumAddress.fromHex(address)], ethClient, owner_private_key);
  print('Voter Authorized successfully');
  return response;
}


//returning number of candidates
Future<List> getCandidatesNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumCandidates', [], ethClient);
  return result;
}
Future<List> getPresidentNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumPresident', [], ethClient);
  return result;
}
// Future<List> getSecretaryNum(Web3Client ethClient) async {
//   List<dynamic> result = await ask('getNumSecretary', [], ethClient);
//   return result;
// }
Future<List> getGNSNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumGNS', [], ethClient);
  return result;
}
Future<List> getSNTNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumSNT', [], ethClient);
  return result;
}
Future<List> getMNCNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumMNC', [], ethClient);
  return result;
}
Future<List> getANCNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumANC', [], ethClient);
  return result;
}
Future<List> getSenatorNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumSenators', [], ethClient);
  return result;
}
Future<List> getVotersNum(Web3Client ethClient) async {
  List<dynamic> result = await ask('getNumVoters', [], ethClient);
  return result;
}


Future<List> candidateInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('candidateInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> presidentInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('presidentInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> secretaryInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('secretaryInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> gnsInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('gnsInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> sntInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('sntInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> mncInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('mncInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> ancInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('ancInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> senatorInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('senatorInfo', [BigInt.from(index)], ethClient);
  return result;
}

Future<List> voterInfo(int index, Web3Client ethClient) async {
  List<dynamic> result = await ask('voterInfo', [BigInt.from(index)], ethClient);
  return result;
}
Future<List> getTotalVotes(Web3Client ethClient) async {
  List<dynamic> result = await ask('getTotalVotes', [], ethClient);
  return result;
}


Future<String> vote(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("vote", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("Vote counted successfully");
  return response;
}
Future<String> votePres(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("votePresident", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("President voted successfully");
  return response;
}
Future<String> voteSec(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("voteSecretary", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("Secretary voted successfully");
  return response;
}
Future<String> voteGNS(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("voteGNS", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("GnS voted successfully");
  return response;
}
Future<String> voteSNT(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("voteSNT", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("SnT voted successfully");
  return response;
}
Future<String> voteMNC(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("voteMNC", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("MnC voted successfully");
  return response;
}
Future<String> voteANC(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("voteANC", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("AnC voted successfully");
  return response;
}
Future<String> voteSen(int candidateIndex, Web3Client ethClient) async {
  var response = await callFunction("voteSenator", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
  print("Senator voted successfully");
  return response;
}


Future<List> getWinnerIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winner', [], ethClient);
  return result;
}
Future<List> getPresIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerPres', [], ethClient);
  return result;
}
Future<List> getSecIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerSec', [], ethClient);
  return result;
}
Future<List> getGNSIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerGNS', [], ethClient);
  return result;
}
Future<List> getSNTIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerSNT', [], ethClient);
  return result;
}
Future<List> getMNCIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerMNC', [], ethClient);
  return result;
}
Future<List> getANCIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerANC', [], ethClient);
  return result;
}
Future<List> getSenIndex(Web3Client ethClient) async {
  List<dynamic> result = await ask('winnerSen', [], ethClient);
  return result;
}


Future<bool> isVoterPresent(String address, Web3Client ethClient) async {
  DeployedContract contract = await loadContract();
  final function = contract.function('isVoterPresent');
  final result = await ethClient.call(contract: contract, function: function, params: [EthereumAddress.fromHex(address)]);
  return result.first as bool;
}

Future<bool> isElectionEnded(String address, Web3Client ethClient) async {
  DeployedContract contract = await loadContract();
  final function = contract.function('isElectionEnded');
  final result = await ethClient.call(contract: contract, function: function, params: []);
  return result.first as bool;
}

Future<List<dynamic>> ask(String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}



