import 'dart:async';

import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectionIndicator extends StatefulWidget {
  const ConnectionIndicator({super.key});

  @override
  State<ConnectionIndicator> createState() => _ConnectionIndicatorState();
}

class _ConnectionIndicatorState extends State<ConnectionIndicator> {
  bool _shouldShow = false;

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> showWithAutoClose(bool isAutoClose) async {
    setState(() {
      _shouldShow = true;
    });
    if (isAutoClose) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _shouldShow = false;
      });
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (_) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.first == ConnectivityResult.none) {
      showWithAutoClose(false);
    }

    if (result.first != ConnectivityResult.none &&
        result.first != _connectionStatus.first) {
      showWithAutoClose(true);
    }
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Visibility(
      visible: _shouldShow,
      replacement: SizedBox.shrink(),
      child: Container(
        width: double.infinity,
        color: switch (_connectionStatus.first) {
          ConnectivityResult.none => Colors.red,
          _ => Colors.green,
        },
        padding: const EdgeInsets.all(8),
        child: Text(switch (_connectionStatus.first) {
          ConnectivityResult.none => AppLocalizations.of(context)!.connectionOffline,
          _ => AppLocalizations.of(context)!.connectionOnline,
        }),
      ),
    );
  }
}
