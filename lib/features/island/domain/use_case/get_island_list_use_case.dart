import '../../../../core/network/result.dart';
import '../entity/island_entity.dart';
import '../repo/island_repo.dart';

class GetIslandListUseCase {

  final IslandRepo islandRepo;

  GetIslandListUseCase({required this.islandRepo});

  Future<Result<List<IslandEntity>>> call() async{
    return await islandRepo.getIslandList();
  }

}