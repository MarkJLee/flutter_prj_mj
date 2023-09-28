import 'package:flutter/material.dart';
import 'package:flutter_prj_mj/viewmodels/authentication_view_model.dart';
import 'package:flutter_prj_mj/viewmodels/post_view_model.dart';
import 'package:flutter_prj_mj/views/main_screen.dart';
import 'package:flutter_prj_mj/widgets/mood.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _postInputController = TextEditingController();

  String? _postInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'input your feeling';
    }
    if (value.split(' ').length > 50) {
      return 'Please write in under 50 words.';
    }
    return null;
  }

  Future<void> _onPressedPost(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState?.validate() == true) {
      Mood selectedMood = Mood.values[_currentSliderValue.toInt()];
      final String userId =
          ref.read(authProvider.notifier).getCurrentUserId() ?? '';
      final postViewModel = ref.read(postViewModelProvider);

      await postViewModel.addPost(
          _postInputController.text, selectedMood, userId, null);

      ref.read(selectedIndexProvider.notifier).state = 0;
    }
  }

  double _currentSliderValue = Mood.neutral.index.toDouble();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "How do you feel?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: TextFormField(
                  controller: _postInputController,
                  maxLines:
                      10, // maxLines를 null로 설정하면 사용자가 입력할 때마다 자동으로 높이가 조절됩니다.
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'insert your feeling here...',
                    border: OutlineInputBorder(), // 테두리를 추가합니다.
                  ),
                  validator: (value) => _postInputValidator(value),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: Mood.values.length.toDouble() - 1,
                    divisions: Mood.values.length - 1,
                    label: Mood.values[_currentSliderValue.toInt()].name,
                    activeColor: moodColors[_currentSliderValue.toInt()],
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  Text(
                    'Selected Mood: ${Mood.values[_currentSliderValue.toInt()].name}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: moodColors[_currentSliderValue
                              .toInt()], // 선택된 Mood에 따라 색상을 변경합니다.
                        ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _onPressedPost(context, ref),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Post'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
