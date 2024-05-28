import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';
import '../dialog/custom_dialog_widget.dart';

class DialogLoading {
  static show(BuildContext context, {String? title}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => CustomDialogWidget.childBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularProgressIndicator(strokeWidth: 5.0, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
            SizedBox(height: 16.sp,),
            Visibility(
              visible: title != null,
              child: Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
