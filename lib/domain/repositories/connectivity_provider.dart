import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:contact_management/domain/repositories/connectivity_repository.dart';
import 'package:contact_management/domain/repositories/connectivity_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = ChangeNotifierProvider<ConnectivityState>((ref) {
  final connectivityState = ConnectivityState();
  final connectivityRepository = ConnectivityRepositoryImpl(Connectivity());

  ref.onDispose(() {
    // Dispose any resources if necessary
  });

  _checkConnectivity(
      ref as WidgetRef, connectivityState, connectivityRepository);

  return connectivityState;
});

Future<void> _checkConnectivity(
  WidgetRef ref,
  ConnectivityState connectivityState,
  ConnectivityRepository connectivityRepository,
) async {
  final isConnected = await connectivityRepository.isConnected();
  connectivityState.isConnected = isConnected;
  ref.refresh(connectivityProvider);
}
