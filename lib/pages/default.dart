import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../pages/firstPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  activeColor: Colors.lightBlue),
              BottomNavyBarItem(
                  icon: Icon(Icons.scanner),
                  title: Text("Scan"),
                  activeColor: Colors.deepOrange),
              BottomNavyBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text("Favorite"),
                  activeColor: Colors.lightGreen),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  activeColor: Colors.lightBlue),
            ],
          ),
          body: Container(
            height: double.infinity,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                FirstPage(),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
