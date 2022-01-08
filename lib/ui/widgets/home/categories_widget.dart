import 'package:flutter/material.dart';
import 'package:p_green/utils/my_images.dart';

class Category {
  final String? icon;
  final String? label;

  Category({this.icon, this.label});
}

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<Category> list = [
    Category(icon: huucoIcon, label: "Hữu cơ"),
    Category(icon: vocoIcon, label: "Vô cơ"),
    Category(icon: taicheIcon, label: "Tái chế"),
    Category(icon: nguyhaiIcon, label: "Nguy hại"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Loại thực vật",
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
        _buildCategory(context: context, list: list)
      ]),
    );
  }
}

Widget _buildCategory({BuildContext? context, List<Category>? list}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: size.width / 3,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: size.width / 50),
          child: Column(
            children: [
              Container(
                width: size.width / 5,
                height: size.width / 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image:  DecorationImage(
                      image: AssetImage(
                          list![index].icon!),
                      fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.all(Radius.circular(size.width / 20)),
                ),
              ),
              SizedBox(
                height: size.width / 40,
              ),
              Expanded(
                child: Text(
                  "${list[index].label}",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: size.width / 25,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        );
      },
      itemCount: list!.length,
    ),
  );
}
