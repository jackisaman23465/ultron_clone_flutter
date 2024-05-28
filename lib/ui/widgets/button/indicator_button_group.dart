import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';
import 'indicator_button.dart';

class IndicatorButtonGroup extends StatelessWidget {
  final int selectedIndex;
  final List<String> options;
  final Function(int selectedIndex) onTap;

  const IndicatorButtonGroup({
    Key? key,
    required this.options,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options
          .asMap()
          .entries
          .map(
            (entry) => Column(
              children: [
                IndicatorButton(
                  label: entry.value,
                  icon: Icons.email,
                  iconColor: (selectedIndex == entry.key ? Theme.of(context).primaryColor : Colors.transparent),
                  textColor: (selectedIndex == entry.key ? Theme.of(context).primaryColor : Colors.transparent),
                  indicatorColor: (selectedIndex == entry.key ? Theme.of(context).primaryColor : Colors.transparent),
                  onTap: () {
                    if (entry.key != selectedIndex) {
                      onTap(entry.key);
                    }
                  },
                ),
                SizedBox(height: 12.sp),
              ],
            ),
          )
          .toList(),
    );
  }
}
