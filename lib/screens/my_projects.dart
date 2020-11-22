import 'package:flutter/material.dart';

import '../project_list.dart';
import '../util/config.dart';
import '../widgets/project_preview.dart';

class MyProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height,
      padding: EdgeInsets.only(
        top: Config.yMargin(context, 5),
        left: Config.xMargin(context, 7),
        right: Config.xMargin(context, 7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Stuff I\'ve worked on',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Config.xMargin(context, 5),
              fontWeight: FontWeight.w900,
              fontFamily: 'Poppins Bold',
            ),
          ),
          SizedBox(height: Config.yMargin(context, 2)),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 650,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2,
              ),
              children: projectList
                  .map(
                    (e) => ProjectPreview(project: e),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: Config.yMargin(context, 4)),
        ],
      ),
    );
  }
}
