import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import "package:flutter/widgets.dart";
import 'package:flutterdapp/Encrypt-Decrypt.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class childModel extends ChangeNotifier {
  // handles data
  // has notifyListeners()
  bool isLoading = true; // location data is loading

  late Client _httpClient;
  late String _contractAddress;
  late String _abi;
  late Web3Client _client;
  late EthPrivateKey _credentials;
  late DeployedContract _contract;
  late String x;
  late String y;
  late String latitude;
  late String longitude;
  late ContractFunction _readCoordinates;
  late ContractFunction _sendCoordinates;

  childModel() {
    // constructor
    initiateSetup();
  }

  Future<void> initiateSetup() async {
    // runs asynchronously and so does not block other operations
    _httpClient = Client();
    // using Alchemy API key for this app
    String alchemyURL =
        "https://eth-goerli.g.alchemy.com/v2/Rc-rs7Xsdcyt0i404b5HDMl2qbEzYddo";
    _client = Web3Client(alchemyURL, _httpClient);

    // smart contract must be deployed first
    // functions that access smart contract details
    await getContractABI();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getContractABI() async {
    // employer should provide the contract address
    _abi = await rootBundle.loadString("../assets/abi.json");
    _contractAddress = "0x4943030bce7e49dd13b4dd120c0fef7dde3c18a0";
  }

  Future<void> getCredentials() async {
    // employee private address to sign transactions
    // Use metamask here
    _credentials = EthPrivateKey.fromHex(
        "d585835f87981557df21fbaf99df4c9d06fd374b6efd121c027e0655cee5b627");
  }

  Future<void> getDeployedContract() async {
    // using ABI to fetch contract in network
    _contract = DeployedContract(ContractAbi.fromJson(_abi, "Project"),
        EthereumAddress.fromHex(_contractAddress));
    _readCoordinates = _contract.function("readCoordinates");
    _sendCoordinates = _contract.function("sendCoordinates");
  }

  getCoordinates() async {
    List readCoordinates = await _client
        .call(contract: _contract, function: _readCoordinates, params: []);
    // longitide and latitude saved in a list
    x = readCoordinates[0];
    y = readCoordinates[1];
  }

  addCoordinates(String lat, String lon) async {
    // notifyListeners() -> called whenever there is a change in the data.
    // alerts listeners in main.dart that the object has changed

    // This call will tell the widgets that are listening to this model to rebuild.

    // encrypting location for transmission
    latitude = EncryptionDecryption.encryptAES(lat);
    longitude = EncryptionDecryption.encryptAES(lon);

    // transaction : send coordinates to smart contract to determine compliance
    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _contract,
        function: _sendCoordinates,
        parameters: [latitude, longitude],
        maxGas: 100000,
      ),
      chainId: 4,
    );
    print("Encrypted Data:");
    print(latitude);
    print(longitude);
    print("Sent Encrypted Data");
    getCoordinates();
    isLoading = false;
    notifyListeners();
  }
}
