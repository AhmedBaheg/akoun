import 'package:akoun/features/island/data/model/island_model.dart';

import '../../../../domain/entity/island_entity.dart';

abstract class ApiIslandRemoteDataSource {

  Future<List<IslandModel>> getIslandList();

}