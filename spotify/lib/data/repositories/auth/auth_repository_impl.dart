import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserReq createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
