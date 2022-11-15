import '../../constants/my_color/my_color.dart';
import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key,required this.endIndent});
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColor.yellowColor,
      thickness: 3,
      height: 30,
      endIndent: endIndent,
    );
  }
}
