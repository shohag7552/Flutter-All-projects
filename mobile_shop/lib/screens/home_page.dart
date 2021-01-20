import 'package:flutter/material.dart';
import 'package:mobile_shop/constants.dart';
import 'package:mobile_shop/screens/offer_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  final List<String> _listItem = [
    'images/xiami1.png',
    'images/xiaomi 2.png',
    'images/xiaomi 3.png',
    'images/xiaomi 4.png',
    'images/xiaomi 5.png',
    'images/xiaomi 6.png',
    'images/xiaomi 7.png',
    'images/xiaomi 2.png',
    'images/xiaomi 4.png',
    'images/xiaomi 5.png',
    'images/xiaomi 6.png',
    'images/xiaomi 6.png',
    'images/xiaomi 7.png',
    'images/xiaomi 2.png',
  ];

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double catagoryHeight = size.height * 0.21;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 0.0,
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: size.width,
              alignment: Alignment.topCenter,
              height: closeTopContainer ? 0 : catagoryHeight,
              child: Expanded(child: buildCarouselSlider()),
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          // AnimatedContainer(
          //   duration: const Duration(milliseconds: 100),
          //   width: size.width,
          //   alignment: Alignment.topCenter,
          //   height: closeTopContainer ? 0 : size.height * 0.08,
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OfferPage();
              }));
            },
            child: Container(
              alignment: Alignment.centerRight / 1.2,
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.pinkAccent,
                  gradient: LinearGradient(colors: [
                Colors.red,
                Colors.pinkAccent,
                Colors.pinkAccent[100],
              ])),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: kwhiteColor,
              ),
            ),
          ),
          // ),
          SizedBox(
            height: 0.0,
          ),
          Expanded(
            child: GridView.count(
              controller: controller,
              crossAxisCount: 2,
              padding: EdgeInsets.all(0.05),
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 0.1,
              children: _listItem
                  .map((e) => Card(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
