

import 'package:dartz/dartz.dart';
 import 'package:move/featuers/move/domain/entities/movie.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

import '../../../../core/error/faluer_type.dart';


class GetPopularMoviesUseCase {
  final MovieRepositories repository;
  GetPopularMoviesUseCase({required this.repository});


  Future <Either<Failure,List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}