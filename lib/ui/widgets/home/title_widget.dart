import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_green/utils/my_images.dart';

Widget titleWidget({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return Align(
    alignment: Alignment.topLeft,
    child: SizedBox(
      width: size.width / 2,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Xin chào,\n',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: size.width / 13,
                    color: Colors.black54)),
            // TextSpan(
            //     text: 'Nam',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: size.width / 11,
            //         color: Colors.black)),
            // WidgetSpan(
            //   child: Padding(
            //     padding: EdgeInsets.only(left: size.width / 30),
            //     child: Image.asset(handIcon, width: size.width / 10),
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
