import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultron_clone_flutter/ui/widgets/card/custom_card.dart';
import 'package:ultron_clone_flutter/ui/widgets/card/task_card.dart';

import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/list/custom_list.dart';

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
        backIcon: Icons.close,
        isDarkStatusBar: true,
        barColor: Colors.transparent,
        title: '新增自動化設定',
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
      body: CustomList(
        itemSpacing: 20.h,
        cards: [
          Text(
            '請選擇自動化發生的時間或條件。',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TaskCard(
            title: '特定時間',
            description: '例如：上午 8:00 時',
          ),
          TaskCard(
            title: '感應到環境變化時',
            description: '例如：溫度超過 28 度時',
          ),
          TaskCard(
            title: '裝置狀態改變時',
            description: '例如：燈泡開啟時',
          ),
          TaskCard(
            title: '手動執行',
            description: '在手動點擊時啟動',
          ),
        ],
      ),
    );
  }
}
