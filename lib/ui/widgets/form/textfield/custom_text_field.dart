import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../ui_config.dart';
import '../validator/form_validation.dart';

///表單欄位：含標題的文字輸入欄位 (可加入驗證)
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final TextInputType inputType;
  final bool isPassword;
  final int maxLines;
  final TextInputAction? textInputAction;
  final List<FormValidation>? validators;
  final Function(bool)? onValidate;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.title,
    this.hint,
    this.inputType = TextInputType.text,
    this.textInputAction,
    this.isPassword = false,
    this.maxLines = 1,
    this.validators,
    this.onValidate,
    this.autofocus = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  late bool passwordVisible;

  @override
  void initState() {
    super.initState();
    if(widget.isPassword) {
      passwordVisible = false;
    }else{
      passwordVisible = true;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: widget.title != null,
          child: Container(
            padding: EdgeInsets.only(bottom: 8.sp),
            child: Text(
              widget.title ?? "",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: UIColors.normalTextColor),
            ),
          ),
        ),
        Theme(
          data: ThemeData(
            inputDecorationTheme: UIThemes.inputThemeData,
          ),
          child: TextFormField(
            autofocus: widget.autofocus,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ) : null,
              prefixText: "    ",
              hintText: widget.hint,
              hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: UIColors.placeholderTextColor),
            ),
            obscureText: !passwordVisible,
            textInputAction: widget.textInputAction,
            keyboardType: widget.inputType,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: UIColors.normalTextColor),
            controller: widget.controller,
            validator: (value) {
              if (widget.validators != null) {
                for (var validator in widget.validators!) {
                  bool isValid = validator.validator.validate(value);
                  if (!isValid) {
                    //驗證方法失敗回傳false
                    if (widget.onValidate != null) {
                      widget.onValidate!(false);
                    }
                    return validator.errorString;
                  }
                }
                //所有驗證都結束後回傳true
                if (widget.onValidate != null) {
                  widget.onValidate!(true);
                }
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
