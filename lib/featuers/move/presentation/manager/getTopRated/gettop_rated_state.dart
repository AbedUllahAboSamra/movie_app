part of 'gettop_rated_bloc.dart';

abstract class GettopRatedState extends Equatable {
  const GettopRatedState();
}

class GettopRatedInitial extends GettopRatedState {
  @override
  List<Object> get props => [];
}

// ' get top rated'


class LoadingGetTopRated extends GettopRatedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedGetTopRated extends GettopRatedState {
  final List<Movie> movies;

  const LoadedGetTopRated({
    required this.movies,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class ErrorGetTopRated extends GettopRatedState {
  final String errorMassage;

  const ErrorGetTopRated({
    required this.errorMassage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [errorMassage];
}
