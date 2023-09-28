import 'dart:async';

import 'package:flutter_prj_mj/services/post_repo.dart';
import 'package:flutter_prj_mj/widgets/feeling.dart';
import 'package:flutter_prj_mj/widgets/mood.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel {
  final PostRepository _postRepo;

  PostViewModel(this._postRepo);

  Future<void> addPost(
      String text, Mood mood, String userId, List<Feeling>? feeling) {
    return _postRepo.addPost(text, mood, userId, feeling);
  }

  Future<void> deletePost(String userId, String postId) {
    return _postRepo.deletePost(userId, postId);
  }
}

final postViewModelProvider =
    Provider((ref) => PostViewModel(ref.read(postRepoProvider)));
