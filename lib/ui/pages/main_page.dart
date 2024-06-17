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
import '../widgets/dialog/custom_dialog.dart';
import '../widgets/dialog/custom_dialog_widget.dart';
import 'main/automated_scenario_page.dart';
import 'main/home/home_function_dialog.dart';
import 'main/home/more_function_diloag.dart';
import 'main/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _pageItems = [
    const HomePage(),
    const AutomatedScenarioPage(),
    const HealthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<MainCubit, BlocDataState>(
          // builder: (context, state) {
          //   if (state is MoreFunction) {
          //     return Stack(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             context.read<MainCubit>().init();
          //           },
          //           child: Container(
          //             color: Theme.of(context).dialogTheme.shadowColor,
          //             width: MediaQuery.sizeOf(context).width,
          //             height: MediaQuery.sizeOf(context).height,
          //           ),
          //         ),
          //         Positioned(
          //           left: MediaQuery.sizeOf(context).width * 0.2,
          //           bottom: 100.w,
          //           child: moreFunctionWidget(context),
          //         ),
          //       ],
          //     );
          //   } else if (state is MoreFunctionAtTop) {
          //     return Stack(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             context.read<MainCubit>().init();
          //           },
          //           child: Container(
          //             color: Theme.of(context).dialogTheme.shadowColor,
          //             width: MediaQuery.sizeOf(context).width,
          //             height: MediaQuery.sizeOf(context).height,
          //           ),
          //         ),
          //         Positioned(
          //           left: 12.w,
          //           top: MediaQuery.of(context).padding.top + 60.w,
          //           child: moreFunctionWidget(context),
          //         ),
          //       ],
          //     );
          //   } else if (state is HomeFunctionAtTop) {
          //     return Stack(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             context.read<MainCubit>().init();
          //           },
          //           child: Container(
          //             color: Theme.of(context).dialogBackgroundColor,
          //             width: MediaQuery.sizeOf(context).width,
          //             height: MediaQuery.sizeOf(context).height,
          //           ),
          //         ),
          //         Positioned(
          //           left: 12.w,
          //           top: MediaQuery.of(context).padding.top + 60.w,
          //           child: homeFunctionWidget(context),
          //         ),
          //       ],
          //     );
          //   } else {
          //     return Container();
          //   }
          // },
          child: Scaffold(
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
                        flex: 2,
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
                        flex: 2,
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
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
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
                        flex: 2,
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
            floatingActionButton: InkWell(
              onTap: () {
                context.read<MainCubit>().showMoreFunction(_selectedIndex);
              },
              borderRadius: BorderRadius.circular(28.0),
              splashColor: Colors.white.withOpacity(0.25),
              child: Container(
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
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.w,
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
          listener: (BuildContext context, BlocDataState state) {
            if (state is MoreFunction) {
              MoreFunctionDialog(
                context,
                offset: Offset(
                  0,
                  MediaQuery.sizeOf(context).height * 0.5 - 144.h - 110.w,
                ),
                width: MediaQuery.sizeOf(context).width * 0.6,
              ).show();
            } else if (state is MoreFunctionAtTop) {
              MoreFunctionDialog(
                context,
                offset: Offset(
                  -MediaQuery.sizeOf(context).width * 0.2 + 20.w,
                  -MediaQuery.sizeOf(context).height * 0.5 + MediaQuery.of(context).padding.top + 144.h + 70.w,
                ),
                width: MediaQuery.sizeOf(context).width * 0.6,
              ).show();
            } else if (state is HomeFunctionAtTop) {
              HomeFunctionDialog(
                context,
                offset: Offset(
                  -MediaQuery.sizeOf(context).width * 0.2 + 20.w,
                  -MediaQuery.sizeOf(context).height * 0.5 + MediaQuery.of(context).padding.top + 132.h + 70.w,
                ),
                width: MediaQuery.sizeOf(context).width * 0.6,
              ).show();
            } else if (state is GoAddNewAutomatedScenarioPage) {
              context.push(Routes.addAutomatedScenarioPage);
            }
          },
        ),
      ],
    );
  }
}
