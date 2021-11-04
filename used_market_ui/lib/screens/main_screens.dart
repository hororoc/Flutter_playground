// IndexedStack, BottomNavigation 위젯을 가지는 파일

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:used_market_ui/screens/chat/chat_screen.dart';
import 'package:used_market_ui/screens/heighborhood_life/neighborhood_life_screen.dart';
import 'package:used_market_ui/screens/home/home_screen.dart';
import 'package:used_market_ui/screens/my_page/my_page_screen.dart';
import 'package:used_market_ui/screens/near_me/near_me_screen.dart';

class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          NeighbothoodLifeScreen(),
          NearMeScreen(),
          ChatScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: '동네 생활',
            icon: Icon(CupertinoIcons.square_on_square),
          ),
          BottomNavigationBarItem(
            label: '내 근처',
            icon: Icon(CupertinoIcons.placemark),
          ),
          BottomNavigationBarItem(
            label: '채팅',
            icon: Icon(CupertinoIcons.chat_bubble),
          ),
          BottomNavigationBarItem(
            label: '나의 정보',
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
