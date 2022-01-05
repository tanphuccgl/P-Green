import 'package:flutter/material.dart';
import 'package:p_green/utils/my_images.dart';

class History {
  final String? assetImage;
  final String? label;
  final int? time;

  History({this.assetImage, this.label, this.time});
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<History> list = [
      History(label: "Argula", time: 5, assetImage: ""),
      History(label: "Spinach", time: 21, assetImage: ""),
      History(label: "Argula", time: 5, assetImage: ""),
      History(label: "Spinach", time: 3, assetImage: ""),
      History(label: "Argula", time: 7, assetImage: ""),
      History(label: "Spinach", time: 11, assetImage: ""),
    ];
    return SizedBox(
      width: size.width,
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Plant Category",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width / 20,
              color: Colors.teal,
            ),
          ),
        ),
        SizedBox(
          height: size.width / 20,
        ),
        _buildHistory(context: context, list: list)
      ]),
    );
  }
}

Widget _buildHistory({BuildContext? context, List<History>? list}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: size.width,
    child: ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: size.width / 20,
              left: size.width / 50,
              right: size.width / 50),
          child: Container(
            width: size.width,
            height: size.width / 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.all(Radius.circular(size.width / 20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        houseIcon,
                        width: size.width / 10,
                        height: size.width / 10,
                      ),
                      Text("${list![index].label}")
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 2.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timelapse,
                        size: size.width / 20,
                        color: Colors.black54,
                      ),
                      Text(
                        "\t\t\t${list[index].time} days to harvest",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 30),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 4,
    ),
  );
}
