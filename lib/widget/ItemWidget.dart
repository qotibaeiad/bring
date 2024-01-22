import 'package:bring/class/Dimension.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.046,
              right: MediaQuery.of(context).size.width * 0.040,
              bottom: MediaQuery.of(context).size.height * 0.01,
              top: MediaQuery.of(context).size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top',
                style: TextStyle(
                    fontSize: Dimension.defaultFontSize * 2,
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
        GridView.count(
          padding: EdgeInsets.symmetric(
              vertical: Dimension.screenHeight(context) * 0.04,
              horizontal: Dimension.screenWidth(context) * 0.04),
          crossAxisSpacing: Dimension.screenWidth(context) * 0.04,
          mainAxisSpacing: Dimension.screenWidth(context) * 0.04,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          shrinkWrap: true,
          children: [
            for (int i = 0; i < 8; i++)
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.screenWidth(context) * 0.030),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'itempscreen');
                      },
                      child: Container(
                        // margin: EdgeInsets.only(
                        //   bottom: MediaQuery.of(context).size.width * 0.0001),
                        child: Image.network(
                          'https://photographer.paulewilliams.com/img-get2/I0000KOB2xgu0Re0/fit=1000x750/g=G0000DfCioCaOdiU/11598-Burger-In-Bun-Photos.jpg',
                          height: Dimension.screenHeight(context) * 0.15,
                          width: Dimension.screenWidth(context) * 0.30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Dimension.screenHeight(context) * 0.012),
                      child: Container(
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Dimension.screenHeight(context) * 0.0001),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sweet Pizza',
                          style: TextStyle(
                            fontSize: Dimension.defaultFontSize * 1.1,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimension.screenHeight(context) * 0.009,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$10",
                            style: TextStyle(
                              fontSize: Dimension.screenHeight(context) * 0.033,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[500],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(
                                  Dimension.screenHeight(context) * 0.013),
                              decoration: BoxDecoration(
                                color: Colors.blue[500],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: Dimension.screenHeight(context) * 0.01,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
