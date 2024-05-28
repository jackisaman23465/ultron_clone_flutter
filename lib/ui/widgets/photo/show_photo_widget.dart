import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../dialog/custom_dialog.dart';

class ShowPhotoWidget extends StatefulWidget {
  final List<File> photoList;

  const ShowPhotoWidget({
    Key? key,
    required this.photoList,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShowPhotoWidget();
}

class _ShowPhotoWidget extends State<ShowPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.photoList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            CustomDialog(
              context: context,
              isOverlayTapDismiss: true,
              animationType: AnimationType.fade,
              animationDuration: const Duration(milliseconds: 250),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.sp),
                    child: Image.file(
                      widget.photoList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ).show();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.sp),
            child: Image.file(
              widget.photoList[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4.sp,
        crossAxisSpacing: 4.sp,
        childAspectRatio: 1.0,
      ),
    );
  }
}
