import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityRepository {
  Future<bool> isConnected();
}

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;

  ConnectivityRepositoryImpl(this._connectivity);

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
