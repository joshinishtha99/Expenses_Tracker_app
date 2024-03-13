import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

class Authetication {
  static LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async{
      print(await _auth.canCheckBiometrics);
      print(await _auth.isDeviceSupported());
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  static Future<bool> authetication() async {
    try {
      if (!await canAuthenticate()) return false;
      return await _auth.authenticate(localizedReason: "get into the app");
    } catch (e) {
      print('error $e');
      return false;
    }
  }
}
