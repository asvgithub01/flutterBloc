import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample/src/blocs/EventosBloc.dart';
import 'package:flutter_app_bloc_sample/src/data/models/EventosModel.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';
import 'package:flutter_app_bloc_sample/src/ui/utils/NavigatorUI.dart';

class HomePage extends StatelessWidget {
  EventosBloc bloc;
  final FirebaseUser user;
  List<EventosModel> lstEventos;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<EventosBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        elevation: 10,
        iconTheme: IconThemeData(size: 25),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
          child: StreamBuilder<List<EventosModel>>(
              stream: bloc.getEventos,
              builder: (BuildContext ctx,
                  AsyncSnapshot<List<EventosModel>> snapshot) {
                if (snapshot.hasData) {
                  lstEventos = snapshot.data;
                  var mywidget = Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView(
                              children: snapshot.data.map((EventosModel e) {
                                return _buildEventosTileItem(context, e);
                              }).toList(),
                            ),
                          )
                        ],
                      ));
                  return mywidget;
                } else {
                  return Center(child: Text('Cargando'));
                }
              })),
    );
  }

  Widget _buildEventosTileItem(BuildContext context, EventosModel e) {
    return SizedBox(
      height: 220,
      child: GestureDetector(
        child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: new DecorationImage(
                      image: new NetworkImage(e.imagenPortada),
                      fit: BoxFit.cover,
                    )),
                child: Text('' + e.nombre, style: TextStyle(fontSize: 25)))),
        onTap: () => NavigatorUI.openMultiBlocPage(context),
      ),
    );
  }
}
