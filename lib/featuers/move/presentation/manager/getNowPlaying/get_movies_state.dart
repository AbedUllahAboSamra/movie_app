


import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';

abstract class GetMoviesState extends Equatable {

  const GetMoviesState();
}

class GetMoviesInitial extends GetMoviesState {
  @override
  List<Object> get props => [];
}


// 'get now playing'
class LoadingGetNowPlaying extends GetMoviesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedGetNowPlaying extends GetMoviesState {
  final List<Movie> movies;
  const LoadedGetNowPlaying({required this.movies});
  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class ErrorGetNowPlaying extends GetMoviesState {
  final String errorMassage;

  const ErrorGetNowPlaying({required this.errorMassage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMassage];
}

