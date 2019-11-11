import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';
import 'package:flutter_app_bloc_sample/src/data/repository/FirebaseRepository.dart';
import 'package:rxdart/rxdart.dart';

class LoginFirebaseWithGoogleBloc  implements BlocBase{
  FirebaseRepository _repository;

  //StreamController
  BehaviorSubject<FirebaseUser> _googleStream = BehaviorSubject<FirebaseUser>();

  //stream
  Stream<FirebaseUser> get  googleAccount =>
      _googleStream.stream; //esta propiedas es para consultar el resultado
  //constructor
  LoginFirebaseWithGoogleBloc() {
    _repository = FirebaseRepository();
    _repository.getCurrentUser().then((FirebaseUser user){
      //asv digamos q esto sustituye el preferences, eso lo debe tener establecido ya el poroio sdk de firebase auth
       _googleStream.sink.add( user);
    });
  }

  googleSingIn() async {
    _repository.googleSignIn().then((FirebaseUser user) {
      _googleStream.sink.add(user);
    });
  }

  googleSingOut()  {
    _repository.googleSignOut().then(_googleStream.sink.add);
    }



  dispose() {
    _googleStream.close();
  }
//asv todo falta guardar lo atujeticado en el disco y consultarlo

}
