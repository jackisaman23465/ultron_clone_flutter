import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';

class VerticalText extends StatelessWidget {
  final String title;
  final String content;
  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;

  const VerticalText({
    Key? key,
    required this.title,
    required this.content,
    this.titleTextStyle,
    this.contentTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle ?? TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: UIColors.placeholderTextColor),
        ),
        Text(
          content,
          style: contentTextStyle ?? TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: UIColors.normalTextColor),
        ),
      ],
    );
  }
}
