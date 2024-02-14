import 'package:bring/class/Dimension.dart';
import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:bring/screen/Itemscreen.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    // Emit the "streamitem" event to request initial data
    socketService.socket.emit("streamitemtopdown");
    // Listen for "streamitems" event and update the UI
    socketService.socket.on("streamtopdownitems", (data) {
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
          padding: EdgeInsets.only(
              left: Dimension.screenWidth(context) * 0.046,
              right: Dimension.screenWidth(context) * 0.040,
              bottom: Dimension.screenHeight(context) * 0.01,
              top: Dimension.screenHeight(context) * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top',
                style: TextStyle(
                    fontSize: Dimension.getResponsiveFontSize(context) * 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[500]),
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
            ? CardLoading(
                animationDuration: Duration(milliseconds: 800),
                height: Dimension.screenHeight(context) * 0.3,
                width: Dimension.screenWidth(context) * 0.9,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: Dimension.screenHeight(context) * 0.04,
                  horizontal: Dimension.screenWidth(context) * 0.04,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return topfood(context, index);
                },
              ),
      ],
    );
  }

  Container topfood(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimension.screenWidth(context) * 0.030),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemPage(
                    item: items[index],
                    items: items,
                  ),
                ),
              );
            },
            child: Container(
              child: Hero(
                tag: 'itemwidget-${items[index].id}',
                child: Image.network(
                  items[index].url,
                  height: Dimension.screenHeight(context) * 0.15,
                  width: Dimension.screenWidth(context) * 0.30,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              items[index].category,
              style: TextStyle(
                fontSize: Dimension.defaultFontSize * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              items[index].category,
              style: TextStyle(
                fontSize: Dimension.getResponsiveFontSize(context) * 0.8,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + items[index].price,
                  style: TextStyle(
                    fontSize: Dimension.getResponsiveFontSize(context) * 0.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[500],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blue,
                    size: Dimension.getResponsiveFontSize(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
