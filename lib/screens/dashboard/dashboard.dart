import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbooks/screens/explore/explore.dart';
import 'package:flutterbooks/screens/home/home.dart';
import 'package:flutterbooks/screens/notification/notification.dart';
import 'package:flutterbooks/screens/profile/profile.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _screen = HomeScreen();
  Color backgroundColor = Colors.indigo;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: _screen,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ClipRRect(
            // borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          selectedFontSize: 10,
          unselectedFontSize: 8,
          iconSize: 20,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              if (currentIndex == 0) {
                _screen = HomeScreen();
                backgroundColor = Colors.indigo;
              } else if (currentIndex == 1) {
                _screen = ExploreScreen();
                backgroundColor = Colors.amber;
              } else if (currentIndex == 2) {
                _screen = NotificationScreen();
                backgroundColor = Colors.green;
              } else {
                _screen = ProfileScreen();
                backgroundColor = Colors.purple;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              title: Text(
                'HOME',
                style: TextStyle(),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('EXPLORE'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('FAVORITE'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('PROFILE'),
            )
          ],
        )),
      ),
    );
  }
}
