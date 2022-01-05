import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            radius: size.width / 14,
            child: CircleAvatar(
              radius: size.width / 15,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.menu,
                color: Colors.black54,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            radius: size.width / 14,
            child: CircleAvatar(
              radius: size.width / 15,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.notifications_active,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
