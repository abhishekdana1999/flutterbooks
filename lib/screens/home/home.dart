import 'package:flutter/material.dart';
import 'package:flutterbooks/screens/home/components/bookslist.dart';
import 'package:flutterbooks/screens/home/components/categories.dart';
import 'package:flutterbooks/widgets/header/header.dart';

import 'components/searchBook.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            HeaderWidget(),
            SearchBook(),
            Categories(),
            BooksList(),
          ],
        ),
      ),
    );
  }
}
