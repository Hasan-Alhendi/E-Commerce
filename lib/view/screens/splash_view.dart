import 'dart:async';

import 'package:flutter/material.dart';

import 'login_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  initScreen(BuildContext context) {
    AssetImage assetImage = AssetImage("assets/images/splash.png");
    Image image = Image(
      image: assetImage,
      height: 200.0,
      width: 250.0,
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: new Color(0xff7990DD),
              gradient: LinearGradient(
                  colors: [(new Color(0xff7990DD)), new Color(0xff374ABE)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: image,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "E Commerce",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0)), // padding top for button
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        )
      ],
    );
  }
}
