import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUsecase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? param}) async {
    return sl<AuthRepository>().signIn(param!);
  }
}
