import 'dart:async';
import 'package:connectivity/connectivity.dart';

class CheckInternet {
  StreamController<ConnectivityResult> connectivityResult =
      StreamController<ConnectivityResult>();

  CheckInternet() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult.add(result);
      print("connectivityResult: " + result.toString());
    });
  }
}
