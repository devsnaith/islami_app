import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/app_intro/pages/app_intro.dart';
import 'package:islami_app/fetching_data/cubit/fetch_cubit.dart';
import 'package:islami_app/users_displayer/pages/users_list.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatefulWidget {
  const IslamiApp({super.key});

  @override
  State<IslamiApp> createState() => _IslamiAppState();
}

class _IslamiAppState extends State<IslamiApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCubit(),
      child: const MaterialApp(
        home: IslamiIntro(),
      ),
    );
  }
}
