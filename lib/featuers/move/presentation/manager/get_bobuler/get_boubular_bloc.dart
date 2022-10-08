import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/faluer_type.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_popular_movies_use_case.dart';

part 'get_boubular_event.dart';
part 'get_boubular_state.dart';

class GetBoubularBloc extends Bloc<GetBoubularEvent, GetBoubularState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  GetBoubularBloc({required this.getPopularMoviesUseCase}) : super(GetBoubularInitial()) {
    on<GetBoubularEvent>((event, emit) async {
      if (event is GetPopularEvent) {
        print('event is Get Pet Popular Event');
        emit(LoadingGetPopular());
        final failureOrPosts = await getPopularMoviesUseCase.call();
        failureOrPosts.fold(
          //left
              (Failure failure) {
            print('Failure');
            emit(ErrorGetPopular(errorMassage: _mapFailureToMessage(failure)));
          },
          //right
              (List<Movie> movies) {
            print('movies Success');
            print(movies.length.toString() + "ASADDSSA");
            emit(LoadedGetPopular(movies: movies));
          },
        );
      }
    });
  }

  // get failure String Message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
