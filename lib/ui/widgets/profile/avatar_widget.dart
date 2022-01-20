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
            CircleAvatar(backgroundColor: Colors.blue,
               backgroundImage: AssetImage(
                   avatar),
              radius: size.width / 6,
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                // backgroundImage: AssetImage(cmrIcon),
                radius: size.width / 20,
                child: Image.asset(
                  cmrIcon,
                  fit: BoxFit.cover,
                  width: size.width / 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
