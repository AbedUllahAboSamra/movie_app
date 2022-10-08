import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move/featuers/move/presentation/manager/get_bobuler/get_boubular_bloc.dart';
import 'package:move/featuers/move/presentation/pages/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_settings.dart';
import '../../domain/entities/movie.dart';
import '../manager/getNowPlaying/get_movies_bloc.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBoubularBloc, GetBoubularState>(
        builder: (context, state) {

          return  state is LoadedGetPopular ?  FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount:  state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>MovieDetailScreen(id:movie.id )));
                       },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(
                            8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiSettings.BASE_URL_IMAGE +
                              movie.backDropPath!,
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ) :
          Center(child: CircularProgressIndicator(),);
        });
  }
}
