import '../../constants/my_color/my_color.dart';
import 'package:flutter/material.dart';


class BuildTextField extends StatelessWidget {
  const BuildTextField({super.key,required this.serachedController,required this.onChanged});
  final TextEditingController serachedController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: serachedController,
      cursorColor: MyColor.greyColor,
      onChanged:onChanged,
      style: TextStyle(color: MyColor.greyColor, fontSize: 18.0),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'find a characters ',
        hintStyle: TextStyle(color: MyColor.greyColor, fontSize: 18.0),
      ),
    );
  }
}
//  (searchedCharacters) {
//         addSearchedItemToSearchedCharacters(searchedCharacters);
//       },