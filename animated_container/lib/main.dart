import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Animatedcontainer(),
    );
  }
}

class Animatedcontainer extends StatefulWidget {
  @override
  _AnimatedcontainerState createState() => _AnimatedcontainerState();
}

class _AnimatedcontainerState extends State<Animatedcontainer>
    with TickerProviderStateMixin {
  double _height;
  double _wight;
  Color _color = Colors.grey;
  BorderRadiusGeometry _radious = BorderRadius.circular(50);

  bool selected = false;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _animation.addListener(() {
      setState(() {
       
      });
    });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: _color,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2.4, 10.0),
                        blurRadius: 5.5),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey[300],
                        Colors.grey[350],
                        Colors.grey[400],
                      ]),
                  borderRadius: _radious),
              child: Column(
                children: [
                  // eyes.....
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      AnimatedBuilder(
                        animation: _animation,
                        child: Container(
                          height: _height,
                          width: _wight,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        builder: (context, child) {
                          return child;
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        child: Container(
                          height: _height,
                          width: _wight,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        builder: (context, child) {
                          return child;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      // mouth.......
                      AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        height: selected ? 5 : 15,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 7,
                        child: Container(
                          height: 8,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 35,
              child: Container(
                height: 30,
                width: 28,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
