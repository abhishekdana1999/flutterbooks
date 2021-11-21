import 'package:flutter/material.dart';

class SearchBook extends StatelessWidget {
  const SearchBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                  hintText: 'Search for your book here',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ));
  }
}
