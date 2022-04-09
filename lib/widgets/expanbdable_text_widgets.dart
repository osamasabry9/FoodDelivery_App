import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpanbdableTextWidgets extends StatefulWidget {
  final String text;
  const ExpanbdableTextWidgets({Key? key, required this.text})
      : super(key: key);

  @override
  State<ExpanbdableTextWidgets> createState() => _ExaState();
}

class _ExaState extends State<ExpanbdableTextWidgets> {
  late String firstHalf;
  late String secondtHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondtHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondtHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondtHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              size: Dimensions.font16,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                  text: hiddenText
                      ? (firstHalf + '...')
                      : (firstHalf + secondtHalf),
                  size: Dimensions.font16,
                  color: AppColors.paraColor,
                  height: 1.8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? 'Show more' : 'Show less',
                        color: AppColors.mainColor,
                        size: Dimensions.font16,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
