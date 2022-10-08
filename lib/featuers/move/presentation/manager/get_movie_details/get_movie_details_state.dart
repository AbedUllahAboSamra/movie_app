part of 'get_movie_details_bloc.dart';

abstract class GetMovieDetailsState extends Equatable {
  const GetMovieDetailsState();
}

class GetMovieDetailsInitial extends GetMovieDetailsState {
  @override
  List<Object> get props => [];
}

class LoadedMovieDetailsState extends GetMovieDetailsState {


  @override
  // TODO: implement props
  List<Object?> get props => [ ];
}

class LoadingMovieDetailsState extends GetMovieDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorMovieDetailsState extends GetMovieDetailsState {
  final String error;

  const ErrorMovieDetailsState({
    required this.error,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}


class LoadedRecommendationState extends GetMovieDetailsState {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingRecommendationState extends GetMovieDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorRecommendationState extends GetMovieDetailsState {
  final String error;

  const ErrorRecommendationState({
    required this.error,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
