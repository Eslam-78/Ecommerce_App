import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

class SearchContainerField extends StatelessWidget {
  const SearchContainerField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),

      width: SizeConfig.screenWidth! * 0.6,

      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Product",
          hintStyle: TextStyle(color: background.withOpacity(0.5)),
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(9),
          ),
        ),
      ),
    );
  }
}
