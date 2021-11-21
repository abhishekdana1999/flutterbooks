import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.grid_view_outlined),
            onPressed: () {},
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://instagram.fdel42-1.fna.fbcdn.net/v/t51.2885-19/s150x150/245694017_158753713135723_4326979280419411339_n.jpg?_nc_ht=instagram.fdel42-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=x90j7FcJ734AX9ZIe9U&edm=ACWDqb8BAAAA&ccb=7-4&oh=b574cc503efa76bed04c4b64a82f04b1&oe=619F5350&_nc_sid=1527a3"),
            ),
          ),
        ],
      ),
    );
  }
}
