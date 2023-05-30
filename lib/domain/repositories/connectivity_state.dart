import 'package:flutter/foundation.dart';

class ConnectivityState extends ChangeNotifier {
  bool isConnected = false; // Initially assuming device is disconnected

  void updateConnectivityStatus(bool status) {
    isConnected = status;
    notifyListeners();
  }
}
