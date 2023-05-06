import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/functions.dart';
import 'package:mechanic/data/data_sources/questions_remote_data_source.dart';
import 'package:mechanic/data/models/question_model/question_model.dart';

class QuestionsController extends GetxController {

  final BaseQuestionsDataSource _source = QuestionsDataSource();
  bool loading= true;

  changeLoadingValue(){
    loading = !loading;
    update();
  }

  List<QuestionModel> questions = [];

  getQuestions() async{
    final result = await _source.getQuestions();
    if(result.requestState == RequestState.success){
      changeLoadingValue();
      questions = result.data!;
    }else{
      changeLoadingValue();
      Get.back();
      snackBarError(result.errorMessage??"Error");
    }

  }



  @override
  void onInit() {
    getQuestions();
    super.onInit();
  }


}

