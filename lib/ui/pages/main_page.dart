import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/bloc/bloc_state.dart';
import 'package:ultron_clone_flutter/bloc/main_cubit.dart';
import 'package:ultron_clone_flutter/ui/pages/main/health_page.dart';
import 'package:ultron_clone_flutter/ui/widgets/button/solid_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../router/app_router.dart';
import 'main/automated_scenario_page.dart';
import 'main/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: _pageItems[_selectedIndex],
          bottomNavigationBar: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 60.w,
                          height: 60.w,
                          child: _selectedIndex == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 60.w,
                          height: 60.w,
                          child: _selectedIndex == 1 ? const Icon(Icons.beenhere) : const Icon(Icons.beenhere_outlined),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -30), // Move item up by 10 pixels
                      child: GestureDetector(
                        onTap: () {
                          context.read<MainCubit>().showMoreFunction(_selectedIndex);
                        },
                        child: Column(
                          children: [
                            // Container(
                            //   width: 60.w,
                            //   height: 60.w,
                            //   color: Colors.red,
                            // ),
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).primaryColorLight,
                                    Theme.of(context).primaryColor,
                                  ], // 漸層的顏色列表
                                  begin: Alignment.topLeft, // 漸層的開始位置
                                  end: Alignment.bottomRight, // 漸層的結束位置
                                ),
                                borderRadius: BorderRadius.circular(60.sp),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 60.w,
                          height: 60.w,
                          child: _selectedIndex == 2 ? const Icon(Icons.health_and_safety) : const Icon(Icons.health_and_safety_outlined),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => launchUrl(Uri.parse('https://www.ultronsmart.com/blog')),
                        child: Container(
                          color: Colors.transparent,
                          width: 60.w,
                          height: 60.w,
                          child: const Icon(Icons.language_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        BlocConsumer<MainCubit, BlocDataState>(
          builder: (context, state) {
            if (state is MoreFunction) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<MainCubit>().init();
                    },
                    child: Container(
                      color: Theme.of(context).dialogBackgroundColor,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width * 0.2,
                    bottom: 100.w,
                    child: moreFunctionWidget(context),
                  ),
                ],
              );
            } else if (state is MoreFunctionAtTop) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<MainCubit>().init();
                    },
                    child: Container(
                      color: Theme.of(context).dialogBackgroundColor,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                    ),
                  ),
                  Positioned(
                    left: 12.w,
                    top: MediaQuery.of(context).padding.top + 60.w,
                    child: moreFunctionWidget(context),
                  ),
                ],
              );
            } else if (state is HomeFunctionAtTop) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<MainCubit>().init();
                    },
                    child: Container(
                      color: Theme.of(context).dialogBackgroundColor,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                    ),
                  ),
                  Positioned(
                    left: 12.w,
                    top: MediaQuery.of(context).padding.top + 60.w,
                    child: homeFunctionWidget(context),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }, listener: (BuildContext context, BlocDataState state) {
            if(state is GoAddNewAutomatedScenarioPage){
              context.push(Routes.addAutomatedScenarioPage);
            }
        },
        ),
      ],
    );
  }
}

Widget moreFunctionWidget(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        color: Colors.white,
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: Column(
          children: [
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              borderRadius: 0.sp,
              padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 12.sp),
              onPressed: () {
                context.push(Routes.qrcodeScanPage);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.qr_code_scanner,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '加入裝置/家庭',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Divider(
                height: 0.5.h,
              ),
            ),
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              borderRadius: 0.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.fiber_manual_record,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '手動加入裝置',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Divider(
                height: 0.5.h,
              ),
            ),
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              borderRadius: 0.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.control_camera_outlined,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '建立控制群組',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Divider(
                height: 0.5.h,
              ),
            ),
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              borderRadius: 0.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.scanner_sharp,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '加入情境',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Divider(
                height: 0.5.h,
              ),
            ),
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              borderRadius: 0.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.auto_awesome_mosaic_rounded,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '加入自動化',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Divider(
                height: 0.5.h,
              ),
            ),
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              borderRadius: 0.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.card_membership,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '邀請家庭成員',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget homeFunctionWidget(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        color: Colors.white,
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: Column(
          children: [
            SolidElevatedButton(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
              borderRadius: 8.r,
              padding: EdgeInsets.all(12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '溫暖的家',
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5.h,
            ),
            SizedBox(
              height: 8.h,
            ),
            SolidElevatedButton(
              foregroundColor: Colors.black,
              backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
              borderRadius: 8.r,
              padding: EdgeInsets.all(12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '家庭設定',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SolidElevatedButton(
              backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
              foregroundColor: Colors.black,
              borderRadius: 8.r,
              padding: EdgeInsets.all(12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '管理所有家庭',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SolidElevatedButton(
              backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary.withOpacity(0.1),
              foregroundColor: Colors.black,
              borderRadius: 8.r,
              padding: EdgeInsets.all(12.sp),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    '新增家庭',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

var _pageItems = [
  const HomePage(),
  const AutomatedScenarioPage(),
  const HealthPage(),
];

var _navbarItems = [
  const NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
    label: '',
  ),
  const NavigationDestination(
    icon: Icon(Icons.article_outlined),
    selectedIcon: Icon(Icons.article_rounded),
    label: '新聞',
  ),
  const NavigationDestination(
    icon: Icon(Icons.person_outline_rounded),
    selectedIcon: Icon(Icons.person_rounded),
    label: '個人',
  ),
  const NavigationDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: '設定',
  ),
];
