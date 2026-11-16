import '../../../../core/network/result.dart';
import '../entity/user_entity.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<Result<void>> call(UserEntity entity) async{
    return await authRepo.register(entity);
  }
}
