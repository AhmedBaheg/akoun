import 'package:akoun/features/auth/data/model/user_model.dart';

abstract class ApiAuthRemoteDataSource {

  Future<void> register(UserModel userModel);
  Future<void> login(UserModel userModel);

}