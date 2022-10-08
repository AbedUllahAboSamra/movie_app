import 'package:move/featuers/move/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });


  factory GenresModel.fromJson({required Map<String, dynamic> json}) {
   return  GenresModel(
        id: int.parse(json['id'].toString()) ,
       name: json["name"] ,
    );
  }
}
