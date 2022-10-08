import 'package:dartz/dartz.dart';
import 'package:move/core/error/exception.dart';
import 'package:move/core/network/network_info.dart';
import 'package:move/featuers/move/domain/entities/movie.dart';
import 'package:move/featuers/move/domain/entities/movie_details.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';
import '../../../../core/error/faluer_type.dart';
import '../../domain/entities/recommendations.dart';
import '../data_sources/movie_remote_data_source.dart';

class MovieRepositoriesImpl extends MovieRepositories {
  final NetworkInfo networkInfo;

  //final MovieLocalDataSource localDataSource;
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoriesImpl({
    // required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final movieRemote = await remoteDataSource.getNowPlaying();
        //    localDataSource.cacheMovie(movieRemote);
        return Right(movieRemote);
      } on ServerException catch (ex, _) {
        //   print(ex.message.statusMessage);
        return Left(ServerFailure());
      }
    } else {
      try {
        //  final movieLocalList = await localDataSource.getCachedMovie(
        //      key: CachedKey.nowPlaying.name);
        return Right([]);
      } on EmptyCacheException catch (ex, _) {
        //   print(ex.message);
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final movieRemote = await remoteDataSource.getPopularMovie();
        //   localDataSource.cacheMovie(movieRemote);
        return Right(movieRemote);
      } on ServerException catch (ex, _) {
        //   print(ex.message.statusMessage);
        return Left(ServerFailure());
      }
    } else {
      try {
        //    final movieLocalList = await localDataSource.getCachedMovie(
        //        key: CachedKey.popularMovie.name);
        return Right([]);
      } on EmptyCacheException catch (ex, _) {
        //      print(ex.message);
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final movieRemote = await remoteDataSource.getTopRelatedMovie();
        //  localDataSource.cacheMovie(movieRemote);
        return Right(movieRemote);
      } on ServerException catch (ex, _) {
        //   print(ex.message.statusMessage);
        return Left(ServerFailure());
      }
    } else {
      try {
        //    final movieLocalList =
        //      await localDataSource.getCachedMovie(key: CachedKey.topRated.name);
        return Right([]);
      } on EmptyCacheException catch (ex, _) {
//        print(ex.message);
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails({
    required int id,
  }) async {
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final movieDetails = await remoteDataSource.getMovieDetails(id: id);
       print("movie Details overview = ${movieDetails.overview}");
        return Right(movieDetails);
      } on ServerException catch (ex, _) {
        return Left(ServerFailure());
      }
    }else{
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure,  List<Recommendations>>> getRecommendations({required int id })  async {

    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final recommendations = await remoteDataSource.getRecommendations(id: id);

        return Right(recommendations);
      } on ServerException catch (ex, _) {
        return Left(ServerFailure());
      }
    }else{
      return Left(EmptyCacheFailure());
    }

  }
}
