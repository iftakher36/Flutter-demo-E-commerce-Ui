import 'package:efficientpos/pages/navpages/mainPage.dart';
import 'package:efficientpos/pages/product_details.dart';
import 'package:efficientpos/widget/AppText.dart';
import 'package:efficientpos/widget/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  PageController pageController =
  PageController(viewportFraction: 1, keepPage: true);
  List images = ["f.svg", "s.svg", "t.svg"],
      txt = ["Next", "Next", "Skip"];
  String img = "logo.png";
  int indexes = 0;
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            if (MediaQuery.of(context).size.width>768) {
              return WebWelComeWidget(img: img, pageController: pageController, txt: txt, images: images,index: index,);
            }
            else {
              return MobWelcomeWidget(images: images, img: img, pageController: pageController, txt: txt,index: index,);
            }
          }),
    );
  }
}

