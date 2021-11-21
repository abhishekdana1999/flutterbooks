import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetails extends StatefulWidget {
  final index;
  final item;
  BookDetails({Key? key, this.item, this.index}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  String description = '';
  int isLong = 100;
  @override
  void initState() {
    description = widget.item['description'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Discover your book',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
          child: Column(children: <Widget>[
            buildHeroImage(),
            SizedBox(height: 16),
            buildTitleAndRating(),
            SizedBox(height: 16),
            buildTags(),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            buildDescription(),
            SizedBox(height: 16),
            buildPurchaseButton(),
          ])),
    );
  }

  Widget buildHeroImage() {
    return Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              widget.item['color'].withOpacity(1.0),
              widget.item['color'].withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Stack(children: [
            Positioned(
              left: 80,
              bottom: 0,
              child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ])),
            ),
            Hero(
              tag: widget.index,
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.item['image_url']),
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
          ]),
        ));
  }

  Widget buildTitleAndRating() {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.item['title'],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.red[900],
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[900],
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[900],
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[900],
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.red[900],
                ),
              ],
            ),
            SizedBox(width: 16),
            Text(
              '4.5',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ],
    ));
  }

  Widget buildTags() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var category in widget.item['tags'])
              Container(
                margin: EdgeInsets.only(right: 16),
                child: Chip(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  label: Text(
                    category,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                if (isLong == 100) {
                  isLong = description.length;
                } else {
                  isLong = 100;
                }
              });
            },
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: description.toString().substring(0, isLong),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                isLong == 100
                    ? TextSpan(
                        text: '...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      )
                    : TextSpan(),
                TextSpan(
                  text: isLong == 100 ? "Read More" : "Show Less",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPurchaseButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black.withOpacity(0.75)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: RaisedButton(
        elevation: 0,
        onPressed: () {},
        color: Colors.transparent,
        child: Text(
          'Purchase',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
