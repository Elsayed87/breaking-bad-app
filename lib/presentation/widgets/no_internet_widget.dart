

import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'No Internet connection , pls check Wifi',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/offline.png',
            fit: BoxFit.cover,
          ),
        ],
      )),
    );
  }
}


