import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';
import 'button_handler.dart';

class OutlinedElevatedButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const OutlinedElevatedButton({
    Key? key,
    this.onTap,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OutlinedElevatedButtonState();
}

class _OutlinedElevatedButtonState extends State<OutlinedElevatedButton> with ButtonHandler {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleButtonClick(
        "onPressed",
        () async => widget.onTap!(),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).primaryColor.withOpacity(0.25); // 設置水波紋顏色
            }
            return Theme.of(context).primaryColor; // 無水波紋顏色
          },
        ),
        elevation: MaterialStateProperty.all(0.sp),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(width: 2.sp, color: widget.foregroundColor ?? Theme.of(context).buttonTheme.colorScheme!.primary),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.all(20.sp)),
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor ?? Colors.transparent),
        foregroundColor: MaterialStateProperty.all(widget.foregroundColor ?? Theme.of(context).buttonTheme.colorScheme?.primary),
      ),
      child: widget.child,
    );
  }
}
