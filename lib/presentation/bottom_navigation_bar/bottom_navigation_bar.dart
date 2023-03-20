import 'package:binance_test/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_colors.dart';
import '../main_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int initialIndex = 0;

  void selectedTab(int index) {
    if (initialIndex == index) {
      navigatorKeyList[index].currentState?.popUntil((route) {
        return route.isFirst;
      });
    }
    setState(() {
      initialIndex = index;
    });
  }

  var navigatorKeyList = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isfirstRouteinCurrentTab =
            !await navigatorKeyList[initialIndex].currentState!.maybePop();
        return isfirstRouteinCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          height: 83,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: AppColors.boxesBackgroundColor, width: 0.5))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: AppColors.greyDigitsColor,
            // margin:
            //     EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w, top: 8.h),
            currentIndex: initialIndex,
            backgroundColor: AppColors.bottomNavBarColor,
            fixedColor: Colors.white,
            // selectedBackgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(AppImages.house,
                      color: svgColorSelector(0)),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Markets',
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(AppImages.statistics,
                      color: svgColorSelector(1)),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Trade',
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(AppImages.union,
                      color: svgColorSelector(2)),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Assets',
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(AppImages.wallet,
                      color: svgColorSelector(3)),
                ),
              ),
            ],
            onTap: selectedTab,
          ),
        ),
        body: IndexedStack(index: initialIndex, children: [
          const MainScreen(),
          const MainScreen(),
          const MainScreen(),
          const MainScreen()
        ]),
      ),
    );
  }

  Color svgColorSelector(int index) {
    return initialIndex == index
        ? AppColors.selecteditembottomNavBarColor
        : AppColors.unSelecteditembottomNavBarColor;
  }
}
