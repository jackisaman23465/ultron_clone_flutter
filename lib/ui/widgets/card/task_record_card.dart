import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_card.dart';

class TaskRecordCard extends StatelessWidget {
  final bool? enabled;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const TaskRecordCard({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return CustomCard(
      enabled: enabled ?? onTap != null,
      onTap: onTap,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
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
        onTap != null ? Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).colorScheme.secondary,
          size: 24.sp,
        ) : Container(),
      ],
    );
  }
}
