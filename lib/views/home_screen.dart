import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/models/post_model.dart';
import 'package:flutter_prj_mj/viewmodels/authentication_view_model.dart';
import 'package:flutter_prj_mj/viewmodels/post_view_model.dart';
import 'package:flutter_prj_mj/widgets/mood.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends ConsumerWidget {
  static String routeURL = "/";
  static String routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(postsProvider).when(
            data: (posts) {
              posts.sort((a, b) => b.postTime.compareTo(a.postTime));
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  Color borderColor = moodColors[post.mood.index];
                  return InkWell(
                    onTap: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Post'),
                          content: const Text(
                              'Are you sure you want to delete this post?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        final postViewModel = ref.read(postViewModelProvider);

                        await postViewModel.deletePost(
                            post.userId, post.postId);

                        ref.refresh(postsProvider);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 1.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            title: Text(post.text ?? "",
                                style: TextStyle(
                                    color: borderColor,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(post.mood.name,
                                style: TextStyle(color: borderColor)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            timeago.format(post.postTime),
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                        const Divider(
                          height: 20,
                          thickness: 0.1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Error: $error')),
          ),
    );
  }
}

final postsProvider = FutureProvider.autoDispose<List<PostModel>>((ref) {
  final postViewModel = ref.read(postViewModelProvider);
  final String userId =
      ref.read(authProvider.notifier).getCurrentUserId() ?? '';
  return postViewModel.getPosts(userId);
});
