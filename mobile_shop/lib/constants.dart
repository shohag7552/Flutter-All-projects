import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

const Color kBackgroundColor = Color(0xFFF4F4F4);
const Color kPrimaryColor = Color(0xFFFFFFFF);
const Color kIconColor = Color(0xFF8B8B8B);
const Color kBlackColor = Color(0xFF2C3539);
const Color kwhiteColor = Color(0xFFF7F9F9);

const textStyle =
    TextStyle(color: kIconColor, fontSize: 18.0, fontStyle: FontStyle.normal);

CarouselSlider buildCarouselSlider() {
  return CarouselSlider(
  options: CarouselOptions(
    height: 150,
    initialPage: 0,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 16 / 9,
    autoPlayAnimationDuration: Duration(milliseconds: 500),
    autoPlayCurve: Curves.fastOutSlowIn,
    autoPlayInterval: Duration(seconds: 3),
    enableInfiniteScroll: true,
    viewportFraction: 0.8,
    reverse: false,
  ),
  items: [
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('images/grid 2.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: double.infinity,
        children: [
          Text(
            'Mi Pro 19',
            style: TextStyle(
              color: kwhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              //fontStyle: FontWeight.w300
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Easy to find mi phone from every where.',
              style: TextStyle(
                color: kwhiteColor,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                //fontStyle: FontWeight.w300
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('images/add_2.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: double.infinity,
        children: [
          Text(
            'Mi A2',
            style: TextStyle(
              color: kwhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              //fontStyle: FontWeight.w300
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Easy to find mi phone from every where, So quickly buy a phone and win many prizes.',
              style: TextStyle(
                color: kwhiteColor,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                //fontStyle: FontWeight.w300
              ),
            ),
          ),
        ],
      ),
    ),
  ],
    );
}
