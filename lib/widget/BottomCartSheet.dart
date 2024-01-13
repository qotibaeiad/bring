import 'package:bring/class/Dimension.dart';
import 'package:bring/widget/TotalPrice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomCartSheet extends StatefulWidget {
  BottomCartSheet({Key? key}) : super(key: key);

  @override
  _BottomCartSheetState createState() => _BottomCartSheetState();
}

class _BottomCartSheetState extends State<BottomCartSheet> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 1; i++)
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.011,
                        horizontal: MediaQuery.of(context).size.width * 0.050,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.004,
                            ),
                            child: Image.asset(
                              'images/Login.jpg',
                              height: MediaQuery.of(context).size.width * 0.14,
                              width: MediaQuery.of(context).size.width * 0.14,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.019,
                                ),
                                child: Text(
                                  'Item Title',
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.044,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '\$20',
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.044,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.007,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.disabled_by_default,
                                  color: Colors.blue[900],
                                  size:
                                      MediaQuery.of(context).size.width * 0.044,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.055,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.002,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity =
                                                quantity > 1 ? quantity - 1 : 1;
                                          });
                                        },
                                        child: Icon(
                                          CupertinoIcons.minus,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.044,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.016,
                                      ),
                                      child: Text(
                                        quantity.toString(),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.044,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                        child: Icon(
                                          CupertinoIcons.plus,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.044,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Additional Widgets can be added here
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.014,
              horizontal: MediaQuery.of(context).size.width * 0.025,
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'quantity',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.044,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
