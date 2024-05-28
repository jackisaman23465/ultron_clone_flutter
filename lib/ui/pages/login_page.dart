import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/models/system_info.dart';
import 'package:ultron_clone_flutter/ui/app_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '/ui/ui_config.dart';
import '/ui/widgets/button/outlined_elevated_button.dart';
import '/ui/widgets/button/solid_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                UIImages.appLogo,
                height: 60.w,
                width: 60.w,
              ),
            ),
          ),
          Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.75, // 佔據父容器寬度的一半
                child: SolidElevatedButton(
                  onTap: () => context.push(Routes.mainPage),
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Text('Google 登入'),
                ),
              ),
              SizedBox(height: 20.h),
              FractionallySizedBox(
                widthFactor: 0.75, // 佔據父容器寬度的一半
                child: OutlinedElevatedButton(
                  onTap: () => context.push(Routes.mainPage),
                  foregroundColor: Theme.of(context).primaryColor,
                  child: const Text('iOS 登入'),
                ),
              ),
              SizedBox(height: 20.h),
              RichText(
                text: TextSpan(
                  text: '登入即表示同意',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: <TextSpan>[
                    TextSpan(
                      text: '隱私權政策',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: UIColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://policies.wifigarden.com/zh-tw/privacy-policy"));
                        },
                    ),
                    TextSpan(
                      text: '即',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: '服務條款',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: UIColors.primaryColor, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://policies.wifigarden.com/zh-tw/terms-of-service"));
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "© 2024 Wifigarden Inc. 版權所有",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 8.h),
              Image.asset(
                UIImages.poweredByIcon,
                width: 100.w,
              ),
              SizedBox(height: 8.h),
              Text(
                'v${SystemInfo.projectVersion} (${SystemInfo.projectCode})',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ],
      ),
    );
  }
}
