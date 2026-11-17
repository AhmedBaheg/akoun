import 'package:akoun/features/island/domain/repo/child_repo.dart';

import '../../../../core/network/result.dart';
import '../entity/child_entity.dart';

class GetChildProfileUseCase {

  final ChildRepo childRepo;

  GetChildProfileUseCase({required this.childRepo});

  Future<Result<ChildEntity>> getChildProfile() async {
    return childRepo.getChildProfile();
  }

}