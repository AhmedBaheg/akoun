import '../../../../core/network/result.dart';
import '../entity/user_entity.dart';
import '../repo/auth_repo.dart';

class LoginUseCase {

  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Result<void>> call(UserEntity entity) async {
    return await authRepo.login(entity);
  }
}