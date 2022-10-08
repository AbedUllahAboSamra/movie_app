part of 'get_movie_details_bloc.dart';

abstract class GetMovieDetailsEvent extends Equatable {
  const GetMovieDetailsEvent();
}

class GetDetailsEvent extends GetMovieDetailsEvent {
  final int id;

  const GetDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class GetRecommendationsEvent extends GetMovieDetailsEvent {
  final int id;

  const GetRecommendationsEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
