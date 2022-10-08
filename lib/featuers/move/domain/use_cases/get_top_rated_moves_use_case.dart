

import 'package:dartz/dartz.dart';
 import 'package:move/featuers/move/domain/entities/movie.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

import '../../../../core/error/faluer_type.dart';

class GetTopRatedMovesUseCase {

  final MovieRepositories repository ;

  GetTopRatedMovesUseCase({required this.repository});

  Future <Either<Failure , List<Movie>>> call() async {
    return await repository.getTopRatedMovies();
  }
}