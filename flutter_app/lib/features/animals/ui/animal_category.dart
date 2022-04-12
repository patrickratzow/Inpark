import "package:flutter/widgets.dart";

import "../../../common/colors.dart";

class AnimalCategory extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final double fontSize;

  const AnimalCategory({
    Key? key,
    required this.text,
    required this.padding,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.green.lightest,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          height: (fontSize - 0.5) / fontSize,
          fontSize: fontSize,
          color: CustomColor.green.darkest,
        ),
      ),
    );
  }
}
