import 'package:efficientpos/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
          Navigator.of(context).pop();
        },),
        title: const Expanded(
          child: Center(
            child: Text("Category",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: ()
              {

              }, icon: const Icon(MyFlutterApp.shopping_cart))
        ],
      ),
      body: Container(),
    );
  }
}
