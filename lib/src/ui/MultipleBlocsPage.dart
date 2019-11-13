import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/blocs/EventosBloc.dart';
import 'package:flutter_app_bloc_sample/src/blocs/LoginFirebaseWithGoogleBloc.dart';
import 'package:flutter_app_bloc_sample/src/ui/utils/NavigatorUI.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/BlocProviderMultiple.dart';


class MultipleBlocsPage extends StatefulWidget {
  @override
  _MultipleBlocsPageState createState() => _MultipleBlocsPageState();
}

class _MultipleBlocsPageState extends State<MultipleBlocsPage> {

  LoginFirebaseWithGoogleBloc bloc1;
  EventosBloc bloc2;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bloc1   = BlocProviderMultiple.of<LoginFirebaseWithGoogleBloc>(context);
    bloc2   = BlocProviderMultiple.of<EventosBloc>(context);


    return Scaffold(
        body: new Container(
            padding: new EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               Text('Simplemente para que se vea como inyectar varios blocs en un page'),
                Container(
                  margin: new EdgeInsets.only(top: 25),
                ),
               Text('Flutter Multi Bloc',style: TextStyle(fontSize: 45),)
              ],
            )));
  }
}
