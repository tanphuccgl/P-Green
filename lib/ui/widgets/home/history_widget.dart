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
      History(label: "Chuối", time: 5, assetImage: chuoiIcon),
      History(label: "Rau xà lách", time: 21, assetImage: xalachIcon),
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
            "Lịch sử quét",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width / 20,
              color: Colors.teal,
            ),
          ),
        ),
        _buildHistory(context: context, list: list),
        SizedBox(
          height: size.width / 20,
        ),
      ]),
    );
  }
}

Widget _buildHistory({BuildContext? context, List<History>? list}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: size.width / 2,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                  width: size.width / 2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width / 5,
                        child: Image.asset(
                          list![index].assetImage!,
                          width: size.width / 10,
                          height: size.width / 10,
                        ),
                      ),
                      SizedBox(
                          width: size.width / 5,
                          child: Text("${list[index].label}"))
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
                        "\t\t\t${list[index].time} ngày để thu hoạch",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 32),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 2,
    ),
  );
}
