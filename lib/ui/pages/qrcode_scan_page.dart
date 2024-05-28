import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../ui_config.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Theme.of(context).buttonTheme.colorScheme?.primary ?? Colors.white,
                    borderRadius: 2.r,
                    borderLength: 40.w,
                    borderWidth: 8.w,
                    cutOutSize: 200,
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
                        Icon(
                          Icons.remove,
                          size: 30.w,
                          color: Colors.white,
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
                                    )),
                              ),
                              const CustomSlider(),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 30.w,
                          color: Colors.white,
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
                                  onPressed: () {},
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
