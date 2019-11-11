import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/blocs/EventosBloc.dart';
import 'package:flutter_app_bloc_sample/src/blocs/LoginFirebaseWithGoogleBloc.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';
import 'package:flutter_app_bloc_sample/src/ui/utils/NavigatorUI.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'HomePage.dart';
import 'SplashScreenPage.dart';

class LoginPage extends StatelessWidget {
  LoginFirebaseWithGoogleBloc
      loginBloc; //asv falta provee este bloc! lo vamos hacer ocmo una factoria
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    loginBloc =
        LoginFirebaseWithGoogleBloc(); //BlocProvider.of<LoginFirebaseWithGoogleBloc>(context);

    //asv TODO la navegacion se hace desde el splash al login mediante el block provider, xo no tira la linea de arriba
    //asv todo provider es null, nadie lo ha metido a los ancestros.. ni puta idea
    return new Scaffold(
        body: Container(child: _drawLoginForm(context)
            // Column(children: <Widget>[ _drawUserInfo(context), _drawLoginForm(context)],)
            ));
  }

  _drawLoginForm(BuildContext context) {
    return _drawSignInButtons(context);
  }

  void navigateHome(context) {
    NavigatorUI.openHomePage(context,this.user) ;
  }

  _drawUserInfo(BuildContext context) {
    return StreamBuilder(
        stream: loginBloc.googleAccount,
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else
          // ignore: missing_return
          {
            user = snapshot.data;
            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment(0, 0),
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: new NetworkImage(
                              snapshot.data.photoUrl.toString()),
                          fit: BoxFit.fill)),
                  margin: EdgeInsets.only(bottom: 10.0),
                ),
                Text(
                  "Hola ${snapshot.data.displayName.toString()}",
                  style: TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.amberAccent,
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(
                    width: double.maxFinite,
                    child: RaisedButton(
                      child: Text(
                        "Continuar",
                       style: TextStyle(fontFamily: 'Montserrat Light'),
                      ),
                      textColor: Colors.black,
                      color: Colors.cyan,
                      onPressed: () => {navigateHome(context)},
                    )),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                      child: Text("Cerrar Sesión"),
                      color: Colors.grey,
                      textColor: Colors.white,
                      onPressed: () {
                        loginBloc.googleSingOut();
                        navigateHome(context);
                      }),
                )
              ],
            );
          }
        });
  }

  _drawSignInButtons(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://s5.eestatic.com/2017/08/25/actualidad/Actualidad_241740063_129998100_1024x576.jpg',
                fit: BoxFit.fill,
              ),
              Divider(
                height: 50,
              ),

              //Google BUttons
              StreamBuilder(
                  stream: loginBloc.googleAccount,
                  builder: (BuildContext context,
                      AsyncSnapshot<FirebaseUser> snapshot) {
                    if (snapshot.hasData) {
                      return Container();
                    } else {
                      return SignInButton(Buttons.Google, onPressed: () {
                        loginBloc.googleSingIn();
                      });
                    }
                  }),
              _drawUserInfo(context),


            ]));
  }


}
