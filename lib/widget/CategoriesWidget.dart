import 'dart:async';
import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:bring/screen/categoriesmainscreen.dart';
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

    socketService.socket.emit('streamitem');
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
      Item item = Item.fromJson(data);
      handleupdateItemEvent(item.id, item);
    });

// Other event listeners...

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

    // Listen for the 'updateitem' event
    socketService.socket.on('updateitem', (updatedItem) {
      try {
        setState(() {
          Item newItem = Item.fromJson(updatedItem);
          String id = newItem.id;
          print("update item : $id");
          int index = dataList.indexWhere((item) => item.id == newItem.id);

          if (index != -1) {
            // If item exists in the list, update it
            dataList[index] = newItem;
          } else {
            // If item does not exist, add it to the list
            dataList.add(newItem);
          }

          _dataStreamController.add(dataList);
        });
      } catch (e) {
        print('Error handling updateitem: $e');
      }
    });
  }

  void handleupdateItemEvent(String updatedDocumentId, Item updatedItem) {
    // Function to get the index of an item with a specific id
    // Function to replace an item with a specific id
    int index = dataList.indexWhere((item) => item.id == updatedDocumentId);

    if (index != -1) {
      // Replace the item at the found index with the new item
      dataList[index] = updatedItem;
      print('Item with id $updatedDocumentId replaced successfully.');
    } else {
      print('Item with id $updatedDocumentId not found in the list.');
    }

    setState(() {
      // Find the index of the item with the specified ID
      int index =
          dataList.indexWhere((element) => element.id == updatedDocumentId);

      if (index != -1) {
        replaceItemInStream(updatedDocumentId, updatedItem);
        // Replace the existing item with the new item
        dataList[index] = updatedItem;

        // Notify listeners about the change
        _dataStreamController.add(dataList);
      }
    });
  }

  // Function to replace an item with a specific id in the stream
  void replaceItemInStream(String targetId, Item newItem) {
    // Find the index of the item with the specified id
    int index = dataList.indexWhere((item) => item.id == targetId);

    if (index != -1) {
      // Replace the item at the found index with the new item
      dataList[index] = newItem;

      // Add the updated list back to the stream controller
      _dataStreamController.add(List.from(
          dataList)); // Use List.from to create a new list to avoid direct mutation

      print('Item with id $targetId replaced in the stream.');
    } else {
      print('Item with id $targetId not found in the stream.');
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
                return CircularProgressIndicator(); // Return an empty container if there is no data.
              }

              List<Item> items = snapshot.data!;
              for (Item element in items) {
                print("the url is: ");
                print(element.url);
              }
              var length = items.length;
              print("the length $length");
              return CategoriesMain();
              /*
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
              */
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
