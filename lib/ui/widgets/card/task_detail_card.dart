import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/card/custom_card.dart';

class TaskDetailCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String statusTitle;
  final Color statusIconColor;
  final VoidCallback? onTap;

  const TaskDetailCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onTap,
    required this.statusTitle,
    required this.statusIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      enabled: onTap != null,
      onTap: onTap,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Visibility(
              visible: subtitle != null,
              child: Text(
                subtitle ?? "",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: statusIconColor,
              size: 30.sp,
            ),
            SizedBox(height: 4.sp),
            Text(
              statusTitle,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
