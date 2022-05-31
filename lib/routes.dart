import 'package:aqyr/consts/theme.dart';
import 'package:aqyr/pages/notifications.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pages/home.dart';
import 'pages/menu.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List? _pages;

  // var _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      Home(),
      Menu(),
      Notifications(),
    ];

    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: .7),
        )),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 24,
          onTap: _selectedPage,
          backgroundColor: Apptheme.black,
          unselectedItemColor: Theme.of(context).textSelectionTheme.cursorColor,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/menu.svg'),
              tooltip: 'Feeds',
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                alignment: Alignment.topRight,
                position: BadgePosition(top: -7, end: -5),
                badgeContent: Text(
                  '2',
                  style: TextStyle(color: Apptheme.white),
                ),
                child: SvgPicture.asset('assets/icons/notification.svg'),
              ),
              tooltip: 'Cart',
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
