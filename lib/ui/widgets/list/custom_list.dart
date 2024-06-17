import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatelessWidget {
  final List<Widget> cards;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final double? itemSpacing;

  const CustomList({
    Key? key,
    required this.cards,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = true,
    this.itemSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding ?? EdgeInsets.all(16.sp),
      itemCount: cards.length,
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return cards[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return scrollDirection == Axis.vertical ? SizedBox(height: itemSpacing ?? 12.h) : SizedBox(width: itemSpacing ?? 12.w);
      },
    );
  }
}
