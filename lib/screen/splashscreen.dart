import 'package:bring/class/Item.dart';
import 'package:bring/screen/mainfoodpage.dart';
import 'package:bring/widget/BottomCartSheet.dart';
import 'package:bring/widget/TotalPrice.dart';
import 'package:flutter/material.dart';

List<Item> listItem = [];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pagenum = 0;
  void updateindex(int index) {
    setState(() {
      pagenum = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (pagenum) {
      case 0:
        return mainfoodpage();
      case 1:
        return BottomCartSheet();
      default:
        return TotalPrice();
    }
  }
}
