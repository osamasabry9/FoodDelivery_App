// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;
  int? maxline;
  SmallText({
    Key? key,
    this.size = 12,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
    this.maxline,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'Roboto',
        height: height,
      ),
      maxLines: maxline,
    );
  }
}
