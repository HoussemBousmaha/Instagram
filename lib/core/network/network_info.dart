import 'dart:io';

import 'package:flutter/material.dart';

@immutable
abstract class NetworkInfo {
  Future<bool> get isConnected;

  const NetworkInfo();
}

@immutable
class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('example.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;

      return false;
    } on SocketException {
      return false;
    }
  }
}
