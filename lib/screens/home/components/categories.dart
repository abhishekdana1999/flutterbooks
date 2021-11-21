import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> _categories = [
    'Action',
    'Adventure',
    'Comedy',
    'Crime',
    'Drama',
    'Fantasy',
    'Historical',
    'Horror',
    'Mystery',
    'Romance',
    'Science Fiction',
    'Thriller',
    'Western',
  ];

  String selected = 'Action';
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var category in _categories)
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = category;
                          });
                        },
                        child: Chip(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          label: Text(
                            category,
                            style: TextStyle(
                                color: selected == category
                                    ? Colors.white
                                    : Colors.black54),
                          ),
                          backgroundColor: selected == category
                              ? Colors.black
                              : Colors.grey[300],
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ));
  }
}
