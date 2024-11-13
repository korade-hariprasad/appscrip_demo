import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkUtil {
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static void checkConnectionAndProceed(BuildContext context, Function proceed) {
    checkInternetConnection().then((connected) {
      if (connected) {
        proceed();
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('No Internet Connection'),
            content: const Text('Please connect to the internet and try again.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  checkConnectionAndProceed(context, proceed);
                },
              ),
            ],
          ),
        );
      }
    });
  }
}