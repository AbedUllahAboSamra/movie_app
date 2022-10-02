

import 'package:dartz/dartz.dart';
import 'package:move/core/error/Failure.dart';
import 'package:move/featuers/move/domain/entities/movie.dart';

abstract class MoveRepositories {

  Future<Either<Failure , List<Movie>>> getNowPlaying ();

  Future<Either<Failure , List<Movie>>> getPopularMovies ();

  Future<Either<Failure , List<Movie>>> getTopRatedMovies ();
}
