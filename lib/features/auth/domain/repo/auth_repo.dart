import 'package:akoun/core/network/result.dart';

import '../entity/user_entity.dart';

abstract class AuthRepo {

  Future<Result<void>> register(UserEntity entity);
  Future<Result<void>> login(UserEntity entity);

}