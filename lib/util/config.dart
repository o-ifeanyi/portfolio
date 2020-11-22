import 'package:flutter/cupertino.dart';

class Config {
  static double yMargin(BuildContext context, double height) {
    var isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double viewPortHeight = isPotrait
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
    viewPortHeight = viewPortHeight > 900 ? 900 : viewPortHeight;
    return height * (viewPortHeight / 100);
  }

  static double xMargin(BuildContext context, double width) {
    var isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double viewPortwidth = isPotrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    viewPortwidth = viewPortwidth > 900
        ? 900
        : viewPortwidth < 500
            ? 500
            : viewPortwidth;
    return width * (viewPortwidth / 100);
  }
}
