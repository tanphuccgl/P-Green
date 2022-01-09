import 'package:flutter/material.dart';
import 'package:p_green/ui/widgets/profile/avatar_widget.dart';
import 'package:p_green/ui/widgets/profile/background_widget.dart';
import 'package:p_green/ui/widgets/profile/overview_widget.dart';
import 'package:p_green/utils/bottom_navi.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/ProfilePage";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNar(
        index: 2,
      ),
      appBar: AppBar(
        title: const Text(
          "Tài khoản",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height / 2.8,
                child: Stack(
                  children: [
                    Positioned(
                      top: -220,
                      child: backgroundWidget(context: context),
                    ),
                    Positioned(
                      top: 100,
                      left: size.width / 2.9,
                      child: const AvatarWidget(),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Cây đã trồng\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 15,
                            color: Colors.red)),
                    TextSpan(
                        text: '10',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 17,
                            color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(
                height: size.width / 15,
              ),
              const OverviewWidget(),
              SizedBox(
                height: size.width / 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'See Analytics',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width / 20,
                                color: Colors.red)),
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width / 30),
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              size: size.width / 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
