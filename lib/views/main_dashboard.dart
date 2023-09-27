import 'package:flutter/material.dart';
import 'package:restaurant_vlog/globals/utils.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
// import 'about_me.dart';
import 'contact_us.dart';

import 'home_page.dart';
// import 'my_portfolio.dart';
import 'food_menu_page.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  //
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'Menu',
    // 'Food List',
    // 'Portfolio',
    'Contact',
  ];

  var menuIndex = 0;

  final screensList = const <Widget>[
    HomePage(),
    // MenuScreen(),
    MyFoodList(),
    ContactUs(),
  ];
//
  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  final yourScrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor, //scaffold&appbar dono ko same bgcolor
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 90, //appbar ki height
        titleSpacing: 40,
        elevation: 0,

        title: LayoutBuilder(
          //responsive layouts ke liye LayoutBuilder used, its for constraints.maxwidth<768
          //iski jgh mediaquery bhi use kr sakte the
          builder: (context, constraints) {
            // MOBILE VIEW
            if (constraints.maxWidth < 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Text(
                        'SHREE RADHA MADHAV RASOI',
                        style: TextStyle(fontSize: size.width < 500 ? 12 : 16),
                      )),
                      const Flexible(child: Text('श्री राधा माधव रसोई')),
                    ],
                  ),
                  const Spacer(), //! Spacer is an expanded spacing ! 😎
                  PopupMenuButton(
                    // ! PopupMenuButton is very good/imp button
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: AppColors.white,
                    ),
                    color: AppColors.bgColor2, //bg of opened popupMenuButton
                    position: PopupMenuPosition.under, //position of opened one
                    constraints:
                        BoxConstraints.tightFor(width: size.width * 0.9),
                    itemBuilder: (BuildContext context) => menuItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                            textStyle: AppTextStyles.headerTextStyle(),
                            onTap: () {
                              scrollTo(index: e.key);
                            },
                            child: Text(e.value),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('SHREE RADHA MADHAV RASOI'),
                      Text('श्री राधा माधव रसोई'),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      controller: yourScrollController,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, child) =>
                          Constants.sizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            scrollTo(index: index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          //! BELOW onHover is a property of inkwell and is easy and is used just for Hover effect animation
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                menuIndex = index;
                              } else {
                                menuIndex = 0;
                              }
                            });
                          },
                          child: buildNavBarAnimatedContainer(
                              index, menuIndex == index ? true : false),
                          //this is animatedText if (menuIndex == index) hoga to white color dihega
                          // iska fn neeche bana rkha h
                        );
                      },
                    ),
                  ),
                  Constants.sizedBox(width: 30),
                ],
              );
            }
          },
        ),
      ),
      //
      floatingActionButton: FloatingActionButton.extended(
          autofocus: true,
          elevation: 15,
          icon: const Icon(
            Icons.call,
            size: 32,
            color: Colors.green,
          ),
          focusColor: Colors.redAccent,
          onPressed: () {
            copyToClipboard(context, "8707725715");
            customSnackBar(context: context, content: "Phone No Copied");
          },
          label: const Text(
            "  Call Now\n(+91) 8707725715 ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
      //
      body: Scrollbar(
        // rightmost side me ek scrollbar h to scroll
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 8,
        interactive: true,
        controller: yourScrollController,
        child: ScrollablePositionedList.builder(
          itemCount: screensList.length,
          itemScrollController: _itemScrollController,
          itemPositionsListener: itemPositionsListener,
          scrollOffsetListener: scrollOffsetListener,
          itemBuilder: (context, index) {
            return screensList[index];
          },
        ),
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
            color: hover ? AppColors.themeColor : AppColors.white),
      ),
    );
  }
}
