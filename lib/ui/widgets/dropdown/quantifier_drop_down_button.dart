import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';
import '../form/validator/form_validation.dart';
import 'custom_drop_down_button.dart';

class QuantifierDropDownButton extends StatelessWidget {
  final List<String> options;
  final String? title;
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<FormValidation>? validators;
  final Function(bool)? onValidate;
  final String quantifier;

  const QuantifierDropDownButton({
    Key? key,
    required this.options,
    required this.onChanged,
    required this.quantifier,
    this.title,
    this.value,
    this.validators,
    this.onValidate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          child: Text(
            title ?? "",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: UIColors.normalTextColor),
          ),
        ),
        Visibility(
          visible: title != null,
          child: SizedBox(
            height: 8.sp,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomDropdownButtonFormField(
                value: value,
                options: options,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: 8.sp,
            ),
            Text(
              quantifier,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: UIColors.placeholderTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
