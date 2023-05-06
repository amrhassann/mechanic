class QuestionModel {
  final String q;
  final String a;
  final List<String> images;

  QuestionModel({
    required this.q,
    required this.a,
    required this.images,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      q: json['q'],
      a: json['a'],
      images: json['images'] != null ? List.from(json['images']) : [],
    );
  }
}
