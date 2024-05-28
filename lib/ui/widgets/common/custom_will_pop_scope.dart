import 'dart:io';

import 'package:flutter/material.dart';

import '../../ui_config.dart';

/// 自定義 PopScope，主要修正 ios 返回手勢無法呼叫 onWillPop 限制。如 onWillPop 沒有指定，則預設使用 Navigator.pop(context) 返回上一頁
class CustomPopScope extends StatefulWidget {
  final Widget child;
  final Future<bool> Function()? onWillPop;

  const CustomPopScope({
    super.key,
    required this.child,
    this.onWillPop,
  });

  @override
  State<StatefulWidget> createState() => _CustomPopScopeState();
}

class _CustomPopScopeState extends State<CustomPopScope> {
  bool triggerWillPop = false;
  double _panStartDx = 0.0; // 返回手勢的按下去的 x 軸位置，初始為 0

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onPanStart: (panStart) {
              triggerWillPop = false;
              _panStartDx = panStart.globalPosition.dx;
            },
            onPanUpdate: (panUpdate) {
              // print("ios onWillPop");
              if (_panStartDx < MediaQuery.of(context).size.width * 0.2 && // 手勢按下位置在螢幕的左側
                      panUpdate.delta.dx > 8 // 滑行的力道
                  ) {
                triggerWillPop = true;
              }
            },
            onPanEnd: (panEnd) async {
              // print("ios panEnd");
              if (triggerWillPop) {
                await Future.delayed(UIAnimations.clickAnimateDuration);
                widget.onWillPop!();
              }
            },
            child: PopScope(
              onPopInvoked: (_) async {},
              child: Container(
                width: MediaQuery.of(context).size.width, // 返回手勢整個螢幕都有效
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: widget.child,
              ),
            ))
        : PopScope(
            onPopInvoked: (_) async {
              // print("android onWillPop");
              await Future.delayed(UIAnimations.clickAnimateDuration);
              if (mounted) {
                widget.onWillPop != null ? widget.onWillPop!() : Navigator.pop(context);
              }
            },
            child: widget.child,
          );
  }
}
