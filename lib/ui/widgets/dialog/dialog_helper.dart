import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../dialog/custom_dialog.dart';
import '../dialog/custom_dialog_widget.dart';

class DialogHelper {
  static existAppDialog(BuildContext context) {
    CustomDialog(
      context: context,
      isOverlayTapDismiss: true,
      hasReverseAnimate: true,
      child: CustomDialogWidget(
        title: "離開Ultron?",
        titleStyle: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
        positiveBinding: BtnBindingModel(
          btnText: "離開",
          onBtnClick: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        ),
        negativeBinding: BtnBindingModel(
          btnText: "取消",
          onBtnClick: () => Navigator.pop(context),
        ),
      ),
    ).show();
  }

  static showDialog({
    required BuildContext context,
    String? title,
    String? content,
    BtnBindingModel? positiveBtn,
    BtnBindingModel? negativeBtn,
  }) {
    CustomDialog(
      context: context,
      isOverlayTapDismiss: true,
      hasReverseAnimate: true,
      child: CustomDialogWidget(
        title: title,
        content: content,
        positiveBinding: positiveBtn,
        negativeBinding: negativeBtn,
      ),
    ).show();
  }

  static void showPermissionDialog({
    required BuildContext context,
    Function()? onPermissionCallback,
  }) {
    CustomDialog(
      context: context,
      isOverlayTapDismiss: true,
      hasReverseAnimate: true,
      child: CustomDialogWidget(
        titleImage: 'assets/images/icon_warning.png',
        content: "請至設定開啟權限",
        positiveBinding: BtnBindingModel(
          btnText: "確定",
          onBtnClick: () async {
            Navigator.pop(context);
            openAppSettings();
          },
        ),
      ),
    ).show().then(
      (value) {
        if (onPermissionCallback != null) onPermissionCallback();
      },
    );
  }
}
