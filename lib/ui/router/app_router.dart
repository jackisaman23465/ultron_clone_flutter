import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/bloc/main_cubit.dart';
import 'package:ultron_clone_flutter/ui/pages/main/automated/add_new_automated_scenario_page.dart';
import 'package:ultron_clone_flutter/ui/pages/notification_page.dart';
import 'package:ultron_clone_flutter/ui/pages/qrcode_scan_page.dart';
import 'package:ultron_clone_flutter/ui/pages/setting_page.dart';
import 'package:ultron_clone_flutter/ui/router/animation/FadeTransitionPage.dart';

import '../pages/main_page.dart';
import '../pages/onboarding_page.dart';
import '../pages/login_page.dart';
import 'animation/SlideTransitionPage.dart';

class Routes {
  static String onBoardingPage = '/onboarding';
  static String loginPage = '/login';
  static String mainPage = '/main';
  static String notificationPage = '/notification';
  static String settingPage = '/setting';
  static String qrcodeScanPage = '/qrcodeScan';
  static String addAutomatedScenarioPage = '/addAutomatedScenario';
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
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            child: const OnboardingPage(),
          );
        },
      ),
      GoRoute(
        path: Routes.loginPage,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const LoginPage(),
            direction: SlideDirection.rtl,
          );
        },
      ),
      GoRoute(
        path: Routes.mainPage,
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            child: BlocProvider(
              create: (_) => MainCubit(),
              child: const MainPage(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.notificationPage,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const NotificationPage(),
            direction: SlideDirection.rtl,
          );
        },
      ),
      GoRoute(
        path: Routes.settingPage,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const SettingPage(),
            direction: SlideDirection.rtl,
          );
        },
      ),
      GoRoute(
        path: Routes.qrcodeScanPage,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const QRCodeScanPage(),
            direction: SlideDirection.btt,
          );
        },
      ),
      GoRoute(
        path: Routes.addAutomatedScenarioPage,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const AddNewAutomatedScenarioPage(),
            direction: SlideDirection.btt,
          );
        },
      ),
    ],
  );
}
