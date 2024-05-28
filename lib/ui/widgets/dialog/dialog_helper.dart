import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dialog/custom_dialog.dart';
import '../dialog/custom_dialog_widget.dart';

class DialogHelper {
  static existAppDialog(BuildContext context) {
    CustomDialog(
      context: context,
      isOverlayTapDismiss: true,
      hasReverseAnimate: true,
      child: CustomDialogWidget(
        title: "確定離開?",
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
}
