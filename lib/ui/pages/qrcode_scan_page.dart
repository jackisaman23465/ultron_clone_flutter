import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ultron_clone_flutter/ui/widgets/dialog/dialog_helper.dart';

import '../../common/permission_manager.dart';
import '../ui_config.dart';
import '../widgets/common/dialog_loading.dart';
import '../widgets/dialog/custom_dialog.dart';
import '../widgets/dialog/custom_dialog_widget.dart';
import '../widgets/slider/custom_slider.dart';

class QRCodeScanPage extends StatefulWidget {
  const QRCodeScanPage({super.key});

  @override
  State<QRCodeScanPage> createState() => _QRCodeScanPageState();
}

class _QRCodeScanPageState extends State<QRCodeScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;
  bool _isFlashOn = false;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Transform.scale(
                  scale: _scale,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Theme.of(context).buttonTheme.colorScheme?.primary ?? Colors.white,
                      borderRadius: 2.r / _scale,
                      borderLength: 40.w / _scale,
                      borderWidth: 8.w / _scale,
                      cutOutSize: 200 / _scale,
                    ),
                  ),
                ),
                Positioned(
                  left: 12.w,
                  right: 12.w,
                  top: MediaQuery.of(context).padding.top + 12.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.close,
                          size: 30.w,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {
                            _isFlashOn = !_isFlashOn;
                          });
                        },
                        icon: Icon(
                          _isFlashOn ? Icons.flash_off : Icons.flash_on,
                          size: 30.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 12.w,
                  right: 12.w,
                  bottom: 4.h,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _scale - 0.2 > 1.0 ? _scale -= 0.2 : _scale = 1.0;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 30.w,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 4.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(24.r),
                                  border: Border.all(
                                    width: 0.5.w,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Slider(
                                value: _scale,
                                min: 1.0,
                                max: 2.0,
                                onChanged: (double value) {
                                  setState(() {
                                    _scale = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _scale + 0.2 < 2.0 ? _scale += 0.2 : _scale = 2.0;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 30.w,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Image.asset(
                    UIImages.qrcodeBackground,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '掃描 QR code',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              Positioned(
                                // top: 12.h,
                                right: 0,
                                child: IconButton(
                                  onPressed: () async {
                                    final ImagePicker picker = ImagePicker();
                                    bool isPermissionGranted = true;
                                    if (Platform.isIOS) {
                                      isPermissionGranted = await PermissionManager.checkGalleryPermission();
                                    }
                                    if (isPermissionGranted) {
                                      if (mounted) {
                                        DialogLoading.show(context);
                                      }
                                      final List<XFile> imageList = await picker.pickMultiImage();
                                      try {
                                        if (imageList.isNotEmpty) {
                                          for (XFile image in imageList) {
                                            File(image.path);
                                          }
                                          setState(() {});
                                        }
                                      } catch(e){

                                      }
                                      if(context.mounted){
                                        Navigator.pop(context);
                                      }
                                    }else{
                                      if(context.mounted){
                                        DialogHelper.showPermissionDialog(
                                          context: context,
                                          onPermissionCallback: () {
                                            setState(() {});
                                          },
                                        );
                                      }
                                    }
                                  },
                                  icon: Icon(
                                    Icons.image_outlined,
                                    size: 24.w,
                                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '可以拖曳原點或點擊「＋」和「－」來縮放畫面;也可以打開右上方的閃光燈按鍵，以取得更清楚的QR code。',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: UIColors.placeholderTextColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
