import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double txtSize;
  final Color txtColor;
  final String txt;
  final FontWeight fontWeight;

  const AppText(
      {Key? key,
      this.txtSize = 18,
      this.txtColor = Colors.black54,
      required this.txt,required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        txt,
        style: TextStyle(
            color: txtColor, fontSize: txtSize,fontWeight: fontWeight),
      ),
    );
  }
}
