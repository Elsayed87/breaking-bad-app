import '../../constants/my_color/my_color.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'characters',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: MyColor.greyColor,
        fontSize: 18.0,
      ),
    );
  }
}
