
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/faluer_type.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_now_playing_use_case.dart';
import 'get_movies_event.dart';
import 'get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;


  GetMoviesBloc({
    required this.getNowPlayingUseCase,
   }) : super(GetMoviesInitial()) {
    on<GetMoviesEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetNowPlayingEvent) {
        emit(LoadingGetNowPlaying());
        final failureOrPosts = await getNowPlayingUseCase.call();
        failureOrPosts.fold(
          //left
          (Failure failure) {
            emit(ErrorGetNowPlaying(
                errorMassage: _mapFailureToMessage(failure)));
          },
          //right
          (List<Movie> movies) {
            emit(LoadedGetNowPlaying(movies: movies));
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
