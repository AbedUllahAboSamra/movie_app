import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move/featuers/move/domain/entities/movie.dart';
import 'package:move/featuers/move/domain/repositories/move_repositories.dart';

import '../../../../core/error/Failure.dart';

class GetNowPlayingUseCase {
  final MoveRepositories repository;

  GetNowPlayingUseCase({required this.repository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getNowPlaying();
  }
}
