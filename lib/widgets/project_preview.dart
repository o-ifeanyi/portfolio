// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/models/project.dart';

import '../util/config.dart';

class ProjectPreview extends StatelessWidget {
  final Project project;

  ProjectPreview({@required this.project});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: GridTile(
          child: Image.asset(
            project.image,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black.withOpacity(0.6),
            title: Text(
              project.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Config.xMargin(context, 4),
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins Bold',
              ),
            ),
            subtitle: Text(
              project.description,
              style: TextStyle(fontSize: Config.xMargin(context, 1.7)),
              softWrap: true,
              maxLines: 2,
            ),
            trailing: FlatButton.icon(
              label: Text('GitHub'),
              icon: Icon(
                FontAwesome.github,
                size: Config.xMargin(context, 5),
              ),
              onPressed: () {
                html.window.open(project.link, '');
              },
            ),
          ),
        ),
      ),
    );
  }
}
