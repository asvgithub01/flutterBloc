import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/ui/HomePage.dart';

import '../LoginPage.dart';


class NavigatorUI {
  static openLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
  static openHomePage(BuildContext context, FirebaseUser user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(user);
    }));
  }

}

