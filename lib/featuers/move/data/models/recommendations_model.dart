import 'package:flutter/foundation.dart';
import 'package:move/featuers/move/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.backDropPath, required super.id});

  factory RecommendationsModel.fromJson({required Map<String, dynamic> json}) {
    return RecommendationsModel(
      backDropPath: json['backdrop_path'],
      id: json['id'].toInt(),
    );
  }
}
