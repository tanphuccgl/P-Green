import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget backgroundWidget({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width / 3,
    height: size.height,
    child: RotationTransition(
      turns: const AlwaysStoppedAnimation(80 / 360),
      child: Container(
        color: Colors.red,
      ),
    ),
  );
}
