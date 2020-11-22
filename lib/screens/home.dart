// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../util/config.dart';
import '../widgets/rounded_button.dart';
import '../widgets/social_handles.dart';

class Home extends StatefulWidget {
  final Function swipe;

  Home(this.swipe);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    )..forward();
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -10.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    var image = Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('images/image.png'),
          fit: BoxFit.contain,
        ),
      ),
    );

    var column = Container(
      child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: mediaQuery.size.width < 550
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'HI THERE, I\'M',
                  style: TextStyle(
                    fontSize: Config.xMargin(context, 3),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins Bold',
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                crossAxisAlignment: mediaQuery.size.width < 550
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  TypewriterAnimatedTextKit(
                    text: ['Onuoha', 'Ifeanyi'],
                    totalRepeatCount: 1,
                    speed: Duration(milliseconds: 350),
                    textStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: Config.xMargin(context, 10),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins Bold',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'A FLUTTER DEVELOPER',
                      style: TextStyle(
                        fontSize: Config.xMargin(context, 3),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins Bold',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      'I am a flutter developer who loves to build responsive and scaleable apps for Android, IOS, Web, and Desktop. I am also an optometrist. I love learning new things and quickly too. And I love to code >_',
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: mediaQuery.size.width < 550
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                        fontSize: Config.xMargin(context, 2),
                      ),
                    ),
                  ),
                  SizedBox(height: Config.yMargin(context, 1)),
                  SocialHandles(),
                  SizedBox(height: Config.yMargin(context, 1)),
                  Container(
                    height: Config.xMargin(context, 7),
                    padding: const EdgeInsets.only(left: 4.0),
                    child: FittedBox(
                      child: Row(
                        children: [
                          RoundedButton(
                            text: 'Hire Me',
                            callBack: () {
                              html.window
                                  .open('mailto:onuifeanyi95@gmail.com', '#');
                            },
                          ),
                          SizedBox(width: Config.xMargin(context, 1)),
                          RoundedButton(
                            text: 'Projects',
                            callBack: () => widget.swipe(2),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.only(
        left: Config.xMargin(context, 10),
        right: Config.xMargin(context, 10),
        top: Config.yMargin(context, 8),
      ),
      child: mediaQuery.size.width > 550
          ? Row(
              children: [
                Expanded(
                  flex: 2,
                  child: column,
                ),
                SizedBox(width: Config.xMargin(context, 3)),
                Expanded(
                  flex: 1,
                  child: image,
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: image,
                ),
                SizedBox(height: Config.yMargin(context, 2)),
                Expanded(
                  flex: 2,
                  child: column,
                )
              ],
            ),
    );
  }
}
