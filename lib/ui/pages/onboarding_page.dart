import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';
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
            title: '標題(一)',
            description: '內容(一)',
            imageUrl: UIImages.onboarding1,
            bgColor: Theme.of(context).primaryColor,
          ),
          OnboardingPageModel(
            title: '標題(二)',
            description: '內容(二)',
            imageUrl: UIImages.onboarding2,
            bgColor: Theme.of(context).primaryColor,
          ),
          OnboardingPageModel(
            title: '標題(三)',
            description: '內容(三)',
            imageUrl: UIImages.onboarding3,
            bgColor: Theme.of(context).primaryColor,
          ),
          OnboardingPageModel(
            title: '標題(四)',
            description: '內容(四)',
            imageUrl: UIImages.onboarding4,
            bgColor: Theme.of(context).primaryColor,
          ),
          OnboardingPageModel(
            title: '標題(五)',
            description: '內容(五)',
            imageUrl: UIImages.onboarding5,
            bgColor: Theme.of(context).primaryColor,
          ),
          OnboardingPageModel(
            title: '標題(六)',
            description: '內容(六)',
            imageUrl: UIImages.onboarding6,
            bgColor: Theme.of(context).primaryColor,
          ),
          OnboardingPageModel(
            title: '標題(七)',
            description: '內容(七)',
            imageUrl: UIImages.onboarding7,
            bgColor: Theme.of(context).primaryColor,
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
          child: Column(
            children: [
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
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: item.textColor,
                                      ),
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
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: item.textColor,
                                      ),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                    )
                    .toList(),
              ),
              // Bottom buttons
              SizedBox(
                height: 100.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        widget.onSkip?.call();
                      },
                      child: const Text("略過"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          widget.onFinish?.call();
                        } else {
                          _pageController.animateToPage(
                            _currentPage + 1,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 250),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1 ? "結束導覽" : "下一步",
                          ),
                          const SizedBox(width: 8),
                          Icon(_currentPage == widget.pages.length - 1 ? Icons.done : Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
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
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
  });
}
