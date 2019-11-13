import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/blocs/EventosBloc.dart';
import 'package:flutter_app_bloc_sample/src/blocs/LoginFirebaseWithGoogleBloc.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/BlocProviderMultiple.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';
import 'package:flutter_app_bloc_sample/src/ui/HomePage.dart';

import '../LoginPage.dart';
import '../MultipleBlocsPage.dart';

class NavigatorUI {
  //asv esto puede estr en el Page, q sabe como se abre
  static openLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BlocProvider<LoginFirebaseWithGoogleBloc>(
          bloc: LoginFirebaseWithGoogleBloc(),
          child: LoginPage());
    }));
  }

  static openHomePage(context, FirebaseUser user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<EventosBloc>(
                bloc: EventosBloc(),
                child: HomePage(user))));
  }

  static openMultiBlocPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProviderMultiple<BlocBase>(
                blocs: [LoginFirebaseWithGoogleBloc(),EventosBloc()],
                child: MultipleBlocsPage())));
  }
}
