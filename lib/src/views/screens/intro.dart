import 'package:alt_soap/src/utils/utils.dart';
import 'package:alt_soap/src/views/screens/home.dart';
import 'package:alt_soap/src/views/screens/intro_page.dart';

import 'package:alt_soap/src/views/widgets/dots_indicators.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
    Screen  size;
    final _controller = PageController();
    bool leadingVisibility = false;
    static String health ="Nothing is more effective at protecting yourself from infectious diseases like the flu (influenza) and colds than washing your hands well with soap (or using an alcohol-based disinfectant). In addition to protecting yourself, this measure helps prevent the transmission of infectious diseases.";
    static String environemnt =" Sorting and recycling waste both reduces pollution of the planet and preserves natural resources \n \n ";
    static String generosity ="";
    final List<Widget> _pages = [
      IntroPage("images/onboard_2.png","ENVIRONMENT", environemnt),
    IntroPage("images/onboard_1.png","HEALTH", health),
    IntroPage("images/onboard_3.png","GENEROSITY", "Your progress photos are being put to good use! \n \n The photoLAPSE feature allows you to view your result over custom time periods!"),
  ];
  int currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    bool isLastPage = currentPageIndex == _pages.length - 1;
    return Scaffold(
      backgroundColor : Colors.transparent,
      body : SafeArea(
        top : false,
        bottom : false,
        child : Stack(
          children: <Widget>[
              pageViewFillWidget(),
              appBarWithButton(isLastPage, context),
              bottomDotsWidget()
          ],
        )
      )
    );
  }


Positioned bottomDotsWidget() {
    return Positioned(
        bottom: size.getWidthPx(20),
        left: 0.0,
        right: 0.0,
        child: DotsIndicator(
          controller: _controller,
          itemCount: _pages.length,
          color: Colors.green, //eto ilay izy
          onPageSelected: (int page) {
            _controller.animateToPage(
              page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        ));
  }

  Positioned appBarWithButton(bool isLastPage, BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: new SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          primary: false,
          centerTitle: true,
          leading: Visibility(
              visible: leadingVisibility,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _controller.animateToPage(currentPageIndex - 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              )),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: size.getWidthPx(16), right:  size.getWidthPx(12), bottom: size.getWidthPx(12)),
              child: RaisedButton(
                child: Text(
                  isLastPage ? 'DONE' : 'NEXT',
                  style: TextStyle(fontFamily: 'Exo2',fontWeight: FontWeight.w500,fontSize: 14,color: Colors.grey.shade700),
                ),
                onPressed: isLastPage
                    ? () async{
                  // Last Page Done Click

                  //LocalStorage.sharedInstance.writeValue(key:Constants.isOnBoard,value: "1");

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                }
                    : () {
                  _controller.animateToPage(currentPageIndex + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

   Positioned pageViewFillWidget() {
    return Positioned.fill(
        child: PageView.builder(
          controller: _controller,
          itemCount: _pages.length,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
          onPageChanged: (int p) {
            setState(() {
              currentPageIndex = p;
              if (currentPageIndex == 0) {
                leadingVisibility = false;
              } else {
                leadingVisibility = true;
              }
            });
          },
        ));
  }


}