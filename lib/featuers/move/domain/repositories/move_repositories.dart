import 'package:dartz/dartz.dart';
import 'package:move/featuers/move/domain/entities/movie.dart';
import '../../../../core/error/faluer_type.dart';
import '../entities/movie_details.dart';
import '../entities/recommendations.dart';

abstract class MovieRepositories {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails({required int id});

  Future<Either<Failure,  List<Recommendations>>> getRecommendations({required int id });
}
