import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ui_config.dart';
import '../validator/form_validation.dart';
import 'custom_text_field.dart';

class QuantifierTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final TextInputType inputType;
  final List<FormValidation>? validators;
  final Function(bool)? onValidate;
  final String quantifier;
  final List<TextInputFormatter>? inputFormatters;

  const QuantifierTextField({
    Key? key,
    required this.controller,
    required this.quantifier,
    this.title,
    this.inputType = TextInputType.number,
    this.validators,
    this.onValidate,
    this.inputFormatters,
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
          child: SizedBox(height: 8.sp),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: controller,
                inputFormatters: inputFormatters,
                inputType: inputType,
                validators: validators,
                onValidate: onValidate,
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
