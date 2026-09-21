import 'dart:async';

import 'package:animal_app/features/connectivity/service/internet_reachability_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityController extends ChangeNotifier {
  ConnectivityController({
    Connectivity? connectivity,
    InternetReachabilityChecker? reachabilityChecker,
  })  : _connectivity = connectivity ?? Connectivity(),
        _reachabilityChecker =
            reachabilityChecker ?? const InternetReachabilityChecker() {
    _init();
  }

  final Connectivity _connectivity;
  final InternetReachabilityChecker _reachabilityChecker;

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _reachabilityTimer;
  int _checkId = 0;
  bool _isConnected = true;
  bool _hasNetworkInterface = true;

  static const Duration _reachabilityInterval = Duration(seconds: 5);

  bool get isConnected => _isConnected;

  Future<void> _init() async {
    final results = await _connectivity.checkConnectivity();
    await _onConnectivityChanged(results);
    _subscription = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
    );
  }

  Future<void> _onConnectivityChanged(List<ConnectivityResult> results) async {
    _hasNetworkInterface = results.any(
      (result) => result != ConnectivityResult.none,
    );
    _syncReachabilityTimer();
    await _recheckInternetAccess();
  }

  void _syncReachabilityTimer() {
    _reachabilityTimer?.cancel();
    _reachabilityTimer = null;
    if (!_hasNetworkInterface) {
      return;
    }
    _reachabilityTimer = Timer.periodic(
      _reachabilityInterval,
      (_) => _recheckInternetAccess(),
    );
  }

  Future<void> _recheckInternetAccess() async {
    final checkId = ++_checkId;

    if (!_hasNetworkInterface) {
      _setConnected(false);
      return;
    }

    final hasInternet = await _reachabilityChecker.hasInternetAccess();
    if (checkId != _checkId) {
      return;
    }
    _setConnected(hasInternet);
  }

  void _setConnected(bool connected) {
    if (_isConnected == connected) {
      return;
    }
    _isConnected = connected;
    notifyListeners();
  }

  @override
  void dispose() {
    _checkId++;
    _subscription?.cancel();
    _reachabilityTimer?.cancel();
    super.dispose();
  }
}
