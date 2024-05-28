import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/bloc/main_cubit.dart';
import 'package:ultron_clone_flutter/ui/pages/notification_page.dart';
import 'package:ultron_clone_flutter/ui/pages/qrcode_scan_page.dart';
import 'package:ultron_clone_flutter/ui/pages/setting_page.dart';

import 'pages/main_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/login_page.dart';

class Routes {
  static String onBoardingPage = '/onboarding';
  static String loginPage = '/login';
  static String mainPage = '/main';
  static String notificationPage = '/notification';
  static String settingPage = '/setting';
  static String qrcodeScanPage = '/qrcodeScan';
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.onBoardingPage,
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => Routes.mainPage,
      ),
      GoRoute(
        path: Routes.onBoardingPage,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: Routes.loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.mainPage,
        builder: (context, state) => BlocProvider(
          create: (_) => MainCubit(),
          child: const MainPage(),
        ),
      ),
      GoRoute(
        path: Routes.notificationPage,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: Routes.settingPage,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: Routes.qrcodeScanPage,
        builder: (context, state) => const QRCodeScanPage(),
      ),
    ],
  );
}
