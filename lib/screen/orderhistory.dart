import 'package:bring/class/Dimension.dart';
import 'package:bring/widget/orderhistorycard.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home),
            Icon(Icons.next_plan),
            Icon(Icons.backspace_rounded),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: Dimension.screenHeight(context) * 0.8,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 8),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/orderhistory.jpg'),
                  fit: BoxFit.fill),
              color: Colors.blue[400],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(blurRadius: 8, spreadRadius: 12, color: Colors.grey)
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100, left: 20, right: 20, bottom: 90),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++)
                      OrderHistoryCard(
                        name: 'qotiba',
                        rating: 4,
                        imgurl: "images/pizza_cover.jpg",
                        date: "13/11/2023",
                        time: "10:30",
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
