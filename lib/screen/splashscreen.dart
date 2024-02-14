import 'package:bring/class/Dimension.dart';
import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:bring/screen/categoriesmainscreen.dart';
import 'package:bring/screen/orderhistory.dart';
import 'package:bring/widget/ItemWidget.dart';
import 'package:bring/widget/Popular_Widget.dart';
import 'package:bring/widget/TotalPrice.dart';
import 'package:flutter/material.dart';

List<Item> listItem = [];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pagenum = 0;
  void updateindex(int index) {
    setState(() {
      pagenum = index;
    });
  }

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
                    left: MediaQuery.of(context).size.width * 0.25,
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
                    SizedBox(
                      width: Dimension.screenWidth(context) * 0.02,
                    ),
                    Icon(
                      Icons.search,
                      size: Dimension.defaultFontSize * 1.3,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'Search here...'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.07,
            leadingWidth: MediaQuery.of(context).size.width * 0.29,
            backgroundColor: Colors.blue[900],
          ),
          drawer: Drawer(
            // Your drawer content goes here
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ],
                    color: Colors.blue,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        size: Dimension.getResponsiveFontSize(context) * 3.5,
                        color: Colors.white,
                      ),
                      Text(
                        'Information',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              Dimension.getResponsiveFontSize(context) * 2,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text('Account'),
                  onTap: () {
                    Navigator.pushNamed(context, 'mainpage');
                  },
                ),
                Divider(
                  color: Colors.black, // Set the color of the line
                  thickness: 0.4, // Set the thickness of the line
                ),
                ListTile(
                  title: Text('Order History'),
                  onTap: () {
                    Navigator.pushNamed(context, 'orderhistory');
                  },
                ),
                Divider(
                  color: Colors.black, // Set the color of the line
                  thickness: 0.4, // Set the thickness of the line
                ),
                ListTile(
                  title: Text('Setting'),
                  onTap: () {},
                ),
                // Add more list items as needed
              ],
            ),
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
                                fontSize: Dimension.defaultFontSize * 1.7,
                                color: Colors.blue[500],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'What do you want to Buy?',
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: Dimension.defaultFontSize * 1.2),
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
