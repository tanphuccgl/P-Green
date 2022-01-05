import 'package:flutter/material.dart';

class MyTree {
  final String? assetIcon;
  final String? name;
  final int? time;

  MyTree({this.assetIcon, this.name, this.time});
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MyTree> list = [
      MyTree(time: 4, name: "My Tree", assetIcon: ""),
      MyTree(time: 2, name: "My Tree", assetIcon: "")
    ];
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 20),
      child: Column(
        children: [
          _header(context: context),
          SizedBox(
            height: size.width / 15,
          ),
          SizedBox(
            width: size.width,
            height: size.height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _itemBuilder(context: context, data: list[index]);
              },
              itemCount: 2,
            ),
          )
        ],
      ),
    );
  }
}

Widget _itemBuilder({BuildContext? context, MyTree? data}) {
  Size size = MediaQuery.of(context!).size;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width / 50),
    child: Container(
      width: size.width / 2.5,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(size.width / 20))),
      child: Padding(
        padding: EdgeInsets.all(size.width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal,
              radius: size.width / 10,
            ),
            SizedBox(
              height: size.width / 30,
            ),
            Text(
              "${data!.name}",
              style: TextStyle(
                  fontSize: size.width / 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.width / 15,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '${data.time} more left\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 25,
                          color: Colors.black)),
                  TextSpan(
                      text: 'to upgrade!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 25,
                          color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _header({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile Overview",
            style: TextStyle(
                fontSize: size.width / 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Icon(
            Icons.zoom_out_map,
            color: Colors.grey.shade500,
          )
        ],
      ));
}
