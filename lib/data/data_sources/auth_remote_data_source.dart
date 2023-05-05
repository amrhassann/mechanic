import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/networking/request_result.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';

abstract class BaseAuthRemoteDataSource {
  Future<RequestResult<UserCredential>> signUp({
    required String email,
    required String pass,
  });

  Future<RequestResult<UserCredential>> login({
    required String email,
    required String pass,
  });

  Future<void> logout();
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  @override
  Future<RequestResult<UserCredential>> signUp({
    required String email,
    required String pass,
  }) async {
    late UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return RequestResult(
        requestState: RequestState.success,
        data: credential,
      );
    } on FirebaseAuthException catch (e) {
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<RequestResult<UserCredential>> login(
      {required String email, required String pass}) async {
    late UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return RequestResult(
        requestState: RequestState.success,
        data: credential,
      );
    } on FirebaseAuthException catch (e) {
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<void> logout() async {
// sign out user from Firebase Auth
    await FirebaseAuth.instance.signOut();

    // delete user from Hive box
    HiveHelper.logoutUser();
  }
}
