import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prj_mj/models/post_model.dart';
import 'package:flutter_prj_mj/widgets/feeling.dart';
import 'package:flutter_prj_mj/widgets/mood.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPost(
      String text, Mood mood, String userId, List<Feeling>? feeling) async {
    final postId =
        _db.collection('posts').doc(userId).collection('userPosts').doc().id;

    final postModel = PostModel(
      userId: userId,
      postId: postId,
      text: text,
      postTime: DateTime.now(),
      mood: mood,
      feeling: feeling,
    );

    final post = postModel.toJson();
    await _db
        .collection('posts')
        .doc(userId)
        .collection('userPosts')
        .doc(postId)
        .set(post);
  }

  Future<void> deletePost(String userId, String postId) async {
    await _db
        .collection('posts')
        .doc(userId)
        .collection('userPosts')
        .doc(postId)
        .delete();
  }

  Future<List<PostModel>> getPosts(String userId) async {
    final querySnapshot =
        await _db.collection('posts').doc(userId).collection('userPosts').get();

    final posts = querySnapshot.docs
        .map((doc) => PostModel.fromJson(doc.data()))
        .toList();

    return posts;
  }
}

final postRepoProvider = Provider((ref) => PostRepository());
