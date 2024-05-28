import 'package:flutter/material.dart';

import '../../ui_config.dart';

enum AnimationType{
  slide,
  fade,
}

class CustomDialog {
  final BuildContext context;
  final Duration animationDuration;
  final AnimationType animationType;
  final bool isOverlayTapDismiss;
  final Color? overlayColor;
  final BoxConstraints? constraints;
  final bool hasReverseAnimate;
  final Widget child;

  CustomDialog({
    required this.context,
    required this.child,
    this.animationType = AnimationType.slide,
    this.animationDuration = const Duration(milliseconds: 700),
    this.isOverlayTapDismiss = false,
    this.overlayColor,
    this.hasReverseAnimate = true,
    this.constraints,
  });

  Future<bool?> show() async {
    return await showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return _buildDialog();
      },
      barrierDismissible: isOverlayTapDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: overlayColor ?? Theme.of(context).dialogBackgroundColor,
      transitionDuration: animationDuration,
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        Widget transition;
        var curvedAnimation = (hasReverseAnimate)
            ? CurvedAnimation(parent: animation, curve: Curves.easeOutExpo, reverseCurve: Curves.easeInOutCubic)
            : CurvedAnimation(parent: animation, curve: Curves.easeOutExpo);

        switch(animationType){
          case AnimationType.slide:
            var tween = Tween(begin: const Offset(0.0, -1.0), end: Offset.zero);
            transition = SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
            break;
          case AnimationType.fade:
            var tween = Tween(begin: 0.0, end: 1.0);
            transition = FadeTransition(
              opacity: tween.animate(curvedAnimation),
              child: child,
            );
            break;
        }

        return transition;
      },
    );
  }

  Widget _buildDialog() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: ConstrainedBox(
        constraints: constraints ?? const BoxConstraints.expand(width: double.infinity, height: double.infinity),
        child: child,
      ),
    );
  }
}
