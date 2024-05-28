import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../models/system_info.dart';
import '../ui_config.dart';
import '../widgets/appbar/custom_app_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar.back(
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: '通知',
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
            horizontal: 20.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.grey,
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
              SizedBox(
                height: 30.h,
              ),
              Text(
                '設定',
                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).buttonTheme.colorScheme?.primary),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '生物辨識鎖定',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ],
              ),
              Divider(
                height: 40.h,
                thickness: 0.5.h,
              ),
              Text(
                '支援',
                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).buttonTheme.colorScheme?.primary),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '改版導覽',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '常見問題',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                '服務',
                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).buttonTheme.colorScheme?.primary),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '關於奧創',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '連結服務',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                ],
              ),
              Divider(
                height: 40.h,
                thickness: 0.5.h,
              ),
              Text(
                'Ultron App 版本: ${SystemInfo.projectVersion} (${SystemInfo.projectCode})',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
