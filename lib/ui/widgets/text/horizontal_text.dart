import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';

class HorizontalText extends StatelessWidget {
  final String title;
  final String content;

  const HorizontalText({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 16.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: UIColors.normalTextColor),
            ),
          ),
          SizedBox(width: 16.sp),
          Expanded(
            flex: 6,
            child: Text(
              content,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: UIColors.normalTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
