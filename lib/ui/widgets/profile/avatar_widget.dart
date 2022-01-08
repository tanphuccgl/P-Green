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
              backgroundImage: NetworkImage(
                  "https://zpsocial-f47-org.zadn.vn/28486473f0541f0a4645.jpg"),
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
