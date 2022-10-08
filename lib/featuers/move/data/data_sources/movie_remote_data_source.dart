import 'dart:convert';
import 'package:move/core/api/api_settings.dart';
import 'package:move/core/error/exception.dart';
import 'package:move/featuers/move/data/models/movie_details_model.dart';
import 'package:move/featuers/move/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:move/featuers/move/data/models/recommendations_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRelatedMovie();

  Future<MovieDetailsModel> getMovieDetails({
    required int id,
    String language = "en-US",
  });

  Future<List<RecommendationsModel>> getRecommendations({
  required int id
});

}

class MoveRemoteDataSourceImpl extends MovieRemoteDataSource {
  final http.Client client;

  MoveRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlaying(
      {String language = "en-US", int page = 1}) async {
    return _sharedMethod(
      endPointApi: ApiSettings.NOW_PLAYING,
    );
  }

  @override
  Future<List<MovieModel>> getPopularMovie(
      {String language = "en-US", int page = 1}) async {
    return _sharedMethod(
      endPointApi: ApiSettings.POPULAR_MOVIE,
    );
  }

  @override
  Future<List<MovieModel>> getTopRelatedMovie(
      {String language = "en-US", int page = 1}) async {
    return _sharedMethod(
      endPointApi: ApiSettings.TOP_RATED,
    );
  }

  // shared in multi method top
  Future<List<MovieModel>> _sharedMethod({
    required String endPointApi,
    String key = 'results',
    String language = "en-US",
    int page = 1,
  }) async {
    String url =
        "$endPointApi?api_key=${ApiSettings
        .API_KEY}&language=$language&page=$page";
    print("ASD  $url");
    var uri = Uri.parse(url);
    final response = await client.get(
      uri,
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var list = List.from(data[key] as List)
          .map((e) => MovieModel.fromJson(json: e))
          .toList();
      return list;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({
    required int id,
    String language = "en-US",
  }) async {
    String url =
        "${ApiSettings.MOVIE_DETAILS}/$id?api_key=${ApiSettings
        .API_KEY}&language=$language";
    print("ASD  $url");
    var uri = Uri.parse(url);
    final response = await client.get(uri);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("datatdatata  ${data.toString()}");

      return MovieDetailsModel.fromJson(json: data);
    } else {
      throw Exception();
    }
  }


  @override
  Future<List<RecommendationsModel>> getRecommendations(
      {required int id }) async {
    String url =
        "${ApiSettings.MOVIE_DETAILS}/$id/recommendations?api_key=${ApiSettings
        .API_KEY}&language=en-US&page=1";
    print("ASDASDSAD  $url");
    var uri = Uri.parse(url);
    final response = await client.get(
      uri,
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var list = List.from(data['results'] as List)
          .map((e) => RecommendationsModel.fromJson(json: e))
          .toList();
      return list;
    } else {
      throw ServerException();
    }
  }


}
