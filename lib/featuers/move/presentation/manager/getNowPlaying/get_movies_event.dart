

import 'package:equatable/equatable.dart';


abstract class GetMoviesEvent extends Equatable {
  const GetMoviesEvent();
}


class GetNowPlayingEvent extends GetMoviesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



