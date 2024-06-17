import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ui_config.dart';
import '../../widgets/card/custom_card.dart';
import '../button/button_handler.dart';

class TaskCard extends CustomCard {
  final String title;
  final String? subtitle;
  final String? description;

  TaskCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    super.onTap,
    super.onLongPress,
  }) : super(
          child: _TaskCardChild(
            title: title,
            subtitle: subtitle,
            description: description,
          ),
        );
}

class _TaskCardChild extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? description;

  const _TaskCardChild({
    required this.title,
    this.subtitle,
    this.description,
  });

  @override
  State createState() => _TaskCardChildState();
}

class _TaskCardChildState extends State<_TaskCardChild> with ButtonHandler {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
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
                () {},
              ),
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
