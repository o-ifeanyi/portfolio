import 'package:flutter/cupertino.dart';

class Skill {
  final int  id;
  final IconData icon;
  final String title;
  final String description;
  bool isHovered;

  Skill({
    @required this.id,
    @required this.icon,
    @required this.title,
    @required this.description,
    this.isHovered = false
  });
}