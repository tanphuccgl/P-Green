import 'package:flutter/material.dart';
import 'package:p_green/ui/widgets/home/categories_widget.dart';
import 'package:p_green/ui/widgets/home/header_widget.dart';
import 'package:p_green/ui/widgets/home/history_widget.dart';
import 'package:p_green/ui/widgets/home/search_widget.dart';
import 'package:p_green/ui/widgets/home/title_widget.dart';
import 'package:p_green/utils/bottom_navi.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(bottomNavigationBar: const BottomNar(index: 0,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child: Column(
            children: [
              SizedBox(
                height: size.width / 10,
              ),

              const HeaderWidget(),
              SizedBox(
                height: size.width / 20,
              ),
              titleWidget(context: context),
              SizedBox(
                height: size.width / 20,
              ),
              const SearchWidget(),
              SizedBox(
                height: size.width / 10,
              ),
              const CategoriesWidget(),
              const HistoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
