import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_shop/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile_shop/screens/account_page.dart';
import 'package:mobile_shop/screens/document_page.dart';
import 'package:mobile_shop/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'initial',
      routes: {
        'initial': (context) => MiStore(),
        //   'home': (context) => HomePage(),
        //   'Account': (context) => AccountPage(),
        //   'Document': (context) => DocumentPage(),
        //   'people': (context) => PeoplePage(),
      },
    );
  }
}

class MiStore extends StatefulWidget {
  @override
  _MiStoreState createState() => _MiStoreState();
}

class _MiStoreState extends State<MiStore> {
  int _selectedItem = 0;

  PageController _pageController = PageController();
  List<Widget> _page = [HomePage(), DocumentPage(), AccountPage()];

  void _onPageChange(int index) {
    setState(() {
      return _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appBar: AppBar(
      //   backgroundColor: kPrimaryColor,
      //   elevation: 0.5,
      //   title: Text(
      //     'Mi Store',
      //     style: TextStyle(
      //       color: kIconColor,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //         icon: Icon(
      //           Icons.add_shopping_cart,
      //           size: 30,
      //           color: kIconColor,
      //         ),
      //         onPressed: () {}),
      //     SizedBox(

      //       width: 10,
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: _onPageChange,
          children: _page,
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          navigationIcon(MdiIcons.home, 'Home', 0),
          navigationIcon(MdiIcons.alphaCBox, 'Document', 1),
          navigationIcon(MdiIcons.account, 'Account', 2),
        ],
      ),
    );
  }

  Widget navigationIcon(IconData icon, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
          _pageController.jumpToPage(_selectedItem);
        });
      },
      child: Container(
        decoration: index == _selectedItem
            ? BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     kBackgroundColor,
                //     kPrimaryColor,
                //     kPrimaryColor,
                //     kPrimaryColor
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                color: index == _selectedItem ? kwhiteColor : kPrimaryColor,
              )
            : BoxDecoration(
                color: kPrimaryColor,
              ),
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            Icon(
              icon,
              color: index == _selectedItem ? kBlackColor : kIconColor,
              size: 30.0,
            ),
            Text(
              name,
              style: TextStyle(
                color: index == _selectedItem ? kBlackColor : kIconColor,
                fontSize: 18.0,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
