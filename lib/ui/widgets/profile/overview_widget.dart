import 'package:flutter/material.dart';
import 'package:p_green/utils/my_images.dart';

class MyTree {
  final String? assetIcon;
  final String? name;
  final int? time;
  final Color? color;

  MyTree({this.assetIcon, this.name, this.time, this.color});
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MyTree> list = [
      MyTree(
          time: 4,
          name: "My Tree",
          assetIcon: huychuong1Icon,
          color: Colors.amber.shade500.withOpacity(0.5)),
      MyTree(
          time: 2,
          name: "My Tree",
          assetIcon: huychuong2Icon,
          color: Colors.lightBlue.shade500.withOpacity(0.5))
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
          color: data!.color,
          borderRadius: BorderRadius.all(Radius.circular(size.width / 20))),
      child: Padding(
        padding: EdgeInsets.all(size.width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal,
              backgroundImage: AssetImage(data.assetIcon!),
              radius: size.width / 15,
            ),
            SizedBox(
              height: size.width / 30,
            ),
            Text(
              "${data.name}",
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
                      text: 'còn ${data.time} lần\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 25,
                          color: Colors.black)),
                  TextSpan(
                      text: 'để nâng cấp!',
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Địa điểm: Hồ Chí Minh",
            style: TextStyle(
                fontSize: size.width / 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: '- AQI: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width / 20,
                        color: Colors.black87)),
                TextSpan(
                    text: '65',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width / 20,
                        color: Colors.yellow)),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tổng quan về tiểu sử",
                style: TextStyle(
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Padding(
                  padding: EdgeInsets.only(right: size.width / 25),
                  child: SizedBox(
                      width: size.width / 16,
                      child: Image.asset(
                        menuIcon,
                        color: Colors.grey.shade600,
                      )))
            ],
          ),
        ],
      ));
}
