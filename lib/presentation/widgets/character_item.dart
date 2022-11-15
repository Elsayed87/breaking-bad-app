import '../../constants/my_color/my_color.dart';
import '../../data/models/charcters_model.dart';
import 'package:flutter/material.dart';

import '../../constants/string/string_const.dart';

class CharacterItem extends StatelessWidget {
  final CharactersModel charactersModel;
  const CharacterItem({super.key, required this.charactersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.all(4.0),
        decoration: BoxDecoration(
          color: MyColor.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, charctersDetailsScreen,
                arguments: charactersModel);
          },
          child: GridTile(
            footer: Hero(
              tag: charactersModel.char_id,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "${charactersModel.name}",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      color: MyColor.whiteColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Container(
              color: MyColor.greyColor,
              child: charactersModel.img.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset("assets/images/sayed.png"),
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: charactersModel.img,
                      fit: BoxFit.cover,
                    )
                  : Image.asset("assets/images/sayed.png"),
            ),
          ),
        ));
  }
}
