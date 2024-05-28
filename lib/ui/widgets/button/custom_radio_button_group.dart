import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';

class RadioButtonDataModel<T> {
  String name;
  T value;

  RadioButtonDataModel({
    required this.name,
    required this.value,
  });
}

class CustomRadioButtonGroup<T> extends StatelessWidget {
  final String? title;
  final List<RadioButtonDataModel<T>> groupValues;
  final T? selectedValue;
  final Function(T?) onChanged;

  const CustomRadioButtonGroup({
    Key? key,
    required this.groupValues,
    required this.selectedValue,
    required this.onChanged,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          child: Column(
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.sp),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: groupValues.map((model) {
                return GestureDetector(
                  onTap: () {
                    onChanged(model.value);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<T?>(
                        value: model.value,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          onChanged(value);
                        },
                      ),
                      Container(
                        width: 12.sp,
                        color: Colors.transparent,
                      ),
                      Text(
                        model.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Visibility(
                        visible: groupValues.indexOf(model) != groupValues.length - 1,
                        child: SizedBox(width: 32.sp),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
