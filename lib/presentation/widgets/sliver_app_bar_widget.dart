import '../../constants/my_color/my_color.dart';
import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key, required this.nickname, required this.imageUrl, required this.charId});
  final String nickname;
  final String imageUrl;
  final Object charId;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.greyColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //charactersModel.nickname
        title: Text(
          nickname,
          style:
              TextStyle(color: MyColor.whiteColor, fontWeight: FontWeight.bold),
        ),
        background: Hero(
          //charactersModel.char_id,
            tag: charId,
            //charactersModel.img
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/images/sayed.png'),
            )),
      ),
    );
  }
}




  // Widget buildSliverAppBar() {
  //   return SliverAppBar(
  //     expandedHeight: 600,
  //     pinned: true,
  //     stretch: true,
  //     backgroundColor: MyColor.greyColor,
  //     flexibleSpace: FlexibleSpaceBar(
  //       centerTitle: true,
  //       title: Text(
  //         charactersModel.nickname,
  //         style:
  //             TextStyle(color: MyColor.whiteColor, fontWeight: FontWeight.bold),
  //       ),
  //       background: Hero(
  //           tag: charactersModel.char_id,
  //           child: Image.network(
  //             charactersModel.img,
  //             fit: BoxFit.cover,
  //             errorBuilder: (context, error, stackTrace) =>
  //                 Image.asset('assets/images/sayed.png'),
  //           )),
  //     ),
  //   );
  // }