import 'package:bring/class/Dimension.dart';
import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:bring/widget/custom_Container.dart';
import 'package:flutter/material.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    socketService.socket.emit("stream5Staritem");
    // Listen for "streamitems" event and update the UI
    socketService.socket.on("streamitems", (data) {
      setState(() {
        print(
            "-----------------------------------------------------------------");
        Item item = Item.fromJson(data);
        print(item.id);
        items.add(item); // Add the Item object, not the raw JSON data
        print(
            "-----------------------------------------------------------------");
        //print(data);
      });
    });

    socketService.socket.on("insertItem", (data) {
      setState(() {
        print(
            "-----------------------------------------------------------------");
        Item item = Item.fromJson(data);
        print(item.id);
        items.add(item); // Add the Item object, not the raw JSON data
        print(
            "-----------------------------------------------------------------");
        //print(data);
      });
    });

    socketService.socket.on("deleteItem", (data) {
      setState(() {
        // Extract the id from the data received from the server
        String itemId = data;

        // Find the index of the item with the matching id
        int index = items.indexWhere((item) => item.id == itemId);

        // Check if the item with the given id exists in the list
        if (index != -1) {
          // Remove the item from the list
          items.removeAt(index);
          print('Item with id deleted: $itemId');
        }
      });
    });

    socketService.socket.on("updateItem", (data) {
      setState(() {
        int index = -1;
        print(
            "-----------------------------------------------------------------");
        String itemId = data[1].toString();
        for (var entry in data[1].entries) {
          index = items.indexWhere((item) => item.id == entry.value);
          print(index);
        }
        print(index);
        if (index != -1) {
          // Iterate through the updated fields and update the item
          for (var entry in data[3].entries) {
            final fieldName = entry.key;
            final fieldValue = entry.value;

            // Update the field in the item
            items[index].updateField(fieldName, fieldValue);

            print('Field: $fieldName, Value: $fieldValue');
          }

          print('Item updated: $itemId');
        }
        print(
            "-----------------------------------------------------------------");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 5, bottom: 5, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: Dimension.defaultFontSize * 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: Dimension.defaultFontSize * 0.9,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        items.length == 0
            ? Container(
                height: Dimension.screenHeight(context) * 0.1,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                height: Dimension.screenHeight(context) * 0.1,
                child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MidItems(context, index);
                  },
                ),
              ),
      ],
    );
  }

  Container MidItems(BuildContext context, int index) {
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
            padding: EdgeInsets.all(0),
            child: customContainer(
              path: items[index].url,
              radius: 20,
              elevation: 10,
              width: Dimension.screenWidth(context) * 0.11,
              height: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              items[index].category,
              style: TextStyle(
                fontSize: Dimension.defaultFontSize * 0.9,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
