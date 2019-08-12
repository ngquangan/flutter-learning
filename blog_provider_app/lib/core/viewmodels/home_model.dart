import 'package:provider_architecutre/core/enums/view_state.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}