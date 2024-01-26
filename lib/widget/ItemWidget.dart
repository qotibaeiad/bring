import 'package:bring/class/Dimension.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
  ];
  //PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: Dimension.screenWidth(context) * 0.046,
              right: Dimension.screenWidth(context) * 0.040,
              bottom: Dimension.screenHeight(context) * 0.01,
              top: Dimension.screenHeight(context) * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top',
                style: TextStyle(
                    fontSize: Dimension.getResponsiveFontSize(context) * 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[500]),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: Dimension.defaultFontSize * 0.9,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          padding: EdgeInsets.symmetric(
            vertical: Dimension.screenHeight(context) * 0.04,
            horizontal: Dimension.screenWidth(context) * 0.04,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return topfood(context, index);
          },
        )
      ],
    );
  }

  Container topfood(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimension.screenWidth(context) * 0.030),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'itempscreen');
            },
            child: Container(
              child: Image.network(
                'https://photographer.paulewilliams.com/img-get2/I0000KOB2xgu0Re0/fit=1000x750/g=G0000DfCioCaOdiU/11598-Burger-In-Bun-Photos.jpg',
                height: Dimension.screenHeight(context) * 0.15,
                width: Dimension.screenWidth(context) * 0.30,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Item title',
              style: TextStyle(
                fontSize: Dimension.defaultFontSize * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sweet Pizza',
              style: TextStyle(
                fontSize: Dimension.getResponsiveFontSize(context) * 0.8,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$10",
                  style: TextStyle(
                    fontSize: Dimension.getResponsiveFontSize(context) * 0.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[500],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blue,
                    size: Dimension.getResponsiveFontSize(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
