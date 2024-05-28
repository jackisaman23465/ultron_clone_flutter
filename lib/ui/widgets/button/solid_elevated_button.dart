import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';
import 'button_handler.dart';

class SolidElevatedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? rippleColor;
  final double? borderRadius;
  final EdgeInsets? padding;

  const SolidElevatedButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.rippleColor,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SolidElevatedButtonState();
}

class _SolidElevatedButtonState extends State<SolidElevatedButton> with ButtonHandler {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleButtonClick(
        "onPressed",
        () async => widget.onTap(),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return widget.rippleColor ?? Theme.of(context).colorScheme.background.withOpacity(0.25); // 設置水波紋顏色
            }
            return widget.rippleColor ?? Theme.of(context).colorScheme.background; // 無水波紋顏色
          },
        ),
        elevation: MaterialStateProperty.all(0.sp),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.sp),
          ),
        ),
        padding: MaterialStateProperty.all(widget.padding ?? EdgeInsets.all(24.sp)),
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor ?? Theme.of(context).buttonTheme.colorScheme?.primary),
        foregroundColor: MaterialStateProperty.all(widget.foregroundColor ?? Colors.white),
      ),
      child: widget.child,
    );
  }
}
