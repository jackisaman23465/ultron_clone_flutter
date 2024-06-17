import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../router/app_router.dart';
import '../../../widgets/button/solid_elevated_button.dart';
import '../../../widgets/dialog/custom_dialog.dart';
import '../../../widgets/dialog/custom_dialog_widget.dart';

class MoreFunctionDialog {
  final BuildContext context;
  final Offset offset;
  final double width;

  const MoreFunctionDialog(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                borderRadius: 0.sp,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                onPressed: () {
                  context.push(Routes.qrcodeScanPage);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.qr_code_scanner,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      '加入裝置/家庭',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Divider(
                  height: 0.5.h,
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                borderRadius: 0.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.fiber_manual_record,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      '手動加入裝置',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Divider(
                  height: 0.5.h,
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                borderRadius: 0.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.control_camera_outlined,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      '建立控制群組',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Divider(
                  height: 0.5.h,
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                borderRadius: 0.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.scanner_sharp,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      '加入情境',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Divider(
                  height: 0.5.h,
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                borderRadius: 0.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.auto_awesome_mosaic_rounded,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      '加入自動化',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Divider(
                  height: 0.5.h,
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                borderRadius: 0.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.card_membership,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      '邀請家庭成員',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).show();
  }
}
