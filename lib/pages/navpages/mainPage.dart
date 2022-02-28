import 'dart:io';

import 'package:efficientpos/pages/navpages/CartPage.dart';
import 'package:efficientpos/pages/navpages/Favourite.dart';
import 'package:efficientpos/pages/navpages/MePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final PageController _pageController = PageController();
  List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    const Favourite(),
    const MePage()
  ];
  int currentIndex = 0;

  void onTabTap(int index) {
    _pageController.jumpToPage(index);
  }
  bool onTabTapBool(int index) {
    setState(() {

    });
    _pageController.jumpToPage(0);
    return false;
  }

  void onPagechange(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  Future<bool> _onWillPop() async {
    return  currentIndex==0?(await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: const Text('Yes'),
          ),
        ],
      ),
    )):onTabTapBool(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: const Drawer(
          child: Text(
            "Hello World",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        backgroundColor: Colors.white,
        body: PageView(
          controller: _pageController,
          children: pages,
          onPageChanged: onPagechange,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
/*        backgroundColor: Colors.green,*/
              type: BottomNavigationBarType.fixed,
              onTap: onTabTap,
              currentIndex: currentIndex,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black54.withOpacity(0.1),
              items: const [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Cart", icon: Icon(Icons.shopping_cart)),
                BottomNavigationBarItem(
                    label: "Favourite", icon: Icon(Icons.favorite)),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
