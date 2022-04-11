import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const imgUrl =
    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';

TextStyle getTxtStyle({double fontSize = 18, Color color = Colors.black}) {
  return TextStyle(
      fontSize: fontSize, color: color, fontWeight: FontWeight.bold);
}


List<String>sizes=['M','L','XL'];
