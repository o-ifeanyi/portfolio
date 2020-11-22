import 'package:flutter/cupertino.dart';

class Project {
  final int id;
  final String image;
  final String title;
  final String description;
  final String link;

  Project({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.link,
  });
}