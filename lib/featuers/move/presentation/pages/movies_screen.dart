 import 'package:move/featuers/move/presentation/widgets/now_playing_component.dart';
import 'package:move/featuers/move/presentation/widgets/pobuler_component.dart';
import 'package:move/featuers/move/presentation/widgets/top_rated_component.dart';
import 'package:flutter/material.dart';
import '../widgets/space_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingComponent(),
            SpaceComponent(title: 'Popular'),
            const PopularComponent(),
            SpaceComponent(title: 'Top Rated'),
            const TopRatedComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
