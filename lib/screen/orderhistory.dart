import 'package:bring/widget/orderhistorycard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 8),
            child: Text(
              'Order\nHistory',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
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
                top: 140, left: 20, right: 20, bottom: 90),
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
    );
  }
}
