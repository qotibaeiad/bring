import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:bring/class/Dimension.dart';
import 'package:bring/class/Item.dart';
import 'package:flutter/material.dart';

//ItemPage
//  final String item;

class ItemPage extends StatefulWidget {
  final Item item;
  final List<Item> items;
  const ItemPage({super.key, required this.item, required this.items});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String quantity = "1";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(Dimension.defaultPadding),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimension.defaultFontSize * 2),
                topLeft: Radius.circular(Dimension.defaultFontSize * 2)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 6,
                  offset: Offset(0, -6),
                  blurRadius: 1,
                  color: Colors.white),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      updateQuantity(-1);
                    },
                  ),
                  Text(
                    quantity,
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      updateQuantity(1);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(Dimension.defaultPadding * 1.4),
                child: Container(
                  width: Dimension.screenWidth(context) * 0.4,
                  height: Dimension.screenHeight(context) * 0.08,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimension.defaultFontSize * 2),
                      color: Colors.brown[300],
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                            color: Colors.black)
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimension.defaultPadding * 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: Dimension.defaultFontSize * 1.8,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimension.defaultFontSize * 1.8),
                        ),
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: Dimension.defaultFontSize * 1.8,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Dimension.defaultPadding * 6),
            child: ClipRRect(
              child: Hero(
                tag: 'itemwidget-${this.widget.item.id}',
                child: Image.network(
                  this.widget.item.url,
                  height: Dimension.screenHeight(context) * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: Dimension.defaultPadding,
                left: Dimension.defaultPadding,
                top: Dimension.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.widget.item.category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimension.defaultFontSize,
                    color: Colors.grey[800],
                  ),
                ),
                Container(
                  height: Dimension.screenHeight(context) * 0.1,
                  child: ListView.builder(
                    itemCount: widget.items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return addfood(context, index);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimension.defaultPadding),
                  height: Dimension.screenHeight(context) * 0.17,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: AnimatedReadMoreText(
                      '${this.widget.item.desc}',
                      maxLines: 3,
                      readMoreText: 'see more..',
                      readLessText: 'hide',
                      textStyle: TextStyle(
                        fontSize: Dimension.defaultFontSize,
                        color: Colors.black,
                      ),
                      buttonTextStyle:
                          TextStyle(fontSize: 14.0, color: Colors.blue),
                      expandOnTextTap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateQuantity(int change) {
    setState(() {
      int newQuantity = int.parse(quantity) + change;
      if (newQuantity > 0) {
        quantity = newQuantity.toString();
      }
    });
  }

  Container addfood(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: Dimension.screenHeight(context) * 0.11,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 6),
          ]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimension.defaultPadding * 0.1),
            child: Image(
              image: NetworkImage(widget.items[index].url),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              widget.items[index].category,
              style: TextStyle(
                fontSize: Dimension.defaultFontSize * 0.9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(23)),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
