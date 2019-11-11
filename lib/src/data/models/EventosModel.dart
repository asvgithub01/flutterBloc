import 'package:cloud_firestore/cloud_firestore.dart';

class EventosModel {
  final String id;
  final String nombre;
  final String descripcion;
  final String fecha;
  final String hora;
  final String imagenPortada;


  EventosModel(
      {this.id,
      this.nombre,
      this.descripcion,
      this.fecha,
      this.hora,
      this.imagenPortada});


  EventosModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.nombre = snapshot['nombre'],
        this.descripcion = snapshot['descripcion'],
        this.fecha = snapshot['fecha'],
        this.hora = snapshot['hora'],
        this.imagenPortada = snapshot['imagenportada'];

}
