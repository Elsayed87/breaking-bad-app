import '../../constants/my_color/my_color.dart';
import 'package:flutter/material.dart';

class CharInfoWidget extends StatelessWidget {
  const CharInfoWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: MyColor.whiteColor),
        ),
        TextSpan(
          text: value,
          style: TextStyle(fontSize: 16.0, color: MyColor.whiteColor),
        ),
      ]),
    );
  }
}
