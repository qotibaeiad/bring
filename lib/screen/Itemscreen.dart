import 'package:bring/class/Dimension.dart';
import 'package:bring/class/Item.dart';
import 'package:bring/widget/BottomBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//ItemPage
//  final String item;

class ItemPage extends StatefulWidget {
  final Item item;
  const ItemPage({super.key, required this.item});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String quantity = "1";

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
      bottomNavigationBar: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
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
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Dimension.defaultPadding * 6),
            child: ClipRRect(
              child: Hero(
                tag: 'itemwidget-${this.widget.item.id}',
                child: Image.network(
                  this.widget.item.url,
                  height: 360,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              this.widget.item.category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[800],
              ),
            ),
            subtitle: Text(
              '${this.widget.item.desc} night stay for only \$${this.widget.item.price}',
              style: TextStyle(letterSpacing: 1),
            ),
          ),
          SizedBox(height: 20),
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
}
