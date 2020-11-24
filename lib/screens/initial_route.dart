import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/util/config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import './about_me.dart';
import './home.dart';
import './my_projects.dart';

class InitialRoute extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InitialRoute> {
  PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void swipe(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  Widget navButton(BuildContext context, String text, int index) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        padding: EdgeInsets.all(20),
        color: Colors.transparent,
        hoverColor: Theme.of(context).accentColor,
        elevation: 0,
        hoverElevation: 0,
        child: Text(text),
        onPressed: () {
          swipe(index);
          if (width < 550) Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<Widget> _pages = [
      Home(swipe),
      AboutMe(),
      MyProjects(),
    ];
    final buttons = [
      'Home',
      'About me',
      'Projects',
    ];

    List<Widget> _navActions() {
      return [
        ...List.generate(
          3,
          (index) => navButton(context, buttons[index], index),
        ),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: width < 550
            ? null
            : Padding(
                padding: EdgeInsets.only(left: Config.xMargin(context, 8)),
                child: Row(
                  children: [
                    Text(
                      'O',
                      style: TextStyle(
                        fontSize: Config.xMargin(context, 6),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins Bold',
                      ),
                    ),
                    Text(
                      'I',
                      style: TextStyle(
                        fontSize: Config.xMargin(context, 6),
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins Bold',
                      ),
                    )
                  ],
                ),
              ),
        actions: width > 550 ? _navActions() : [],
      ),
      drawer: width < 550
          ? Drawer(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _navActions(),
                ),
              ),
            )
          : null,
      body: 
      Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              children: _pages,
              onPageChanged: (newIndex) {
                setState(() {
                  _pageIndex = newIndex;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: _pageIndex,
                  axisDirection: Axis.vertical,
                  effect: WormEffect(
                      dotWidth: 25,
                      dotHeight: 10,
                      spacing: 16,
                      activeDotColor: Theme.of(context).accentColor),
                  onDotClicked: (newIndex) => swipe(newIndex),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: Visibility(
        visible: _pageIndex == 2,
        child: FloatingActionButton(
          onPressed: () => swipe(0),
          child: Icon(
            Icons.arrow_upward,
          ),
        ),
        replacement: SizedBox.shrink(),
      ),
    );
  }
}
