import 'package:provider_architecutre/core/enums/view_state.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/posts_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}