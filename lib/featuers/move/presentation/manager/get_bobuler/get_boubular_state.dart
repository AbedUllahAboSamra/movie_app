part of 'get_boubular_bloc.dart';


abstract class GetBoubularState  extends Equatable{
  const GetBoubularState();
}

class GetBoubularInitial extends GetBoubularState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


// ' get popular'


class LoadingGetPopular extends GetBoubularState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedGetPopular extends GetBoubularState {
  final List<Movie> movies;

  const LoadedGetPopular({
    required this.movies,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class ErrorGetPopular extends GetBoubularState {
  final String errorMassage;

  const ErrorGetPopular({
    required this.errorMassage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [errorMassage];
}