import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/solid_elevated_button.dart';
import 'package:ultron_clone_flutter/ui/widgets/card/custom_card.dart';

import '../../ui_config.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: 'Ultron Health',
        tintColor: Theme.of(context).buttonTheme.colorScheme?.primary,
        textColor: Colors.black,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.h),
          child: Container(
            height: 0.5.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  offset: Offset(0,1.h),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: Theme.of(context).buttonTheme.colorScheme?.secondary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.person,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(UIImages.banner),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      '你的健康狀況，盡在手中。',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: UIColors.normalTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '綁定 FORA 藍牙裝置，即可啟用 Ultron Health Starter 基本版服務。',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: UIColors.normalTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '綁定 FORA 藍牙裝置，即可啟用 Ultron Health Starter 基本版服務。',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: UIColors.normalTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: FractionallySizedBox(
                        widthFactor: 0.6, // 佔據父容器寬度的一半
                        child: SolidElevatedButton(
                          rippleColor: Colors.white.withOpacity(0.25),
                          onPressed: () {},
                          padding: EdgeInsets.all(4.h),
                          child: Text(
                            '建立個人資料',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Image.asset(
              UIImages.poweredByIcon,
              width: 100.w,
            ),
          ],
        ),
      ),
    );
  }
}
