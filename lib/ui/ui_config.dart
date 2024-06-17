import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIColors{
  static const primaryColor = Color(0xff0C243F);
  static const primaryColorLight = Color(0xff2162AB);
  static const backgroundColor = Color(0xffF6F7F9);
  static const dialogBarrierColor = Color(0x88000000);
  static const buttonPrimaryColor = Color(0xff009EBE);
  static const buttonSecondaryColor = Color(0xffE0E0E0);
  static const borderColor = Color(0xFFE0E0E0);
  static const errorColor = Color(0xFFEF655D);
  static const disabledColor = Color(0x40000000);
  static const normalTextColor = Color(0xff858585);
  static const placeholderTextColor = Color(0x70000000);
}

class UIImages{
  static String appLogo = 'assets/images/app_images/app_logo.png';
  static String appBackground = 'assets/images/app_images/app_background.png';
  static String poweredByIcon = 'assets/images/app_images/powered_by_icon.png';
  static String banner = 'assets/images/app_images/banner.png';
  static String qrcodeBackground = 'assets/images/app_images/qrcode_background.png';

  static String onboarding1 = 'assets/images/onboarding_images/onboarding_1.png';
  static String onboarding2 = 'assets/images/onboarding_images/onboarding_2.png';
  static String onboarding3 = 'assets/images/onboarding_images/onboarding_3.png';
  static String onboarding4 = 'assets/images/onboarding_images/onboarding_4.png';
  static String onboarding5 = 'assets/images/onboarding_images/onboarding_5.png';
  static String onboarding6 = 'assets/images/onboarding_images/onboarding_6.png';
  static String onboarding7 = 'assets/images/onboarding_images/onboarding_7.png';
}

class UIAnimations{
  static const Duration animateDuration = Duration(milliseconds: 250);
  static const Duration clickAnimateDuration = Duration(milliseconds: 0);
}

class UIThemes{
  static AppBarTheme appBarThemeData = AppBarTheme(
    elevation: 0.sp,
    centerTitle: false,
    backgroundColor: UIColors.primaryColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.transparent,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light,
      // For Android (light icons)
      statusBarBrightness: Brightness.dark, // For iOS (light icons)
    ),
  );

  static InputDecorationTheme inputThemeData = InputDecorationTheme(
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8.sp),
    //   borderSide: BorderSide(color: AppColor.primaryColor600,width: 2.sp),
    // ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.only(top: 12.sp, bottom: 12.sp, right: 12.sp),
    prefixStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    errorStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: UIColors.errorColor,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: UIColors.borderColor, width: 2.sp),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: UIColors.borderColor, width: 2.sp),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.sp)),
      borderSide: BorderSide(color: UIColors.primaryColor, width: 2.sp),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(color: UIColors.errorColor, width: 2.sp),
    ),
    // focusedErrorBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8.sp),
    //   borderSide: BorderSide(color: AppColor.primaryColor600, width: 2.sp),
    // ),
  );

  static RadioThemeData radioThemeData = RadioThemeData(
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
    fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return UIColors.primaryColor;
        }
        return UIColors.buttonSecondaryColor; // 默認顏色
      },
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      splashFactory: InkRipple.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return UIColors.primaryColor.withOpacity(0.25); // 默認顏色
        },
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  );

  static ButtonThemeData buttonThemeData = const ButtonThemeData(
    alignedDropdown: true,
  );

  static TextSelectionThemeData textSelectionThemeData = const TextSelectionThemeData(
    cursorColor: UIColors.primaryColor,
    selectionHandleColor: UIColors.primaryColor,
  );

  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        return UIColors.primaryColor;
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.sp),
    ),
  );

  static FloatingActionButtonThemeData floatingActionButtonThemeData = FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.sp),
    ),
    backgroundColor: UIColors.primaryColor,
  );

  static PopupMenuThemeData popupMenuThemeData = PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ExpansionTileThemeData expansionTileThemeData = ExpansionTileThemeData(
    tilePadding: EdgeInsets.all(16.sp),
    collapsedIconColor: Colors.transparent,
    iconColor: Colors.transparent,
  );
}