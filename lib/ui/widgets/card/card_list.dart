import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardList extends StatelessWidget {
  final List<Widget> cards;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final bool shrinkWrap;

  const CardList({
    Key? key,
    required this.cards,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = true,
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
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 4.sp
      ),
    );
  }
}
