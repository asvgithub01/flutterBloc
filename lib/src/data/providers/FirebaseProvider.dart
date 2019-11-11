import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider {
  GoogleSignIn _googleSignIn;
  FirebaseAuth _firebaseAuth;
  Firestore _fireStoreDB;

  FibaseProvider() {
    _googleSignIn = GoogleSignIn();
    _firebaseAuth = FirebaseAuth.instance;
    _fireStoreDB = Firestore.instance;
  }

  Future<FirebaseUser> googleSignIn() async {
    _googleSignIn =
        GoogleSignIn(); //asv todo esto está feo, deberia crease solo 1 vez y no 1 vez x llamada
    _firebaseAuth = FirebaseAuth
        .instance; //asv todo esto está feo, deberia crease solo 1 vez y no 1 vez x llamada

    //auth con google mediante cuadro de dialogo
    final GoogleSignInAccount googleUser = await this._googleSignIn.signIn();
    //con la cuanta de google seleccionada por el usuario nos autenticamos
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    //tras autenticarnos con google ahora nos autenticamos con firebase
    //asv todo final AuthCredential authCredential = FacebookAuthProvider
    final AuthCredential googleAuthCredential =
        GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final AuthResult result =
        await this._firebaseAuth.signInWithCredential(googleAuthCredential);
    return result.user;
  }

  Future<void> googleSignOut() async {
    _googleSignIn =
        GoogleSignIn(); //asv todo esto está feo, deberia crease solo 1 vez y no 1 vez x llamada
    _firebaseAuth = FirebaseAuth
        .instance; //asv todo esto está feo, deberia crease solo 1 vez y no 1 vez x llamada

    _googleSignIn.signOut();
    return await _firebaseAuth.signOut();
  }

  Future<FirebaseUser> getCurrentUser() async {
    _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.currentUser();
  }

  //Firebase Data base FireStore

  Stream<QuerySnapshot> getEventos(){
    _fireStoreDB = Firestore.instance;

    return _fireStoreDB.collection("/eventos").snapshots();
  }


}
