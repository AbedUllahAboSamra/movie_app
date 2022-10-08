import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:move/featuers/move/presentation/manager/getNowPlaying/get_movies_bloc.dart';
import 'package:move/featuers/move/presentation/manager/getNowPlaying/get_movies_event.dart';
import 'package:move/featuers/move/presentation/manager/getTopRated/gettop_rated_bloc.dart';
import 'package:move/featuers/move/presentation/manager/get_bobuler/get_boubular_bloc.dart';
import 'package:move/featuers/move/presentation/manager/get_movie_details/get_movie_details_bloc.dart';
import 'asd.dart';
import 'core/theme/app_theme.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static void changeLanguage({
    required BuildContext context,
    required Locale locale,
  }) {
    _MyAppState _myAppState = context.findAncestorStateOfType<_MyAppState>()!;
    _myAppState.changeLanguage(locale: locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _appLocale = const Locale('en', '');

  void changeLanguage({
    required Locale locale,
  }) {
    setState(() {
      _appLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<GetMoviesBloc>()
            ..add(GetNowPlayingEvent()),),
        BlocProvider(
          create: (_) => di.sl<GetBoubularBloc>()
            ..add(GetPopularEvent()),),
        BlocProvider(
          create: (_) => di.sl<GettopRatedBloc>()
            ..add(GetTopRatedEvent()),),
    BlocProvider(
    create: (_) => di.sl<GetMovieDetailsBloc>()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''),
          Locale('en', ''),
        ],
        locale: _appLocale,
        title: 'Flutter Demo',
        theme: appTheme,
        home: asd(),
      ),
    );
  }
}
