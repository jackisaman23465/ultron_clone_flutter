import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/outlined_elevated_button.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/solid_elevated_button.dart';

import '../../models/system_info.dart';
import '../router/app_router.dart';
import '../ui_config.dart';
import '../widgets/appbar/custom_app_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _ifScreenShotAndRecord = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar.back(
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: '設定',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30.h,
            horizontal: 10.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).buttonTheme.colorScheme?.secondary,
                            border: Border.all(color: Colors.white, width: 1.5.w),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person,
                            size: 50.w,
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Text('周子傑'),
                      ],
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  '設定',
                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).buttonTheme.colorScheme?.primary),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '生物辨識鎖定',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '螢幕截圖和錄影',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                        Switch(
                          value: _ifScreenShotAndRecord,
                          onChanged: (value) {
                            setState(() {
                              _ifScreenShotAndRecord = value;
                            });
                          },),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Divider(
                      height: 24.h,
                      thickness: 0.5.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      '支援',
                      style: TextStyle(fontSize: 16.sp, color: Theme.of(context).buttonTheme.colorScheme?.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '改版導覽',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    ),
                  ],
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '常見問題',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  '服務',
                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).buttonTheme.colorScheme?.primary),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '關於奧創',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    ),
                  ],
                ),
              ),
              SolidElevatedButton(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '連結服務',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      height: 24.h,
                      thickness: 0.5.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Ultron App 版本: ${SystemInfo.projectVersion} (${SystemInfo.projectCode})',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(height: 4.h),
                    Image.asset(
                      UIImages.poweredByIcon,
                      width: 100.w,
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: OutlinedElevatedButton(
                        onPressed: () {
                          context.go(Routes.loginPage);
                        },
                        foregroundColor: Theme.of(context).dividerColor,
                        borderWidth: 1.h,
                        padding: EdgeInsets.all(14.h),
                        child: Text(
                          '登出',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: UIColors.errorColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
