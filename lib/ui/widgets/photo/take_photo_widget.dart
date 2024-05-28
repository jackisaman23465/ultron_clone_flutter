import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/outlined_elevated_button.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/solid_elevated_button.dart';
import '../../ui_config.dart';

import '../dialog/custom_dialog_widget.dart';
import '../common/dialog_loading.dart';
import '../dialog/custom_dialog.dart';

class TakePhotoWidget extends StatefulWidget {
  final String title;
  final List<File> photoList;
  final List<File> deletePhotoList = [];
  final Function(File) onAddPhoto;
  final Function(File) onDeletePhoto;
  final int? photoLimit;

  TakePhotoWidget({
    Key? key,
    required this.title,
    required this.photoList,
    required this.onAddPhoto,
    required this.onDeletePhoto,
    this.photoLimit = 20,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TakePhotoWidget();
}

class _TakePhotoWidget extends State<TakePhotoWidget> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: UIColors.normalTextColor),
        ),
        SizedBox(height: 8.sp),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SolidElevatedButton(
                  onTap: () async {
                    bool isPermissionGranted = true;
                    if (Platform.isIOS) {
                      isPermissionGranted = await checkCameraPermission();
                    }
                    if (isPermissionGranted) {
                      if (widget.photoList.length < widget.photoLimit!) {
                        if (mounted) {
                          DialogLoading.show(context);
                        }
                        // take a photo
                        final XFile? image = await picker.pickImage(source: ImageSource.camera);
                        if (image != null) {
                          widget.onAddPhoto(File(image.path));
                          setState(() {});
                        }
                        Navigator.pop(context);
                      } else {
                        reachPhotoLimitDialog();
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt),
                      SizedBox(width: 8.sp),
                      Text(
                        '拍照',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.sp),
              Expanded(
                flex: 1,
                child: OutlinedElevatedButton(
                  onTap: () async {
                    bool isPermissionGranted = true;
                    if (Platform.isIOS) {
                      isPermissionGranted = await checkGalleryPermission();
                    }
                    if (isPermissionGranted) {
                      if (widget.photoList.length < widget.photoLimit!) {
                        if (mounted) {
                          DialogLoading.show(context);
                        }
                        // take a photo
                        final List<XFile> imageList = await picker.pickMultiImage();
                        try {
                          if (imageList.isNotEmpty) {
                            for (XFile image in imageList) {
                              if (widget.photoList.length < widget.photoLimit!) {
                                widget.onAddPhoto(File(image.path));
                              }
                            }
                            setState(() {});
                          }
                        } catch (e) {
                          print("TakePhotoWidget: $e");
                        }
                        Navigator.pop(context);
                      } else {
                        reachPhotoLimitDialog();
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_copy),
                      SizedBox(width: 8.sp),
                      Text(
                        '從檔案',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.sp),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.photoList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
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
                            onTap: () {
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
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: ClipOval(
                    child: Material(
                      color: Colors.black.withOpacity(0.6), // Button color
                      child: InkWell(
                        splashColor: Colors.red, // Splash color
                        onTap: () {
                          removePhotoDialog(index, widget.photoList);
                        },
                        child: Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: SizedBox(
                              width: 16.sp,
                              height: 16.sp,
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 4.sp,
            crossAxisSpacing: 4.sp,
            childAspectRatio: 1.0,
          ),
        ),
      ],
    );
  }

  Future<bool> checkGalleryPermission() async {
    PermissionStatus status = await Permission.photos.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      PermissionStatus requestStatus = await Permission.photos.request();
      if (requestStatus.isGranted) {
        return true;
      } else {
        permissionDialog();
      }
    } else if (status.isPermanentlyDenied) {
      permissionDialog();
    }
    return false;
  }

  Future<bool> checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    print(status.isDenied);
    print(status.isPermanentlyDenied);
    print(status.isRestricted);
    print(status.isGranted);
    print(status.isLimited);
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      PermissionStatus requestStatus = await Permission.camera.request();
      if (requestStatus.isGranted) {
        return true;
      } else {
        permissionDialog();
      }
    } else if (status.isPermanentlyDenied) {
      permissionDialog();
    }
    return false;
  }

  void permissionDialog() {
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
    ).show().then((value) => setState(() {}));
  }

  void reachPhotoLimitDialog() {
    CustomDialog(
      context: context,
      isOverlayTapDismiss: true,
      hasReverseAnimate: true,
      child: CustomDialogWidget(
        titleImage: 'assets/images/icon_warning.png',
        content: "到達張數上限",
        positiveBinding: BtnBindingModel(
          btnText: "確定",
          onBtnClick: () async {
            Navigator.pop(context);
          },
        ),
      ),
    ).show().then((value) => setState(() {}));
  }

  void removePhotoDialog(int index, List<File> photoList) {
    CustomDialog(
        context: context,
        isOverlayTapDismiss: true,
        hasReverseAnimate: true,
        child: CustomDialogWidget(
          title: "確定移除此照片?",
          content: "此動作無法復原",
          positiveBinding: BtnBindingModel(
              btnText: "移除",
              onBtnClick: () {
                setState(() {
                  widget.onDeletePhoto(photoList[index]);
                  photoList.removeAt(index);
                  Navigator.pop(context);
                });
              }),
          negativeBinding: BtnBindingModel(
            btnText: "取消",
            onBtnClick: () => {Navigator.pop(context)},
          ),
        )).show();
  }
}
