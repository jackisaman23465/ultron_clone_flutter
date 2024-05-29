import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';
import '../button/custom_text_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final VoidCallback? onActionPressed;
  final Color? barColor;
  final Color? textColor;
  final Color? tintColor;
  final bool isDarkStatusBar;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final TabController? tabController;
  final List<Tab>? tabs;

  const CustomAppBar({
    super.key,
    this.title,
    this.centerTitle,
    this.actions,
    this.onActionPressed,
    this.barColor,
    this.tintColor,
    this.isDarkStatusBar = true,
    this.leading,
    this.bottom,
    this.tabController,
    this.tabs, this.textColor,
  }) : onBackPressed = null;

  CustomAppBar.back({
    Key? key,
    required this.onBackPressed,
    this.title,
    this.centerTitle,
    this.barColor,
    this.tintColor = Colors.white,
    this.isDarkStatusBar = false,
    this.bottom, this.textColor,
  })  : assert(onBackPressed != null),
        leading = IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: tintColor),
          onPressed: () async {
            // await Future.delayed(AnimationConfig.clickAnimateDuration);
            if (onBackPressed != null) {
              onBackPressed();
            }
          },
        ),
        actions = null,
        onActionPressed = null,
        tabController = null,
        tabs = null,
        super(key: key);

  CustomAppBar.form({
    Key? key,
    this.onBackPressed,
    this.onActionPressed,
    this.title,
    this.centerTitle,
    this.barColor,
    this.tintColor = Colors.white,
    this.isDarkStatusBar = false, this.textColor,
  })  : leading = IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: tintColor),
          onPressed: () async {
            // await Future.delayed(AnimationConfig.clickAnimateDuration);
            if (onBackPressed != null) {
              onBackPressed();
            }
          },
        ),
        actions = [
          CustomTextButton(
            text: '儲存',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            onTap: () async {
              // await Future.delayed(AnimationConfig.clickAnimateDuration);
              if (onActionPressed != null) {
                onActionPressed();
              }
            },
          ),
        ],
        bottom = null,
        tabController = null,
        tabs = null,
        super(key: key);

  CustomAppBar.homeTab({
    Key? key,
    this.title,
    this.centerTitle,
    this.leading,
    this.barColor,
    this.tintColor = Colors.white,
    this.isDarkStatusBar = false,
    required this.tabController,
    required this.tabs, this.textColor,
  })  : assert(tabController != null),
        assert(tabs != null),
        actions = null,
        bottom = TabBar(
          controller: tabController,
          indicatorWeight: 4.0,
          labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
          tabs: tabs!,
        ),
        onBackPressed = null,
        onActionPressed = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 10,
          centerTitle: centerTitle,
          backgroundColor: Theme.of(context).primaryColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,
            // Status bar brightness (optional)
            statusBarIconBrightness: isDarkStatusBar ? Brightness.dark : Brightness.light,
            // For Android (light icons)
            statusBarBrightness: isDarkStatusBar ? Brightness.light : Brightness.dark, // For iOS (light icons)
          ),
        ),
      ),
      child: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: barColor,
        title: Text(
          title != null ? title! : "",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: textColor),
        ),
        leading: leading,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(AppBar().preferredSize.width + (bottom?.preferredSize.width ?? 0), AppBar().preferredSize.height + (bottom?.preferredSize.height ?? 0));
  }
}
