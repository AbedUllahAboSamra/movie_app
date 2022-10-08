import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/faluer_type.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/use_cases/get_top_rated_moves_use_case.dart';

part 'gettop_rated_event.dart';

part 'gettop_rated_state.dart';

class GettopRatedBloc extends Bloc<GettopRatedEvent, GettopRatedState> {
  final GetTopRatedMovesUseCase getTopRatedMovesUseCase;

  GettopRatedBloc({required this.getTopRatedMovesUseCase})
      : super(GettopRatedInitial()) {
    on<GettopRatedEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetTopRatedEvent) {
        print("GetTopRatedEvent evint is ");
        emit(LoadingGetTopRated());
        final failureOrPosts = await getTopRatedMovesUseCase.call();

        failureOrPosts.fold(
          //left
          (Failure failure) {
            emit(ErrorGetTopRated(errorMassage: _mapFailureToMessage(failure)));
          },
          //right
          (List<Movie> movies) {
             emit(LoadedGetTopRated(movies: movies));
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
