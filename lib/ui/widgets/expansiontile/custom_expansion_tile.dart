import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui_config.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Color? backgroundColor;
  final bool initiallyExpanded;
  final Function(bool)? onExpansionChanged;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.children,
    this.backgroundColor,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> with TickerProviderStateMixin {
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _quarterTween = Tween<double>(begin: 0.0, end: 0.25); //旋轉90度
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = _controller.drive(_quarterTween.chain(_easeInTween));
    //初始化為展開狀態，執行動畫
    if (widget.initiallyExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        //消除頂部分隔線，但會導致widget內部的子widget divider color同受影響，子widget需要在設定divider color
        dividerColor: Colors.transparent,
        expansionTileTheme: UIThemes.expansionTileThemeData.copyWith(backgroundColor: widget.backgroundColor ?? Colors.transparent),
      ),
      child: ExpansionTile(
        initiallyExpanded: widget.initiallyExpanded,
        childrenPadding: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 16.sp),
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          if (widget.onExpansionChanged != null) {
            widget.onExpansionChanged!(isExpanded);
          }
        },
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: _animation,
              child: Image.asset(
                'assets/images/icon_collapse.png',
                width: 20.sp,
                height: 20.sp,
              ),
            ),
            SizedBox(width: 10.sp), // 设置前导 Widget 和标题之间的间距
            Text(
              widget.title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: UIColors.normalTextColor),
            ),
          ],
        ),
        children: widget.children,
      ),
    );
  }
}
