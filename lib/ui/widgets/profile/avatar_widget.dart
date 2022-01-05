import 'package:flutter/material.dart';
import 'package:p_green/utils/my_images.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      height: size.width / 3,
      child: Align(
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(houseIcon),
              radius: size.width / 6,
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundImage: AssetImage(houseIcon),
                radius: size.width / 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
