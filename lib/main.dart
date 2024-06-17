import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultron_clone_flutter/ui/router/app_router.dart';
import 'package:ultron_clone_flutter/ui/ui_config.dart';
import 'package:ultron_clone_flutter/ui/widgets/slider/custom_slider_shape.dart';

import 'models/system_info.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

Future setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: Colors.transparent,
    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark,
    // For Android (light icons)
    statusBarBrightness: Brightness.light, // For iOS (light icons)
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SystemInfo.ensureInitialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          title: 'Ultron clone app',
          theme: ThemeData(
            primaryColor: UIColors.primaryColor,
            primaryColorLight: UIColors.primaryColorLight,
            dialogBackgroundColor: Colors.white,
            hintColor: UIColors.placeholderTextColor,
            dividerColor: UIColors.borderColor,
            textTheme: TextTheme(
              titleMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp, color: Colors.black.withOpacity(0.75)),
              labelSmall: TextStyle(fontSize: 12.sp, color: UIColors.normalTextColor),
            ),
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: UIColors.primaryColor).copyWith(
                primary: UIColors.buttonPrimaryColor,
                secondary: UIColors.buttonSecondaryColor,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: UIColors.primaryColor).copyWith(
              background: UIColors.backgroundColor,
              surfaceVariant: Colors.transparent,
            ),
            sliderTheme: SliderThemeData(
              activeTrackColor: Colors.transparent,
              inactiveTrackColor: Colors.transparent,
              thumbColor: Colors.white,
              trackHeight: 2.h,
              trackShape: CustomSliderShape(),
            ),
            switchTheme: SwitchThemeData(),
            cardColor: Colors.white,
            cardTheme: const CardTheme(
              surfaceTintColor: Colors.white,
              color: Colors.white,
            ),
            dialogTheme: DialogTheme(
              shadowColor: UIColors.dialogBarrierColor,
            ),
            // useMaterial3: true,
          ),
        );
      },
    );
  }
}
