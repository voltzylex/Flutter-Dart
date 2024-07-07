import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right("Sign in Successful");
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      final data = await auth.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      store.collection("users").add({
        "name": createUserReq.fullName,
        "email": data.user?.email,
        "password": createUserReq.password
      });
      return const Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }
}
