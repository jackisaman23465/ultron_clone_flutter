import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/button/solid_elevated_button.dart';
import '../../../widgets/dialog/custom_dialog.dart';
import '../../../widgets/dialog/custom_dialog_widget.dart';

class HomeFunctionDialog {
  final BuildContext context;
  final Offset offset;
  final double width;

  const HomeFunctionDialog(
    this.context, {
    required this.offset,
    required this.width,
  });

  show() {
    CustomDialog(
      context: context,
      isOverlayTapDismiss: true,
      hasReverseAnimate: true,
      animationType: AnimationType.fade,
      child: UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: CustomDialogWidget.childBuilder(
          width: width,
          offset: offset,
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SolidElevatedButton(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
                  borderRadius: 8.r,
                  padding: EdgeInsets.all(12.h),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.home,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Text(
                        '溫暖的家',
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5.h,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SolidElevatedButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
                  borderRadius: 8.r,
                  padding: EdgeInsets.all(12.h),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Text(
                        '家庭設定',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SolidElevatedButton(
                  backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
                  foregroundColor: Colors.black,
                  borderRadius: 8.r,
                  padding: EdgeInsets.all(12.h),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Text(
                        '管理所有家庭',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SolidElevatedButton(
                  backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
                  foregroundColor: Colors.black,
                  borderRadius: 8.r,
                  padding: EdgeInsets.all(12.h),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Text(
                        '新增家庭',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).show();
  }
}
