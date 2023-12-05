import 'dart:math';

import 'package:bring/widget/BottomCartSheet.dart';
import 'package:bring/widget/CategoriesWidget.dart';
import 'package:bring/widget/ItemWidget.dart';
import 'package:bring/widget/Popular_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:side_sheet_material3/side_sheet_material3.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 45, left: 70, right: 70, bottom: 5),
          //padding: EdgeInsets.a,
          height: 50,
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
                margin: EdgeInsets.only(left: 20),
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Search here...'),
                ),
              ),
              Spacer(),
              Icon(
                Icons.filter_list,
                size: 25,
              ),
            ],
          ),
        ),
        toolbarHeight: 50,
        leadingWidth: 100,
        backgroundColor: Colors.blue[900],
        leading: Container(
          padding: EdgeInsets.only(right: 20, left: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  SideSheet.left(
                      body: Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.blue[900],
                          ),
                          body: BottomCartSheet()),
                      context: context);
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20, left: 15, top: 10),
            child: Badge.count(
              count: 4,
              textStyle: TextStyle(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  /////////
                  SideSheet.right(
                      body: Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.blue[900],
                          ),
                          body: BottomCartSheet()),
                      context: context);
                  //  child:
                  //   Text('OPEN LEFT SIDE SHEET');
                },
                child: Icon(
                  CupertinoIcons.cart,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'What do you want to Buy?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              //Search Widget

              // Products Widgets
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    PopularWidget(),
                    ItemWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*
      bottomNavigationBar: BottomBarWithSheet(
        autoClose: true,
        sheetChild: BottomCartSheet(),
        bottomBarTheme: BottomBarTheme(
          decoration: BoxDecoration(
            color: Colors
                .white, // Set this to transparent to see the circular background
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), // Adjust the radius as needed
              topRight: Radius.circular(20.0), // Adjust the radius as needed
            ),
            border: Border.all(
              color: Colors.grey, // Set the color of the border
              width: 1.0, // Set the width of the border
            ),
          ),
          itemIconColor: Colors.grey,
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
      */
  }
}
