import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ItemBuilder = Widget Function(BuildContext context, FloatingNavigationBarItem items);

class FloatingNavigationBar extends StatefulWidget {
  final List<FloatingNavigationBarItem> items;
  final int currentIndex;
  final void Function(int val) onTap;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double? fontSize;
  final double? iconSize;
  final double? itemBorderRadius;
  final double? borderRadius;
  final double? bottomPadding;
  final ItemBuilder? itemBuilder;

  FloatingNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    ItemBuilder? itemBuilder,
    this.backgroundColor = Colors.black,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.iconSize, // default 30
    this.fontSize, // default 11
    this.borderRadius, // default 15
    this.bottomPadding, // default 20
    this.itemBorderRadius, // default 8
    this.unselectedItemColor = Colors.white,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius ?? 15.sp,
              fontSize: fontSize ?? 11.sp,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize ?? 30.sp,
              itemBorderRadius: itemBorderRadius ?? 8.sp,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
            ),
        super(key: key);

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  List<FloatingNavigationBarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 0.sp),
            child: Container(
              padding: EdgeInsets.only(bottom: 0.sp, top: 0.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 15.sp),
                color: widget.backgroundColor,
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: items.map((f) {
                    return widget.itemBuilder!(context, f);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  required Function(int val) onTap,
  List<FloatingNavigationBarItem>? items,
  int? currentIndex,
  Color? selectedBackgroundColor,
  Color? selectedItemColor,
  Color? unselectedItemColor,
  Color? backgroundColor,
  double? fontSize,
  double? iconSize,
  double? itemBorderRadius, // default 10
  double? borderRadius,
}) {
  return (BuildContext context, FloatingNavigationBarItem item) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(color: currentIndex == items?.indexOf(item) ? selectedBackgroundColor : backgroundColor, borderRadius: BorderRadius.circular(itemBorderRadius ?? 10.sp)),
              child: InkWell(
                onTap: () {
                  onTap(items.indexOf(item));
                },
                borderRadius: BorderRadius.circular(8.sp),
                child: Container(
                  //max-width for each item
                  //24 is the padding from left and right
                  width: MediaQuery.of(context).size.width * (100 / (items!.length * 100)) - 24,
                  padding: EdgeInsets.all(2.sp),
                  child: badges.Badge(
                    showBadge: item.unreadNumber > 0,
                    badgeContent: Text(
                      item.unreadNumber.toString(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    badgeStyle: badges.BadgeStyle(
                      padding: EdgeInsets.all(6.sp),
                      badgeColor: Theme.of(context).primaryColor,
                    ),
                    position: badges.BadgePosition.topEnd(top: -5.0.sp, end: 0.0.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          item.iconUrl,
                          color: currentIndex == items.indexOf(item) ? selectedItemColor : unselectedItemColor,
                          width: 30.sp,
                          height: 30.sp,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 2.sp)),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: currentIndex == items.indexOf(item) ? selectedItemColor : unselectedItemColor,
                            fontSize: fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class FloatingNavigationBarItem {
  final String title;
  final String iconUrl;
  final int unreadNumber;
  final Widget customWidget;

  FloatingNavigationBarItem({
    required this.iconUrl,
    required this.title,
    required this.unreadNumber,
    this.customWidget = const SizedBox(),
  });
}
