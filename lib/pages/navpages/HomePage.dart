import 'package:efficientpos/model/home_bottom_item.dart';
import 'package:efficientpos/model/home_top_menu.dart';
import 'package:efficientpos/my_flutter_app_icons.dart';
import 'package:efficientpos/pages/category.dart';
import 'package:efficientpos/pages/navpages/Favourite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
/*import "dart:html";*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  int activeIndexs = 0;
  int flag = 1;
  List images = [
    "https://freepngimg.com/thumb/grocery/54005-1-grocery-image-png-file-hd.png",
    "https://www.pngkey.com/png/detail/284-2849902_online-grocery-store-grocery-items.png",
    "https://chefcart.com.bd/wp-content/uploads/2020/10/Beverages-product-categories.png",
    "https://www.bdgift.com/pp/grocery/grcmb1_b.jpg"
  ];
  List<HomeBottomItem> btmItem = [
    HomeBottomItem("image_one.png", "Fruits and Vegetables", "Lorem ipsum diord sit amit\,sjjrk aosjet constectia adiposimg sot"),
    HomeBottomItem("image_eight.png", "Fruits and Vegetables",
        "Lorem ipsum diord sit amit\,sjjrk aosjet constectia adiposimg sot"),
    HomeBottomItem("Image_nine.png", "Fruits and Vegetables",
        "Lorem ipsum diord sit amit\,sjjrk aosjet constectia adiposimg sot"),
    HomeBottomItem("Image_ten.png", "Fruits and Vegetables",
        "Lorem ipsum diord sit amit\,sjjrk aosjet constectia adiposimg sot"),
    HomeBottomItem("Image_eleven.png", "Fruits and Vegetables",
        "Lorem ipsum diord sit amit\,sjjrk aosjet constectia adiposimg sot")
  ];

  List<HomeTopMenu> mn = [
    HomeTopMenu(const Color(0xff030000)),
    HomeTopMenu(const Color(0xff000000)),
    HomeTopMenu(const Color(0xff000000)),
    HomeTopMenu(const Color(0xff000000))
  ];

  void onTap(int index) {
    setState(() {
      for (int i = 0; i < mn.length; i++) {
        if (index == i) {
          mn[i].setColor = const Color(0xff4caf50);
        } else {
          mn[i].setColor = const Color(0xff000000);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            if (!Scaffold
                .of(context)
                .isDrawerOpen) {
              Scaffold.of(context).openDrawer();
            } else {

            }
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Icon(MyFlutterApp.group_721)],
                ))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Search Button Clicked"),
                    backgroundColor: Colors.green));
              },
              icon: const Icon(MyFlutterApp.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(MyFlutterApp.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Card(
                    color: Colors.black,
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 28,
                      height: 180,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                                height: 180,
                                autoPlay: true,
                                viewportFraction: 1,
                                pageSnapping: true,
                                enlargeCenterPage: true,
                                enlargeStrategy:
                                CenterPageEnlargeStrategy.height,
                                onPageChanged: ((index, reason) =>
                                {
                                  setState(() {
                                    activeIndexs = index;
                                  })
                                })),
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Stack(
                                children: [
                                  Image.network(
                                    images[index],
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              );
                            },
                            itemCount: images.length,
                          ),
                          Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AnimatedSmoothIndicator(
                                        activeIndex: activeIndexs,
                                        count: images.length,
                                        effect: const WormEffect(
                                            dotColor: Colors.grey,
                                            dotWidth: 10,
                                            spacing: 3,
                                            dotHeight: 10,
                                            activeDotColor: Colors.white))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        onTap(0);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 8, bottom: 8),
                                child: SvgPicture.asset("img/all.svg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Center(
                              child: Text(
                                "All",
                                style: TextStyle(color: mn[0].getColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        onTap(1);
                      },
                      child: Column(children: [
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: SvgPicture.asset("img/fruits.svg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Center(
                            child: Text("Fruits",
                                style: TextStyle(color: mn[1].getColor)),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        onTap(2);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 8, bottom: 8),
                                child: SvgPicture.asset("img/veg.svg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Center(
                              child: Text("Vegetable",
                                  style: TextStyle(color: mn[2].getColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        onTap(3);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 8, bottom: 8),
                                child: SvgPicture.asset("img/fish.svg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Center(
                              child: Text("Fish",
                                  style: TextStyle(color: mn[3].getColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.vertical,
                itemCount: btmItem.length,
                itemBuilder: (cont, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: ListTile(
                      isThreeLine: true,
                      leading: SizedBox(
                        width: 80, height: 80,
                        child: Image.asset("img/" + btmItem[index].imgPath),
                      ),
                      title: Text(btmItem[index].title),
                      subtitle: Text(btmItem[index].subTitle,
                          style: const TextStyle(fontSize: 13)),
                      trailing: IconButton(icon: const Icon(
                          Icons.arrow_forward_ios_outlined, color: Colors.green,
                          size: 30),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>const ProductCategory()
                            ));
                          }),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
