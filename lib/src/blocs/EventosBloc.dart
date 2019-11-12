import 'package:flutter_app_bloc_sample/src/data/models/EventosModel.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';
import 'package:flutter_app_bloc_sample/src/data/repository/FirebaseRepository.dart';
import 'package:rxdart/rxdart.dart';

class EventosBloc implements BlocBase {
  FirebaseRepository _repository;

  //listado de Eventos
  List<EventosModel> _auxEventos = List<EventosModel>();

  //StreamController
  BehaviorSubject<List<EventosModel>> _eventosStreamController =
      BehaviorSubject<List<EventosModel>>();

  //meter al stream sink
  Sink<List<EventosModel>> get inEventos => _eventosStreamController.sink;

  //sacar stream, pa leer desde fuera
  Stream<List<EventosModel>> get getEventos => _eventosStreamController.stream;//

  //constructor
  EventosBloc() {
    _repository = FirebaseRepository();
    _repository.getEventos().listen((collecionEventos) {
      _auxEventos.clear();
      collecionEventos.documents.forEach((eventoItem) {
        EventosModel item = EventosModel.fromSnapshot(eventoItem);
        _auxEventos.add(item);
      });
      inEventos.add(_auxEventos);
    });
  }

  @override
  void dispose() {
    //cerrara los stream asv
    inEventos.close();
    _eventosStreamController.close();
  }
}
