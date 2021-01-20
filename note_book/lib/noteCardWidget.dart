import 'package:flutter/material.dart';

import 'colors.dart';

// class NoteCard extends StatelessWidget {
//   final String title;
//   final String desc;

//   NoteCard({this.title, this.desc});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         vertical: 32.0,
//         horizontal: 24.0,
//       ),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title ?? "(Unnamed Task)",
//             style: TextStyle(
//               color: Color(0xFF211551),
//               fontSize: 22.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 10.0,
//             ),
//             child: Text(
//               desc ?? "No Description Added",
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Color(0xFF86829D),
//                 height: 1.5,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class NoteCard extends StatelessWidget {
  final String title;
  final String des;
  final Function onTap;
  NoteCard({this.title, this.des, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
              color: appCardColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: FlatButton(
            onPressed: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                    Text(
                      title != null ? '$title' : '(Unnamed)',
                      style: TextStyle(
                          color: appTextTitleColor,
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, bottom: 10, top: 10),
                  child: Text(
                    des ?? 'No description added.',
                    style: TextStyle(
                        color: appTextColor,
                        fontFamily: 'Roboto',
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// Default scroll behavior is changed by it....
class ScrollGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
