import 'package:bring/class/Dimension.dart';
import 'package:flutter/material.dart';

class OrderHistoryCard extends StatelessWidget {
  final String name;
  final int rating;
  final String imgurl;
  final String time;
  final String date;
  const OrderHistoryCard(
      {super.key,
      required this.name,
      required this.rating,
      required this.imgurl,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: Dimension.screenHeight(context) * 0.18,
        width: Dimension.screenWidth(context) * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.name,
                style: TextStyle(
                    color: Colors.blue[200],
                    fontSize: Dimension.defaultFontSize * 0.9,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimension.screenHeight(context) * 0.01,
              ),
              Row(
                children: [
                  Wrap(
                    children: List.generate(
                      this.rating,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.blue[200],
                        size: Dimension.getResponsiveFontSize(context) * 0.9,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimension.screenWidth(context) * 0.01,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(
                        color: Colors.blue[200],
                        fontSize:
                            Dimension.getResponsiveFontSize(context) * 1.3),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.screenHeight(context) * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        size: Dimension.getResponsiveFontSize(context) * 1.4,
                        color: Colors.blue[200],
                      ),
                      Text(
                        this.time,
                        style: TextStyle(
                            color: Colors.blue[200],
                            fontSize: Dimension.getResponsiveFontSize(context)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: Dimension.getResponsiveFontSize(context) * 1.4,
                        color: Colors.blue[200],
                      ),
                      Text(
                        this.date,
                        style: TextStyle(
                            color: Colors.blue[200],
                            fontSize: Dimension.getResponsiveFontSize(context)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: Dimension.getResponsiveFontSize(context) * 1.4,
                        color: Colors.blue[200],
                      ),
                      Text(
                        "23 min",
                        style: TextStyle(
                            color: Colors.blue[200],
                            fontSize: Dimension.getResponsiveFontSize(context)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
