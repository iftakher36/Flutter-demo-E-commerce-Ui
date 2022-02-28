import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).devicePixelRatio,
      height: MediaQuery.of(context).devicePixelRatio,
      child:  const Center(
        child: Text(

          "Hello Me Page",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      )
    );
  }
}
