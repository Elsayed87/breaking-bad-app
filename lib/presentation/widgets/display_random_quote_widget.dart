import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../constants/my_color/my_color.dart';
import 'package:flutter/material.dart';


class DisplayRandomQuotesOrEmptySpace extends StatelessWidget {
  const DisplayRandomQuotesOrEmptySpace({super.key,required this.state});

  final  state;

  @override
  Widget build(BuildContext context) {
     var quotes = (state).quotes;
    if (quotes.length != 0) {
      var randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: MyColor.whiteColor,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: MyColor.yellowColor,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}






  // Widget displayRandomQuoteOrEmptySpace(state) {
  //   var quotes = (state).quotes;
  //   if (quotes.length != 0) {
  //     var randomQuoteIndex = Random().nextInt(quotes.length - 1);
  //     return Center(
  //       child: DefaultTextStyle(
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontSize: 20,
  //           color: MyColor.whiteColor,
  //           shadows: [
  //             Shadow(
  //               blurRadius: 7.0,
  //               color: MyColor.yellowColor,
  //               offset: const Offset(0, 0),
  //             ),
  //           ],
  //         ),
  //         child: AnimatedTextKit(
  //           repeatForever: true,
  //           animatedTexts: [
  //             FlickerAnimatedText(quotes[randomQuoteIndex].quote),
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }