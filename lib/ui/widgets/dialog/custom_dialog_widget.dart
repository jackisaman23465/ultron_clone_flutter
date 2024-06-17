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
  final Offset? offset;
  final double? width;

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
    this.offset,
    this.width,
  })  : child = null,
        super(key: key);

  const CustomDialogWidget.childWithButton({
    Key? key,
    this.child,
    this.crossAxisAlignment,
    required this.positiveBinding,
    required this.negativeBinding,
    this.backgroundColor,
    this.offset,
    this.width,
  })  : assert(positiveBinding != null),
        assert(negativeBinding != null),
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
    this.offset,
    this.width,
    this.backgroundColor,
  })  : positiveBinding = null,
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
    return Transform.translate(
      offset: offset ?? const Offset(0, 0),
      child: UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: width ?? MediaQuery.sizeOf(context).width * 0.9,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.w))),
            insetPadding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.w),
              child: child ??
                  Column(
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
                            SizedBox(height: 24.h),
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
                            SizedBox(height: 24.sp),
                            Text(
                              content.toString(),
                              style: contentStyle ?? TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w400, fontSize: 16.sp),
                              textAlign: contentTextAlign ?? TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      if (negativeBinding != null || positiveBinding != null) SizedBox(height: 24.sp),
                      Row(
                        children: [
                          if (negativeBinding != null)
                            Expanded(
                              flex: 1,
                              child: SolidElevatedButton(
                                onPressed: () {
                                  negativeBinding?.onBtnClick();
                                  // Navigator.pop(context);
                                },
                                backgroundColor: negativeBinding?.backgroundColor ?? Theme.of(context).buttonTheme.colorScheme?.secondary,
                                foregroundColor: negativeBinding?.foregroundColor ?? Theme.of(context).buttonTheme.colorScheme?.primary,
                                padding: EdgeInsets.all(16.w),
                                borderRadius: 0.r,
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
                                onPressed: () {
                                  positiveBinding?.onBtnClick();
                                },
                                backgroundColor: positiveBinding?.backgroundColor,
                                foregroundColor: positiveBinding?.foregroundColor,
                                rippleColor: Colors.white.withOpacity(0.25),
                                padding: EdgeInsets.all(16.w),
                                borderRadius: 0.r,
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
          ),
        ),
      ),
    );
  }
}
