import 'package:dartz/dartz.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

import '../../../../../core/error/faluer_type.dart';
import '../../entities/movie_details.dart';

class GetMovieDetailsUseCase {
  final MovieRepositories movieRepositories;

  GetMovieDetailsUseCase({
    required this.movieRepositories,
  });

  Future<Either<Failure ,  MovieDetails>> call({required int id }) async {
    return await movieRepositories.getMovieDetails(id: id);
  }

}
