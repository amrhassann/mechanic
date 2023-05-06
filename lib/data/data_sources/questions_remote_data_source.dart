import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/networking/request_result.dart';
import 'package:mechanic/data/models/question_model/question_model.dart';

abstract class BaseQuestionsDataSource {
  Future<RequestResult<List<QuestionModel>>> getQuestions();
}

class QuestionsDataSource implements BaseQuestionsDataSource {
  @override
  Future<RequestResult<List<QuestionModel>>> getQuestions() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('questions').get();
      final questions = snapshot.docs
          .map((doc) => QuestionModel.fromJson(doc.data()))
          .toList();
      return RequestResult(
        requestState: RequestState.success,
        data: questions,
      );
    } catch (e) {
      log('Error retrieving questions: $e');
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.toString(),
      );
    }
  }
}
