import 'package:bring/class/Item.dart';
import 'package:bring/widget/custom_Container.dart';
import 'package:flutter/material.dart';

class CategoryFirst extends StatelessWidget {
  final Item item;

  const CategoryFirst({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: customContainer(
              path: item.url,
              radius: 20,
              elevation: 2,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              item.category,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

StreamBuilder<Item>(
      stream: itemStream,
      builder: (context, snapshot) {
        print("Connection state: ${snapshot.connectionState}");
        print("Has data: ${snapshot.hasData}");
        print("Data: ${snapshot.data}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator while waiting for data
        }

        if (snapshot.hasData) {
          Item item = snapshot.data!;
        } else if (snapshot.hasError) {
          // Handle error case
          return CircularProgressIndicator();
        } else {
          return CircularProgressIndicator();
        }
      },
    );








return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: customContainer(
                    path: item.url,
                    radius: 20,
                    elevation: 2,
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    item.category,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
          */
