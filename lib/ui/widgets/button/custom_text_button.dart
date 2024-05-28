import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ui_config.dart';
import 'button_handler.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Function()? onTap;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisSize? mainAxisSize;
  final EdgeInsetsGeometry? padding;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.style,
    this.onTap,
    this.leading,
    this.trailing,
    this.mainAxisSize,
    this.padding,
  }) : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButton();
}

class _CustomTextButton extends State<CustomTextButton> with ButtonHandler {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey.withOpacity(0.25),
        padding: widget.padding,
      ),
      onPressed: () => handleButtonClick(
        "onPressed",
        () async => widget.onTap != null ? widget.onTap!() : null,
      ),
      child: Row(
        mainAxisSize: widget.mainAxisSize ?? MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.leading != null,
            child: Row(
              children: [
                widget.leading ?? Container(),
                SizedBox(width: 12.sp),
              ],
            ),
          ),
          Text(
            widget.text,
            style: widget.style ??
                TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Visibility(
            visible: widget.trailing != null,
            child: Row(
              children: [
                SizedBox(width: 12.sp),
                widget.trailing ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
