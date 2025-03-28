import 'package:flutter/material.dart';
import 'package:lyra/navigator/tab_navigator.dart';
import 'package:lyra/rdb/home_rdb.dart';

class CustomNavigatorHome extends StatefulWidget {
  const CustomNavigatorHome({Key? key}) : super(key: key);
  @override
  State<CustomNavigatorHome> createState() => _CustomNavigatorHome();
}

class _CustomNavigatorHome extends State<CustomNavigatorHome> {
  String _currentPage = "rdb";
  List<String> pageKeys = ["rdb", "gla", "lesson", "about"];
  // ignore: prefer_final_fields
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "rdb": GlobalKey<NavigatorState>(),
    "gla": GlobalKey<NavigatorState>(),
    "lesson": GlobalKey<NavigatorState>(),
    "about": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;  

  void _selectTab(String tabItem, int index) {
    RdbPage();
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
        body: Stack(
          //"rdb", "gla", "lesson", "about"
          children: <Widget>[
            _buildOffstageNavigator("rdb"),
            _buildOffstageNavigator("gla"),
            _buildOffstageNavigator("lesson"),
            _buildOffstageNavigator("about"),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
            RdbPage();
          },
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Rodobe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Gala',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Lesona',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'LYRA?',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
        offstage: _currentPage != tabItem,
        child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem]!,
          tabItem: tabItem,
        ));
  }
}
