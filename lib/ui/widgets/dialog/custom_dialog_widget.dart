import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button/outlined_elevated_button.dart';
import '../../widgets/button/solid_elevated_button.dart';

class BtnBindingModel {
  final String btnText;
  final Function() onBtnClick;
  final Color? backgroundColor;
  final Color? foregroundColor;

  BtnBindingModel({
    required this.btnText,
    required this.onBtnClick,
    this.backgroundColor,
    this.foregroundColor,
  });
}

class CustomDialogWidget extends StatelessWidget {
  final Color? backgroundColor;
  final String? titleImage;
  final double? titleImageSize;
  final String? title;
  final TextStyle? titleStyle;
  final String? content;
  final TextStyle? contentStyle;
  final TextAlign? contentTextAlign;
  final Widget? child;
  final CrossAxisAlignment? crossAxisAlignment;
  final BtnBindingModel? positiveBinding;
  final BtnBindingModel? negativeBinding;

  const CustomDialogWidget({
    Key? key,
    this.backgroundColor,
    this.titleImage,
    this.titleImageSize,
    this.title,
    this.titleStyle,
    this.content,
    this.contentStyle,
    this.contentTextAlign,
    this.crossAxisAlignment,
    this.positiveBinding,
    this.negativeBinding,
  })  : child = null,
        super(key: key);

  const CustomDialogWidget.childWithButton({
    Key? key,
    this.child,
    this.crossAxisAlignment,
    required this.positiveBinding,
    required this.negativeBinding,
  })  : assert(positiveBinding != null),
        assert(negativeBinding != null),
        backgroundColor = null,
        titleImage = null,
        titleImageSize = null,
        title = null,
        titleStyle = null,
        content = null,
        contentStyle = null,
        contentTextAlign = null,
        super(key: key);

  const CustomDialogWidget.childBuilder({
    Key? key,
    this.child,
    this.crossAxisAlignment,
  })  : backgroundColor = null,
        positiveBinding = null,
        negativeBinding = null,
        titleImage = null,
        titleImageSize = null,
        title = null,
        titleStyle = null,
        content = null,
        contentStyle = null,
        contentTextAlign = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0.sp))),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return ClipRRect(
            borderRadius: BorderRadius.circular(15), // 圆角半径
            child: SizedBox(
              width: width * 0.9,
              child: Column(
                crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: titleImage != null,
                    child: Image.asset(
                      titleImage ?? "",
                      width: titleImageSize ?? 66.67.sp,
                      height: titleImageSize ?? 66.67.sp,
                    ),
                  ),
                  Visibility(
                    visible: title != null,
                    child: Column(
                      children: [
                        SizedBox(height: 10.sp),
                        Text(
                          title.toString(),
                          style: titleStyle ?? TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w600, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: content != null,
                    child: Column(
                      children: [
                        SizedBox(height: 10.sp),
                        Text(
                          content.toString(),
                          style: contentStyle ?? TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w400, fontSize: 16.sp),
                          textAlign: contentTextAlign ?? TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  if (child != null) child!,
                  if (negativeBinding != null || positiveBinding != null) SizedBox(height: 20.sp),
                  Row(
                    children: [
                      if (negativeBinding != null)
                        Expanded(
                          flex: 1,
                          child: SolidElevatedButton(
                            onTap: () {
                              negativeBinding?.onBtnClick();
                              // Navigator.pop(context);
                            },
                            backgroundColor: negativeBinding?.backgroundColor ?? Theme.of(context).buttonTheme.colorScheme?.secondary,
                            foregroundColor: negativeBinding?.foregroundColor ?? Theme.of(context).buttonTheme.colorScheme?.primary,
                            child: Text(
                              negativeBinding?.btnText ?? "",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      if (positiveBinding != null)
                        Expanded(
                          flex: 1,
                          child: SolidElevatedButton(
                            onTap: () {
                              positiveBinding?.onBtnClick();
                            },
                            backgroundColor: positiveBinding?.backgroundColor,
                            foregroundColor: positiveBinding?.foregroundColor,
                            child: Text(
                              positiveBinding?.btnText ?? "",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
