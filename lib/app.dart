import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/theme/theme_cubit.dart';
import 'package:test_project/services/remote_services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_project/views/home/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeData? theme;

          if (state.themeMode == ThemeMode.dark) {
            theme = ThemeData.dark();
          } else if (state.themeMode == ThemeMode.light) {
            theme = ThemeData.light();
          }

          return MaterialApp(
            themeMode: state.themeMode,
            theme: theme,
            home: AnimatedSplashScreen(
              splash: Image.asset(
                'assets/Image-3.png',
              ),
              nextScreen: RepositoryProvider(
                create: (context) => RemoteServices(),
                child: const HomeView(),
              ),
              splashIconSize: 250,
              splashTransition: SplashTransition.rotationTransition,
              pageTransitionType: PageTransitionType.bottomToTop,
              curve: Curves.bounceOut,
              duration: 500,
              animationDuration: const Duration(
                milliseconds: 1500,
              ),
            ),
          );
        },
      ),
    );
  }
}
