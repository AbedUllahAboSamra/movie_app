import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:move/featuers/move/data/data_sources/movie_local_data_source.dart';
import 'package:move/featuers/move/data/data_sources/movie_remote_data_source.dart';
import 'package:move/featuers/move/data/repositories/movie_repositories_impl.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';
import 'package:move/featuers/move/domain/use_cases/details/get_recommendations_use_case.dart';
import 'package:move/featuers/move/domain/use_cases/get_now_playing_use_case.dart';
import 'package:move/featuers/move/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:move/featuers/move/domain/use_cases/get_top_rated_moves_use_case.dart';
import 'package:move/featuers/move/presentation/manager/getNowPlaying/get_movies_bloc.dart';
import 'package:move/featuers/move/presentation/manager/get_movie_details/get_movie_details_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'featuers/move/domain/use_cases/details/get_movie_details_use_case.dart';
import 'featuers/move/presentation/manager/getTopRated/gettop_rated_bloc.dart';
import 'featuers/move/presentation/manager/get_bobuler/get_boubular_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - movie

  // - Bloc
  sl.registerFactory(() => GetMoviesBloc(getNowPlayingUseCase: sl()));
  sl.registerFactory(() => GettopRatedBloc(getTopRatedMovesUseCase: sl()));
  sl.registerFactory(() => GetBoubularBloc(getPopularMoviesUseCase: sl()));
  sl.registerFactory(() => GetMovieDetailsBloc(
      getMovieDetailsUseCase: sl(),
      getRecommendationUseCase: sl<GetRecommendationUseCase>()));

  //Use Case
  sl.registerLazySingleton<GetNowPlayingUseCase>(
      () => GetNowPlayingUseCase(repository: sl.get<MovieRepositories>()));
  sl.registerLazySingleton<GetPopularMoviesUseCase>(
      () => GetPopularMoviesUseCase(repository: sl.get<MovieRepositories>()));
  sl.registerLazySingleton<GetTopRatedMovesUseCase>(
      () => GetTopRatedMovesUseCase(repository: sl.get<MovieRepositories>()));

  sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(
        movieRepositories: sl.get<MovieRepositories>(),
      ));
  sl.registerLazySingleton<GetRecommendationUseCase>(
      () => GetRecommendationUseCase(
            movieRepositories: sl.get<MovieRepositories>(),
          ));

// Repository

  sl.registerLazySingleton<MovieRepositories>(() => MovieRepositoriesImpl(
      remoteDataSource: sl.get<MovieRemoteDataSource>(),
      networkInfo: sl.get<NetworkInfo>()));

// Datasources

  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MoveRemoteDataSourceImpl(client: sl.get<http.Client>()));
  // sl.registerLazySingleton<MovieLocalDataSource>(
  //         () => MovieLocalDataSourceImple(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl.get<InternetConnectionChecker>()));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
