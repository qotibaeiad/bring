import 'dart:async';
import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:bring/widget/custom_Container.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late StreamController<List<Item>> _dataStreamController;
  List<Item> dataList = [];

  @override
  void initState() {
    super.initState();
    _dataStreamController = StreamController<List<Item>>.broadcast();

    socketService.socket.on('streamitems', (data) {
      Item item = Item.fromJson(data);
      print(item);
      setState(() {
        dataList.add(item);
        _dataStreamController.add(dataList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dataList
                .map((item) => Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
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
                          customContainer(
                            path:
                                item.url, // assuming Item has a 'url' property
                            radius: 20,
                            elevation: 2,
                            width: 50,
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              item.category, // assuming Item has a 'category' property
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }
}
