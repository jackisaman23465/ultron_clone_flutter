import 'package:flutter/services.dart';

class LimitZeroStartTextFormatter extends TextInputFormatter {
  int limit = 1; // 只允許一個零

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    print(newValue.text);
    if(RegExp(r'^\d*').hasMatch(newValue.text)){
    // if(RegExp(r'^0').hasMatch(newValue.text)){
      print(true);
      return newValue;
    }else{
      return oldValue;
    }
    // 如果新值和舊值相同，不需要處理
    if (newValue.text == oldValue.text) {
      return newValue;
    }
    // 檢查新值是否以零開頭
    if (newValue.text.startsWith('0')) {
      // 如果以零開頭，檢查是否已經有限制的數量
      var count = '0'.allMatches(newValue.text.split(".")[0]).length;
      if (count > limit) {
        // 如果超過限制，不接受新值
        return oldValue;
      }
    }
    return newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}