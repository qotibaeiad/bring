import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:bring/widget/BottomCartSheet.dart';
import 'package:bring/widget/CategoriesWidget.dart';
import 'package:bring/widget/ItemWidget.dart';
import 'package:bring/widget/Popular_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 2),
                        ],
                      ),
                      child: Badge.count(
                        count: 4,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        child: InkWell(
                          onTap: () {
                            /////////
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
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'What do you want to Buy?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              //Search Widget
              Container(
                margin: EdgeInsets.all(15),
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
                      width: 250,
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
