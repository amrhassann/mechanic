import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/features/q_and_a/controller/controller.dart';
import 'package:mechanic/features/q_and_a/view/widgets/questions_list.dart';
import 'package:mechanic/widgets/loading/main_loading.dart';

import 'widgets/no_questions.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('الاسئلة الشائعة'),
            ),
            body: controller.loading
                ? const MainLoading()
                : controller.questions.isEmpty
                    ? const NoQuestions()
                    : QuestionsList(
                        questions: controller.questions,
                      ),
          );
        });
  }
}
