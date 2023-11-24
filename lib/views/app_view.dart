import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/app_blocs.dart';
import 'package:test_project/blocs/app_state.dart';
import 'package:test_project/services/remote_services.dart';
import 'package:test_project/views/home/home_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => RemoteServices(),
        child: HomeView(),
      ),
    );
  }
}
