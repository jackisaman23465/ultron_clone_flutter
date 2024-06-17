import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';
import '../ui_config.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(
        onSkip: () => context.go(Routes.loginPage),
        onFinish: () => context.go(Routes.loginPage),
        pages: [
          OnboardingPageModel(
            title: '輕鬆識別',
            description: '掃描QR code不需搜尋裝置',
            imageUrl: UIImages.onboarding1,
          ),
          OnboardingPageModel(
            title: '安全配網',
            description: '手動開通專屬你的裝置',
            imageUrl: UIImages.onboarding2,
          ),
          OnboardingPageModel(
            title: '穩定連線',
            description: '智慧裝置聯網不再是惡夢',
            imageUrl: UIImages.onboarding3,
          ),
          OnboardingPageModel(
            title: '智慧生活',
            description: '情境設定無縫調和日常需求',
            imageUrl: UIImages.onboarding4,
          ),
        ],
      ),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter({
    super.key,
    required this.pages,
    this.onSkip,
    this.onFinish,
  });

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPagePresenterState();
}

class _OnboardingPagePresenterState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;

  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: UIAnimations.animateDuration,
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 30.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.onFinish?.call();
                        // if (_currentPage == widget.pages.length - 1) {
                        //   widget.onFinish?.call();
                        // } else {
                        //   _pageController.animateToPage(
                        //     _currentPage + 1,
                        //     curve: Curves.easeInOutCubic,
                        //     duration: const Duration(milliseconds: 250),
                        //   );
                        // }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1 ? "開始使用" : "略過",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: UIColors.buttonPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  // Pageview to render each page
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.pages.length,
                    onPageChanged: (idx) {
                      // Change current page when pageview changes
                      setState(() {
                        _currentPage = idx;
                      });
                    },
                    itemBuilder: (context, idx) {
                      final item = widget.pages[idx];
                      return Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(32.sp),
                              child: Image.asset(item.imageUrl),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.sp),
                                  child: Text(
                                    item.title,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 280.sp),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.sp,
                                    vertical: 8.sp,
                                  ),
                                  child: Text(
                                    item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // Current page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pages
                      .map(
                        (item) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: _currentPage == widget.pages.indexOf(item) ? 30.sp : 8.sp,
                      height: 8.sp,
                      margin: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                        color: _currentPage == widget.pages.indexOf(item) ? UIColors.buttonPrimaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.bgColor = Colors.white,
    this.textColor = Colors.black87,
  });
}
