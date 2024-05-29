import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/card/custom_card.dart';
import '../button/button_handler.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final VoidCallback onCancel;
  final int? longPressDuration;

  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.onCancel,
    this.subtitle,
    this.onLongPress,
    this.longPressDuration,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCard();
}

class _TaskCard extends State<TaskCard> with ButtonHandler {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      itemPadding: EdgeInsets.all(14.sp),
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      longPressDuration: widget.longPressDuration,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 4.sp),
                Visibility(
                  visible: widget.subtitle != null && widget.subtitle != "",
                  child: Text(
                    widget.subtitle ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Visibility(
                  visible: widget.description != null && widget.description != "",
                  child: Text(
                    widget.description ?? "",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 24.sp,
                  width: 24.sp,
                  child: IconButton(
                    iconSize: 20.sp,
                    splashRadius: 24.sp,
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).hintColor,
                    ),
                    onPressed: () => handleButtonClick(
                      "onPressed",
                          () async => widget.onCancel(),
                    ),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
