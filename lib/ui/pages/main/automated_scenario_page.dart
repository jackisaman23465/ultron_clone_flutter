import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../ui_config.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class AutomatedScenarioPage extends StatefulWidget {
  const AutomatedScenarioPage({super.key});

  @override
  State<AutomatedScenarioPage> createState() => _AutomatedScenarioPageState();
}

class _AutomatedScenarioPageState extends State<AutomatedScenarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: '自動化',
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
                  height: 30.h,
                ),
                Text(
                  '讓裝置們彼此互相進行回應',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '啟用自動化操作，讓裝置們自行運用，無需再費心。',
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
