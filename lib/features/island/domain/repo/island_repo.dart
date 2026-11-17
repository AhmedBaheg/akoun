import 'package:akoun/core/network/result.dart';

import '../entity/island_entity.dart';

abstract class IslandRepo {

  Future<Result<List<IslandEntity>>> getIslandList();

}