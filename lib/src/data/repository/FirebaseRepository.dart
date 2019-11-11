
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/FirebaseProvider.dart';

class FirebaseRepository{
  final _provider = FirebaseProvider();


//Authentication
  Future<FirebaseUser> googleSignIn () async =>_provider.googleSignIn();
  Future<void> googleSignOut () async =>_provider.googleSignOut();

//User from social
  Future<FirebaseUser> getCurrentUser() async =>_provider.getCurrentUser();
  //firestoreDB
  Stream<QuerySnapshot> getEventos()  =>_provider.getEventos();

}