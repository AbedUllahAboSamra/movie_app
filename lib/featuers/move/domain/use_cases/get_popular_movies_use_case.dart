

import 'package:dartz/dartz.dart';
import 'package:move/core/error/Failure.dart';
import 'package:move/featuers/move/domain/entities/movie.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

class GetPopularMoviesUseCase {
  final MoveRepositories repository;
  GetPopularMoviesUseCase({required this.repository});


  Future <Either<Failure,List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}