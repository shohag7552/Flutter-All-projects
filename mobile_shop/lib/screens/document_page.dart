import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final List<String> _listItem = [
    'images/grid 1.jpg',
    'images/grid 2.jpg',
    'images/grid 7.jpg',
    'images/grid 4.jpg',
    'images/add_1.jpg',
    'images/grid 6.jpg',
    'images/grid 7.jpg',
    'images/grid 1.jpg',
    'images/add_3.jpg',
    'images/grid 2.jpg',
    'images/grid 3.jpg',
    'images/grid 5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(2.0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        dragStartBehavior: DragStartBehavior.start,
        children: _listItem
            .map((e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
