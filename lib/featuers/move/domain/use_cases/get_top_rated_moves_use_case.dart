

import 'package:dartz/dartz.dart';
import 'package:move/core/error/Failure.dart';
import 'package:move/featuers/move/domain/entities/movie.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

class GetTopRatedMovesUseCase {

  final MoveRepositories repository ;

  GetTopRatedMovesUseCase({required this.repository});

  Future <Either<Failure , List<Movie>>> call() async {
    return await repository.getTopRatedMovies();
  }
}