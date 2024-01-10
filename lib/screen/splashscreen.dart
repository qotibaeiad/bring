import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:bring/screen/categoriesmainscreen.dart';
import 'package:bring/widget/BottomCartSheet.dart';
import 'package:bring/widget/CategoriesWidget.dart';
import 'package:bring/widget/ItemWidget.dart';
import 'package:bring/widget/Popular_Widget.dart';
import 'package:bring/widget/TotalPrice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

List<Item> listItem = [];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            flexibleSpace: SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.010,
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    bottom: MediaQuery.of(context).size.height * 0.001),
                //padding: EdgeInsets.a,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.044),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'Search here...'),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.filter_list,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ],
                ),
              ),
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.07,
            leadingWidth: MediaQuery.of(context).size.width * 0.29,
            backgroundColor: Colors.blue[500],
            leading: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.040,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      SideSheet.left(
                          body: Scaffold(
                              appBar: AppBar(
                                backgroundColor: Colors.blue[500],
                              ),
                              body: BottomCartSheet()),
                          context: context);
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.040,
                  top: MediaQuery.of(context).size.height * 0.017,
                ),
                child: Badge.count(
                  count: 4,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      /////////

                      final Item item = Item();
                      item.setItemData('12345678912345678912345', 'name', 'sd',
                          'sd', 'sa', 'sd', 'sd');
                      socketService.sendMessage('addItem', item);
                      SideSheet.right(
                          body: Scaffold(
                              appBar: AppBar(
                                backgroundColor: Colors.blue[500],
                              ),
                              body: BottomCartSheet()),
                          context: context);
                    },
                    child: Icon(
                      CupertinoIcons.cart,
                      size: MediaQuery.of(context).size.height * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //backgroundColor: Colors.blue[900],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 17, bottom: 15),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.blue[500],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'What do you want to Buy?',
                          style:
                              TextStyle(color: Colors.blue[500], fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  //Search Widget

                  // Products Widgets
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // categoriesmain(),
                        CategoriesMain(),
                        PopularWidget(),
                        ItemWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TotalPrice(),
      ],
    );
  }
}
