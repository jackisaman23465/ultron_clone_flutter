import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/ui/ui_config.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/solid_elevated_button.dart';
import '../../../bloc/main_cubit.dart';
import '../../app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int tabPageIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Image.asset(
              UIImages.appBackground,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12.w,
                                ),
                                IconButton(
                                  onPressed: () => context.read<MainCubit>().showHomeFunctionAtTop(),
                                  icon: Icon(
                                    Icons.home_outlined,
                                    size: 24.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                IconButton(
                                  onPressed: () => context.read<MainCubit>().showMoreFunctionAtTop(),
                                  icon: Icon(
                                    Icons.add,
                                    size: 24.w,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.key,
                                  size: 24.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                IconButton(
                                  onPressed: () => context.push(Routes.notificationPage),
                                  icon: Icon(
                                    Icons.notifications_outlined,
                                    size: 24.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                IconButton(
                                  onPressed: () => context.push(Routes.settingPage),
                                  icon: Icon(
                                    Icons.person,
                                    size: 24.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          '溫暖的家',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: UIColors.normalTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SolidElevatedButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          rippleColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
                          padding: EdgeInsets.symmetric(
                            vertical: 0.h,
                            horizontal: 4.w,
                          ),
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 18.w,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                '設定小工具',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: UIColors.buttonPrimaryColor,
                    indicatorColor: UIColors.buttonPrimaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 18.sp),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: '情境'),
                      Tab(text: '裝置'),
                    ],
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double parentHeight = constraints.maxHeight;
                        final double position = parentHeight * 0.25;

                        return Stack(
                          children: [
                            Positioned(
                              top: position,
                              left: 0,
                              right: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('開始掃描奧創裝置'),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 0.5, // 佔據父容器寬度的一半
                                    child: SolidElevatedButton(
                                      onTap: () => context.push(Routes.qrcodeScanPage),
                                      padding: EdgeInsets.all(4.h),
                                      child: const Text('加入裝置'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
