import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../ui_config.dart';
import '../widgets/appbar/custom_app_bar.dart';

class ManualAddNewDevicePage extends StatefulWidget {
  const ManualAddNewDevicePage({super.key});

  @override
  State<ManualAddNewDevicePage> createState() => _ManualAddNewDevicePageState();
}

class _ManualAddNewDevicePageState extends State<ManualAddNewDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar.back(
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: '手動加入裝置',
        tintColor: Theme.of(context).buttonTheme.colorScheme?.primary,
        textColor: Colors.black,
        centerTitle: true,
        onBackPressed: () {
          context.pop();
        },
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5.h),
          child: Container(
            color: Colors.grey,
            height: 0.5.h,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(45.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.65,
                    child: Image.asset(UIImages.banner),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '你沒有任何新通知',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
