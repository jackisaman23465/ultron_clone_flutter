import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ui_config.dart';
import '../../widgets/common/border_radius_effect.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Alignment textAlign;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? borderRadiusNum;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool showShadow;
  final Color? borderColor;
  final Function()? onTap;
  final bool multiLine;
  final int singleLineStringLength;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.textAlign = Alignment.center,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadiusNum, // default 8
    this.fontSize, // default 18
    this.fontWeight = FontWeight.w700,
    this.fontColor = Colors.white,
    this.verticalPadding, // default 20
    this.horizontalPadding, // default 4
    this.showShadow = false,
    this.borderColor,
    this.onTap,
    this.multiLine = false,
    this.singleLineStringLength = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(0.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 20.sp, horizontal: horizontalPadding ?? 4.sp),
          alignment: textAlign,
          decoration: BorderRadiusEffect(
            borderRadiusNum: borderRadiusNum ?? 8.sp,
            boxColor: backgroundColor ?? Theme.of(context).primaryColor,
            showShadow: showShadow,
            borderColor: borderColor ?? Colors.transparent,
            borderWidth: 2.sp,
          ),
          child: buildMultiLineText(multiLine, text, fontSize ?? 18.sp, fontColor, fontWeight, singleLineStringLength),
        ),
      )
    );
  }
}

Widget buildMultiLineText(bool multiLine, String text, double fontSize, Color fontColor, FontWeight fontWeight, int singleLineStringLength) {
  if (!multiLine) {
    return Text(text,
      style: TextStyle(fontSize: fontSize, color: fontColor, fontWeight: fontWeight)
    );
  } else {
    List<Widget> textWidgets = <Widget>[];
    for (int i = 0; i < text.length; i = i + singleLineStringLength) {
      textWidgets.add(
        Text(text.substring(i, (i+singleLineStringLength > text.length) ? text.length : i+singleLineStringLength),
          style: TextStyle(fontSize: fontSize, color: fontColor, fontWeight: fontWeight)
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textWidgets,
    );
  }
}