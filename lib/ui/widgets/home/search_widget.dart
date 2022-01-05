import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 40),
      child: Container(
        width: size.width,
        height: size.width / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size.width / 10)),
            border: Border.all(color: Colors.grey.shade400)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 30),
          child: Row(
            children: [
              Icon(
                Icons.search_outlined,
                color: Colors.black87,
                size: size.width / 8,
              ),
              SizedBox(
                width: size.width / 20,
              ),
              Text(
                "Search a plant.",
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width / 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
