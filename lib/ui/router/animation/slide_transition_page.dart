import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui_config.dart';

typedef TransitionsBuilder = Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child);

enum SlideDirection {
  ttb,
  btt,
  ltr,
  rtl,
}

class SlideTransitionPage extends CustomTransitionPage {
  final SlideDirection direction;

  SlideTransitionPage({
    required Widget child,
    this.direction = SlideDirection.btt,
  }) : super(
          child: child,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return Container();
          },
          transitionDuration: UIAnimations.animateDuration,
        );

  @override
  TransitionsBuilder get transitionsBuilder {
    return buildTransitionsBuilder();
  }

  TransitionsBuilder buildTransitionsBuilder() {
    Tween<Offset> offsetTween;
    switch (direction) {
      case SlideDirection.ttb:
        offsetTween = Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        );
        break;
      case SlideDirection.btt:
        offsetTween = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        );
        break;
      case SlideDirection.ltr:
        offsetTween = Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        );
        break;
      case SlideDirection.rtl:
        offsetTween = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        );
        break;
    }
    return (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return SlideTransition(
        position: offsetTween.animate(
          CurvedAnimation(
            curve: Curves.easeInOutCirc, // 如有需要，指定曲線
            parent: animation,
          ),
        ),
        child: child,
      );
    };
  }
}
