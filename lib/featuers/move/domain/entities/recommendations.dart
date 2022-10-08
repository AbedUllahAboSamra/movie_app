import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String? backDropPath;

  final int id;

  const Recommendations({required this.backDropPath, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backDropPath,
        id,
      ];
}
