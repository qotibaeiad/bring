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
        height: 130,
        width: 320,
        decoration: BoxDecoration(
          //image: DecorationImage(
          //   image: AssetImage('images/pizza_cover.jpg'), fit: BoxFit.cover),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 5),
              color: Colors.grey,
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Wrap(
                    children: List.generate(
                      this.rating,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.blue[200],
                        size: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('4.5'),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: Colors.blue[200],
                      ),
                      Text(
                        this.time,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue[200],
                      ),
                      Text(
                        this.date,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.blue[200],
                      ),
                      Text(
                        "23 min",
                        style: TextStyle(fontSize: 13),
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
