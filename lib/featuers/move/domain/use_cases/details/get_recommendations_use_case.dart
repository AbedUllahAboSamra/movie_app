import 'package:dartz/dartz.dart';
import 'package:move/core/error/faluer_type.dart';
import 'package:move/featuers/move/domain/entities/movie_details.dart';
import 'package:move/featuers/move/domain/entities/recommendations.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

class GetRecommendationUseCase {
  final MovieRepositories movieRepositories;

  const GetRecommendationUseCase({
    required this.movieRepositories,
  });


  Future<Either<Failure , List<Recommendations>>> call({required int id }) async {
    return await movieRepositories.getRecommendations(id: id);
  }

}
