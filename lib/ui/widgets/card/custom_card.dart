import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/button_handler.dart';

class CustomCard extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final Widget child;
  final EdgeInsetsGeometry? itemPadding;
  final int? longPressDuration;
  final double? elevation;
  final Color? color;

  const CustomCard({
    Key? key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.itemPadding,
    this.enabled = true,
    this.longPressDuration,
    this.elevation,
    this.color,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCard();
}

class _CustomCard extends State<CustomCard> with ButtonHandler {
  bool _isLongPress = false;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      margin: EdgeInsets.zero,
      elevation: widget.elevation ?? 2.sp,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sp),
        side: BorderSide(
          color: Theme.of(context).cardTheme.surfaceTintColor ?? Colors.grey,
          width: 1.sp,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 80.sp, // 設置最小高度
        ),
        child: InkWell(
          onTapCancel: widget.onLongPress != null
              ? () => handleButtonClick(
                    "onTapCancel",
                    () {
                      print("onTapCancel");
                      _isLongPress = false;
                      timer?.cancel();
                    },
                  )
              : null,
          onTapDown: widget.onLongPress != null
              ? (_) => handleButtonClick(
                    "onTapDown",
                    () {
                      print("onTapDown");
                      _isLongPress = true;
                      timer = Timer(Duration(seconds: widget.longPressDuration ?? 2), () {
                        if (_isLongPress && widget.onLongPress != null) {
                          widget.onLongPress!();
                        }
                      });
                    },
                  )
              : null,
          onTapUp: widget.onLongPress != null
              ? (_) => handleButtonClick(
                    "onTapUp",
                    () {
                      print("onTapUp");
                      _isLongPress = false;
                      timer?.cancel();
                    },
                  )
              : null,
          onTap: widget.onTap != null
              ? () => handleButtonClick(
                    "onTap",
                    () async => widget.onTap!(),
                  )
              : null,
          borderRadius: BorderRadius.circular(8.sp),
          child: Opacity(
            opacity: widget.enabled ? 1.0 : 0.5,
            child: Padding(
              padding: widget.itemPadding != null ? widget.itemPadding! : EdgeInsets.all(16.sp),
              child: widget.child,
            ),
          ),
        ), // 指定要限制高度的 Widget
      ),
    );
  }
}
