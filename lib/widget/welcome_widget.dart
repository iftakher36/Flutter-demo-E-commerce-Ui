import 'package:efficientpos/pages/navpages/mainPage.dart';
import 'package:efficientpos/pages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppText.dart';

class MobWelcomeWidget extends StatelessWidget {

  final List images;
  final String img;
  final PageController pageController;
  final List txt;
  final int index;
  const MobWelcomeWidget({
    Key? key,
    required this.images,
    required this.img,
    required this.pageController,
    required this.txt,
    required this.index
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              "img/" + images[index],
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: const EdgeInsets.only(
                bottom: 10.0, right: 10.0, left: 10.0),
            child: Container(
                margin: const EdgeInsets.only(top: 100.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                index==0?AppText(txt: "Welcome To",fontWeight: FontWeight.normal):index==1?AppText(txt: "Get",fontWeight: FontWeight.normal):index==2?AppText(txt: "Best Quality",fontWeight: FontWeight.normal):Container()],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  index==0?Image.asset("img/" + img):index==1? AppText(txt: "Fast",txtColor: Colors.green,txtSize: 22,fontWeight: FontWeight.bold):index==2? AppText(txt: "Grocery",txtColor: Colors.green,txtSize: 22,fontWeight: FontWeight.bold):Container(),
                                  /*SvgPicture.asset(
                              "img/logo.svg",
                              alignment: Alignment.center,
                            ),*/
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, left: 4.0),
                                    child:  index==0?AppText(txt: "Application",fontWeight: FontWeight.normal):index==1? AppText(txt: "Delivery Service",fontWeight: FontWeight.normal):index==2? AppText(txt: "Door to Door",fontWeight: FontWeight.normal):Container(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                            children: List.generate(
                                images.length,
                                    (indexDots) => Container(
                                  height:
                                  index == indexDots ? 25 : 15,
                                  width: 8.0,
                                  margin:
                                  const EdgeInsets.only(top: 2),
                                  decoration: BoxDecoration(
                                      color: index == indexDots
                                          ? Colors.green
                                          : Colors.black12,
                                      borderRadius:
                                      BorderRadius.circular(8)),
                                )))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                onSurface: Colors.blue,
                                tapTargetSize:
                                MaterialTapTargetSize.padded),
                            onPressed: () {
                              if (index == 2) {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return 1==1?Main():ProductDetails();
                                    }));
                              } else if(index != 2){ pageController.jumpToPage(index + 1);}
                            },
                            child: Text(txt[index]))
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
class WebWelComeWidget extends StatelessWidget {

  const WebWelComeWidget({
    Key? key,
    required this.img,
    required this.pageController,
    required this.txt,
    required this.images,
    required this.index
  }) : super(key: key);

  final String img;
  final PageController pageController;
  final List txt;
  final List images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: double.maxFinite,
                margin: const EdgeInsets.only(
                    bottom: 10.0, right: 10.0, left: 10.0),
                child: Container(
                    margin: const EdgeInsets.only(top: 100.0, left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    index==0?const AppText(txt: "Welcome To",fontWeight: FontWeight.normal):index==1?AppText(txt: "Get",fontWeight: FontWeight.normal):index==2?const AppText(txt: "Best Quality",fontWeight: FontWeight.normal):Container()],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    children: [
                                      index==0?Image.asset("img/" + img):index==1? const AppText(txt: "Fast",txtColor: Colors.green,txtSize: 22,fontWeight: FontWeight.bold):index==2? AppText(txt: "Grocery",txtColor: Colors.green,txtSize: 22,fontWeight: FontWeight.bold):Container(),
                                      /*SvgPicture.asset(
                        "img/logo.svg",
                        alignment: Alignment.center,
                      ),*/
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, left: 4.0),
                                        child:  index==0?AppText(txt: "Application",fontWeight: FontWeight.normal):index==1? AppText(txt: "Delivery Service",fontWeight: FontWeight.normal):index==2? AppText(txt: "Door to Door",fontWeight: FontWeight.normal):Container(),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.blue,
                                    tapTargetSize:
                                    MaterialTapTargetSize.padded),
                                onPressed: () {
                                  if (index == 2) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_) {
                                          return const Main();
                                        }));
                                  } else if(index != 2){ pageController.jumpToPage(index + 1);}
                                },
                                child: Text(txt[index]))
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "img/" + images[index],
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                      images.length,
                          (indexDots) => Container(
                        height:
                        index == indexDots ? 25 : 15,
                        width: 8.0,
                        margin:
                        const EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                            color: index == indexDots
                                ? Colors.green
                                : Colors.black12,
                            borderRadius:
                            BorderRadius.circular(8)),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}