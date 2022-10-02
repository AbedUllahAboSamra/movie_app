import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String originalTitle;
  final String backDropPath;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.backDropPath,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    originalTitle,
    backDropPath,
    overview,
    genreIds,
    voteAverage,
    voteCount,
    releaseDate,
  ];
}
