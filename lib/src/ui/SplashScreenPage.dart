import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/blocs/LoginFirebaseWithGoogleBloc.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';

import 'LoginPage.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BlocProvider<LoginFirebaseWithGoogleBloc>(
                                  bloc: LoginFirebaseWithGoogleBloc(),
                                  child: LoginPage())
                              .child))

             });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: new Container(
            padding: new EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               Image.network('https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png'),
                Container(
                  margin: new EdgeInsets.only(top: 25),
                ),
               Text('Flutter Bloc',style: TextStyle(fontSize: 45),)
              ],
            )));
  }
}
