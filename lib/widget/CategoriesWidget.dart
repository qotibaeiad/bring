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

    // Initial data load
    socketService.socket.on('streamitems', (data) {
      handleItemEvent(data);
    });

    // Handle item insert event
    socketService.socket.on('streamitemsinsert', (data) {
      handleItemEvent(data);
    });

    // Handle item update event
    socketService.socket.on('streamitemsupdate', (data) {
      handleupdateItemEvent(data);
    });

    // Handle item delete event
    socketService.socket.on('streamitemsdelete', (deletedItemId) {
      try {
        setState(() {
          print("the id :- $deletedItemId");
          // Remove the item with the specified ID from the list
          dataList.removeWhere((item) => item.id == deletedItemId);
          _dataStreamController.add(dataList);
        });
      } catch (e) {
        print('Error handling streamitemsdelete: $e');
      }
    });
  }

  void handleupdateItemEvent(dynamic data) {
    if (data != null) {
      Item item = Item.fromJson(data);
      print(item);
      setState(() {
        // Find and update the existing item in dataList with the new data
        int index = dataList.indexWhere((element) => element.id == item.id);
        if (index != -1) {
          dataList[index] = item;
          _dataStreamController.add(dataList);
        }
      });
    } else {
      print('Received null data from the server');
    }
  }

  void handleItemEvent(dynamic data) {
    Item item = Item.fromJson(data);
    print(item);
    setState(() {
      dataList.add(item);
      _dataStreamController.add(dataList);
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
          child: StreamBuilder<List<Item>>(
            stream: _dataStreamController.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Container(); // Return an empty container if there is no data.
              }

              List<Item> items = snapshot.data!;
              for (Item element in items) {
                print("the url is: ");
                print(element.url);
              }
              var length = items.length;
              print("the length $length");

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (Item item in items)
                      Container(
                        // Add a unique key for each container
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
                              path: item.url,
                              radius: 20,
                              elevation: 2,
                              width: 50,
                              height: 50,
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
                      ),
                  ],
                ),
              );
            },
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
