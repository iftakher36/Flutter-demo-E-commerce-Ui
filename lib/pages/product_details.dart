import 'package:efficientpos/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}
class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(icon: const Icon(
            Icons.arrow_back_ios,color: Colors.white,
        ), onPressed: () {
          Navigator.of(context).pop();
        },),
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(
              MyFlutterApp.shopping_cart
          ))
        ],
      ),
    );
  }
}
