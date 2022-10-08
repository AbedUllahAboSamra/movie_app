import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move/featuers/move/domain/entities/recommendations.dart';
import 'package:move/featuers/move/domain/use_cases/details/get_recommendations_use_case.dart';
import '../../../../../core/error/faluer_type.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/use_cases/details/get_movie_details_use_case.dart';

part 'get_movie_details_event.dart';

part 'get_movie_details_state.dart';

class GetMovieDetailsBloc
    extends Bloc<GetMovieDetailsEvent, GetMovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetails? movieDetails;
  List<Recommendations>? recommendations;

  static GetMovieDetailsBloc get(context) => BlocProvider.of(context);

  GetMovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getRecommendationUseCase,
  }) : super(GetMovieDetailsInitial()) {
    on<GetDetailsEvent>((event, emit) async {
      log('GetMovieDetailsEvent');


        emit(LoadingMovieDetailsState());
        var movieDetailsOrFailure =
            await getMovieDetailsUseCase.call(id: event.id);
        movieDetailsOrFailure.fold(
          (failure) {
            emit(ErrorMovieDetailsState(error: _mapFailureToMessage(failure)));
          },
          (movieDetails) {
            log('movie details success');
            this.movieDetails = movieDetails;
            emit(LoadedMovieDetailsState());
          },
        );

    });
    on<GetRecommendationsEvent>((event, emit) async {
      log('GetRecommendationsEvent');
      emit(LoadingRecommendationState());

      var recommendationDetailsOrFailure =
          await getRecommendationUseCase.call(id: event.id);
      recommendationDetailsOrFailure.fold(
        (failure) {
          log(' failure failure');

          emit(ErrorRecommendationState(error: _mapFailureToMessage(failure)));
        },
        (recommendations) {
          log('recommendations  success');
          this.recommendations = recommendations;
          emit(LoadedRecommendationState());
        },
      );
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
