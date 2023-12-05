import 'package:flutter/material.dart';

class Resturantappbar extends StatelessWidget {
  const Resturantappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'images/logo1.jpg',
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black54, // You can set the color
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.favorite,
            color: Colors.black54, // You can set the color
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.ios_share_sharp,
              color:
                  const Color.fromARGB(137, 12, 1, 1), // You can set the color
            ),
          ),
        ),
      ],
    );
  }
}
