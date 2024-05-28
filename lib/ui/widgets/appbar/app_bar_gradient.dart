import 'package:flutter/material.dart';

import '../../ui_config.dart';

class AppBarGradient extends StatelessWidget implements PreferredSizeWidget {
  final int leadingStyle;
  final String? leadingText;
  final dynamic leadingResult;
  final String appBarTitle;
  final double height;
  final List<Widget> actionWidgets;

  const AppBarGradient({super.key,
    this.leadingStyle = 0,
    this.leadingText,
    this.leadingResult,
    this.appBarTitle = 'default title',
    this.height = 50.0,
    this.actionWidgets = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity,double.infinity),
      child: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        titleSpacing: 10,
        title: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
                children: <Widget>[
                  Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(appBarTitle,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          )
                      )
                  ),
                  Positioned(
                    left: -1,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {Navigator.pop(context, leadingResult);},
                      child: Row(
                        children:
                        (leadingStyle == 0) ? <Widget>[] : // 0: no icon or text
                        (leadingStyle == 1) ? <Widget>[ // 1: only icon
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 50,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 24,
                            ),
                          )
                        ] : <Widget>[ // 2: icon with text
                          const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                          Text(
                            leadingText ?? "",
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actionWidgets,
                    )
                  )
                ]
            )
        )

//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children: <Widget>[
//            Container(
//              width: ScreenUtil().setSp(MediaQuery.of(context).size.width * 0.3),
//              child: InkWell(
//                onTap: () {Navigator.pop(context);},
//                child: Row(
//                  children:
//                  (leadingStyle == 0) ? <Widget>[] : // 0: no icon or text
//                  (leadingStyle == 1) ? <Widget>[ // 1: only icon
//                    Icon(
//                      Icons.arrow_back_ios,
//                      color: Colors.white,
//                    ),
//                  ] : <Widget>[ // 2: icon with text
//                    Icon(
//                      Icons.arrow_back_ios,
//                      color: Colors.white,
//                    ),
//                    Text(
//                      leadingText ?? LocaleKeys.app_appBar_backHome.tr(),
//                      style: TextStyle(
//                        fontSize: ScreenUtil().setSp(17),
//                        color: Colors.white,
//                      ),
//                      maxLines: 1,
//                      overflow: TextOverflow.ellipsis,
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            Container(
//              width: ScreenUtil().setSp(MediaQuery.of(context).size.width * 0.3),
//              child: Text(
//                appBarTitle,
//                style: TextStyle(
//                  fontSize: ScreenUtil().setSp(18),
//                ),
//                textAlign: TextAlign.center,
//              ),
//            ),
//            Container(
//              width: ScreenUtil().setSp(MediaQuery.of(context).size.width * 0.3),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: (actionWidgets == null) ? <Widget>[] : actionWidgets,
//              ),
//            ),
//          ],
//        )
        ,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors:[
                  Color.fromARGB(0xFF, 0x0B, 0x9C, 0xA3),
                  Color.fromARGB(0xFF, 0x61, 0xDA, 0xC3),
                  Color.fromARGB(0xFF, 0xF6, 0xF3, 0xEE),
                ],
                stops: [0.0, 0.8, 1.1],
              )
          ),
        ),
        bottomOpacity:0,
        automaticallyImplyLeading: false,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }
}