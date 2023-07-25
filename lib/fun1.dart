// import 'package:flutter/services.dart';
// import 'package:web3dart/web3dart.dart';
// import 'constants.dart';
//
// ////loading the deployed contract
// Future<DeployedContract> loadContract() async {
//   String abi = await rootBundle.loadString('assets/abi.json');
//   final contract = DeployedContract(ContractAbi.fromJson(abi, 'Election'), EthereumAddress.fromHex(contractAddress));
//   return contract;
// }
//
// ////for calling every function of solidity
// Future<String> callFunction(String funcname, List<dynamic> args, Web3Client ethClient, String privateKey) async {
//   EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
//   DeployedContract contract = await loadContract();
//   final ethFunction = contract.function(funcname);
//   final result = await ethClient.sendTransaction(
//       credentials,
//       Transaction.callContract(
//         contract: contract,
//         function: ethFunction,
//         parameters: args,
//       ),
//       chainId: null,
//       fetchChainIdFromNetworkId: true
//   );
//   return result;
// }
//
// ////starting election by giving it a name
// Future<String> startElection(String name, Web3Client ethClient) async {
//   var response = await callFunction('startElection', [name], ethClient, owner_private_key);
//   print('Election started successfully');
//   return response;
// }
//
// ////registering candidate by giving their name
// Future<String> addCandidate(String name, Web3Client ethClient) async {
//   var response = await callFunction('addCandidate', [name], ethClient, owner_private_key);
//   print('Candidate added successfully');
//   return response;
// }
//
//
// ////authorizing voters by owner and adding them to voterList array
// Future<String> authorizeVoter(String address, Web3Client ethClient) async {
//   var response = await callFunction('authorizeVoter', [EthereumAddress.fromHex(address)], ethClient, owner_private_key);
//   print('Voter Authorized successfully');
//   return response;
// }
//
//
// ////returning number of candidates
// Future<List> getCandidatesNum(Web3Client ethClient) async {
//   List<dynamic> result = await ask('getNumCandidates', [], ethClient);
//   return result;
// }
//
//
// ////returning number of voters
// Future<List> getVotersNum(Web3Client ethClient) async {
//   List<dynamic> result = await ask('getNumVoters', [], ethClient);
//   return result;
// }
//
// ////returning total number of voters casted vote
// Future<List> getTotalVotes(Web3Client ethClient) async {
//   List<dynamic> result = await ask('getTotalVotes', [], ethClient);
//   return result;
// }
//
// ////returning candidates struct data, his name and points
// Future<List> candidateInfo(int index, Web3Client ethClient) async {
//   List<dynamic> result = await ask('candidateInfo', [BigInt.from(index)], ethClient);
//   return result;
// }
//
// ////returning registered voters address
// Future<List> voterInfo(int index, Web3Client ethClient) async {
//   List<dynamic> result = await ask('voterInfo', [BigInt.from(index)], ethClient);
//   return result;
// }
//
// Future<bool> isVoterPresent(String address, Web3Client ethClient) async {
//   DeployedContract contract = await loadContract();
//   final function = contract.function('isVoterPresent');
//   final result = await ethClient.call(contract: contract, function: function, params: [EthereumAddress.fromHex(address)]);
//   return result.first as bool;
// }
//
//
// Future<String> vote(int candidateIndex, Web3Client ethClient) async {
//   var response = await callFunction("vote", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
//   print("Vote counted successfully");
//   return response;
// }
//
// Future<List<dynamic>> ask(String funcName, List<dynamic> args, Web3Client ethClient) async {
//   final contract = await loadContract();
//   final ethFunction = contract.function(funcName);
//   final result = ethClient.call(contract: contract, function: ethFunction, params: args);
//   return result;
// }
//
//
//
//
//
