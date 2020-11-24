// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/skills_list.dart';

import '../util/config.dart';
import '../widgets/rounded_button.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final column = Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, bottom: Config.yMargin(context, 2)),
              child: Text(
                'About Me',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 6),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins Bold',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'I have a Doctor of optometry degree from Imo State University. I am a self taught Front End Developer and have used a lot of online resources and hands on projects to be where I am today. Some of the resources are: Freecodecamp, Codecademy, W3schools, Youtube videos, Medium articles, Dev.to articles, Udemy Courses etc. I have sound knowledge on FLUTTER, DART, HTML5, CSS3, VANILLA JAVASCRIPT, FIREBASE, GIT, GITHUB, RESTFUL API\'S and more.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 2.5),
                ),
              ),
            ),
            SizedBox(height: Config.yMargin(context, 1)),
            Container(
              height: Config.xMargin(context, 7),
              child: FittedBox(
                child: RoundedButton(
                  text: 'View Resume',
                  callBack: () {
                    final url =
                        'https://docs.google.com/document/d/18d3Fv1OOWqGgwafGX8sedcIkg12wR80vFNz4pnVnHzQ/edit';
                    html.window.open(url, '');
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: Config.yMargin(context, 2),
              ),
              child: Text(
                'What can I do for you?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Config.xMargin(context, 5),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins Bold',
                ),
              ),
            ),
            Container(
              height: Config.yMargin(context, 30),
              width: double.infinity,
              child: ListView.builder(
                itemCount: skillList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => Container(
                  width: Config.xMargin(context, 50),
                  margin: const EdgeInsets.all(15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFF121212),
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          skillList[i].icon,
                          size: Config.xMargin(context, 8),
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          skillList[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Config.xMargin(context, 4),
                          ),
                        ),
                        Text(
                          skillList[i].description,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: Config.xMargin(context, 2.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.only(
        top: Config.yMargin(context, 5),
        right: mediaQuery.size.width > 550 ? Config.xMargin(context, 15) : 20,
        left: mediaQuery.size.width > 550
            ? Config.xMargin(context, 10)
            : Config.xMargin(context, 7),
      ),
      child: column,
    );
  }
}
