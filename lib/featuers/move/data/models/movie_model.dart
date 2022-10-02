import 'package:move/featuers/move/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.backDropPath,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.voteCount,
    required super.releaseDate,
  });

  factory MovieModel.fromJson({required Map<String, dynamic> json}) =>
      MovieModel(
        id: json['id'],
        title:  json['title'],
        originalTitle:  json['original_title'],
        backDropPath:  json['backdrop_path'],
        overview:  json['overview'],
        genreIds:  List<int>.from(json['genre_ids']).map((e) => e).toList(),
        voteAverage:  json['vote_average'],
        voteCount:  json['vote_count'],
        releaseDate:  json['release_date'],
      );



}
