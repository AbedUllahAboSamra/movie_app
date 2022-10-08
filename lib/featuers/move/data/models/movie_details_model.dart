import 'package:move/featuers/move/data/models/genres_model.dart';
import 'package:move/featuers/move/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailsModel.fromJson({required Map<String, dynamic> json}) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'] ,
      id: int.parse(json['id'].toString()),
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: int.parse(json['runtime'].toString()),
      title: json['title'],
      voteAverage: double.parse(json['vote_average'].toString()),
      genres: List.from(json['genres'] as List).map((e) {
        return GenresModel.fromJson(json: e );
      }).toList(),
    );
  }
}
