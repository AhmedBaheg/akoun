import 'package:akoun/core/network/result.dart';

import '../entity/child_entity.dart';


abstract class ChildRepo {

  Future<Result<ChildEntity>> getChildProfile();

}