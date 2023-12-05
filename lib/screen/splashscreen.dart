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
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.044,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.01),
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
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        leadingWidth: MediaQuery.of(context).size.width * 0.29,
        backgroundColor: Colors.blue[900],
        leading: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.040,
          ),
          //left: MediaQuery.of(context).size.width * 0.050,
          //top: MediaQuery.of(context).size.height * 0.030,
          //bottom: MediaQuery.of(context).size.height * 0.10),
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
                  size: MediaQuery.of(context).size.height * 0.04,
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
  }
}
