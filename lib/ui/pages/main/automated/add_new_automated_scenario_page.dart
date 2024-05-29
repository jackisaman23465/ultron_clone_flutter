import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/ui/widgets/card/custom_card.dart';
import 'package:ultron_clone_flutter/ui/widgets/card/task_card.dart';

import '../../../widgets/appbar/custom_app_bar.dart';

class AddNewAutomatedScenarioPage extends StatefulWidget {
  const AddNewAutomatedScenarioPage({super.key});

  @override
  State<AddNewAutomatedScenarioPage> createState() => _AddNewAutomatedScenarioPageState();
}

class _AddNewAutomatedScenarioPageState extends State<AddNewAutomatedScenarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar.back(
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: '通知',
        tintColor: Theme.of(context).buttonTheme.colorScheme?.primary,
        textColor: Colors.black,
        centerTitle: true,
        onBackPressed: () {
          context.pop();
        },
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5.h),
          child: Container(
            color: Colors.grey,
            height: 0.5.h,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(45.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TaskCard(
                  title: 'title',
                  description: 'description',
                  onTap: () {},
                  onCancel: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
