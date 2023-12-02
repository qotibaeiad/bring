import 'package:bring/widget/custom_Container.dart';
import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

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
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < 8; i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 100,
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
                          path: 'images/logo1.jpg',
                          radius: 20,
                          elevation: 10,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
