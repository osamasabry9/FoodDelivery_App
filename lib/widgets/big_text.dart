// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({
    Key? key,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
    this.color = const Color(0xFF332d2b),
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style: TextStyle(
        fontSize: size ==0 ? Dimensions.height20 : size,
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
