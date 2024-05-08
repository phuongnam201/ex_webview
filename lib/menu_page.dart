import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:webview_study/home_page.dart';
import 'package:webview_study/my_widget.dart';
import 'package:webview_study/webview.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final _controller = PersistentTabController(initialIndex: 0);
  bool _isTabSelected = false;

  void _handleTabChange(int index) {
    setState(() {
      _isTabSelected = index == 0; // Chec k if VR360WebView tab is selected
    });
    print(_isTabSelected);
  }

  List<Widget> pages() {
    return [
      HomePage(), // You need to import and replace HomePage() and VR360WebView()
      MyWidget(), // You need to import and replace HomePage() and VR360WebView()
      Vr360Page(), // with actual widgets or other available widgets
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "home",
      inactiveIcon:
          Icon(Icons.home, color: Colors.grey), // Using grey as an example
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "home",
      inactiveIcon:
          Icon(Icons.home, color: Colors.grey), // Using grey as an example
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.image), // You can replace with any available icon
      title: "vr360", // Assuming you have this translation key
      inactiveIcon:
          Icon(Icons.image, color: Colors.grey), // Using grey as an example
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: pages(),
        items: _navBarItems,
        resizeToAvoidBottomInset: true,
        navBarStyle: NavBarStyle.style3,
        backgroundColor: Colors.white,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        onItemSelected: _handleTabChange,
      ),
    );
  }
}
