import 'package:bring/class/Item.dart';
import 'package:bring/main.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CategoriesMain extends StatefulWidget {
  const CategoriesMain({Key? key}) : super(key: key);

  @override
  State<CategoriesMain> createState() => _CategoriesMainState();
}

class _CategoriesMainState extends State<CategoriesMain> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var currentPage = 0.0;
  double scaleFactor = 0.8;
  double height = 220;

  List<Item> items = [];
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
    // Emit the "streamitem" event to request initial data
    socketService.socket.emit("streamitem");
    // Listen for "streamitems" event and update the UI
    socketService.socket.on("streamitems", (data) {
      setState(() {
        print(
            "-----------------------------------------------------------------");
        print(Item.fromJson(data));
        items.add(data);
        //print(data);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: pageController,
            itemCount: items.length,
            itemBuilder: (context, position) {
              return _buildCategoryState(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: items.length == 0 ? 1 : items.length,
          position: currentPage.toInt(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryState(int index) {
    final currentItem = items[index];
    final imageUrl = currentItem.url;
    final category = currentItem.category;
    final stars = currentItem.stars;
    Matrix4 matrix = new Matrix4.identity();
    if (index == currentPage.floor()) {
      var currScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPage.floor() + 1) {
      var currScale =
          scaleFactor + (currentPage - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPage.floor() - 1) {
      var currScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, offset: Offset(5, 5), color: Colors.grey),
                  BoxShadow(
                      blurRadius: 5, offset: Offset(-5, 0), color: Colors.grey),
                ],
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Container(
                height: 130,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        color: Colors.grey),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pizza',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
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
                                "23 min",
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
                                "23 min",
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
            ),
          ),
        ],
      ),
    );
  }
}
