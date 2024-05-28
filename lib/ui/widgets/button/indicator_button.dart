import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color indicatorColor;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onTap;

  const IndicatorButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.indicatorColor,
    required this.iconColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4.sp,
              color: indicatorColor,
            ),
            SizedBox(width: 12.sp),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                  SizedBox(width: 12.sp),
                  Text(
                    label,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
