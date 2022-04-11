import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBarModel{
  late IconData icon;
  NavBarModel({required this.icon});
}

List<NavBarModel>navIcons=[
  NavBarModel(icon: Icons.home_outlined),
  NavBarModel(icon: FontAwesomeIcons.heart),
  NavBarModel(icon: FontAwesomeIcons.bell),
  NavBarModel(icon: FontAwesomeIcons.user),
];