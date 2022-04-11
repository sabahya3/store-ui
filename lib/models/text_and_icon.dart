import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextAndIcon {
  late String label;
  late IconData icon;

  TextAndIcon({required this.icon, required this.label});
}

List<TextAndIcon> icons = [
  TextAndIcon(icon: Icons.apps, label: 'see all'),
  TextAndIcon(icon: FontAwesomeIcons.mobile, label: 'mobile'),
  TextAndIcon(icon: FontAwesomeIcons.shirt, label: 'shirt'),
  TextAndIcon(icon: FontAwesomeIcons.wallet, label: 'wallets'),
];
