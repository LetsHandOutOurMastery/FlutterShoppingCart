import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../config/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        cursorColor: kPrimaryColor,
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18),
                vertical: getProportionateScreenWidth(12)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            hintStyle:TextStyle(color: kPrimaryColor),
            prefixIcon: Icon(Icons.search,
              color: kPrimaryColor,
            ),
        ),
      ),
    );
  }
}
