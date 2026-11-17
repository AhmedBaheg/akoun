
import '../../../model/child_model.dart';

abstract class ApiProfileRemoteDataSource {
  Future<ChildModel> getChildProfile();
}