import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/ui/SplashScreenPage.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Teecke',
        theme: ThemeData(
          // Use the old theme but apply the following three changes
            textTheme: Theme.of(context).textTheme.apply(
                //fontFamily: 'Poppins', //asv ojito con esto, es probable q de OOM
                bodyColor: Colors.black,
                displayColor: Colors.black)),
        home: SplashScreenPage());
  }
}