import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EssileVraiFirebaseUser {
  EssileVraiFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

EssileVraiFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EssileVraiFirebaseUser> essileVraiFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EssileVraiFirebaseUser>(
      (user) {
        currentUser = EssileVraiFirebaseUser(user);
        return currentUser!;
      },
    );
